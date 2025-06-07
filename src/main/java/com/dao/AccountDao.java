package com.dao;

import com.model.Account;
import com.util.SM3Util;

import javax.naming.NamingException;
import java.sql.*;
import java.util.Date;

public class AccountDao extends BaseDao {
    // 插入用户（带密码加密）
    public void insertAccount(Account account) throws Exception {
        String sql = "INSERT INTO account (" +
                "username, password, role, failed_times, lock_time, last_password_change_date) " +
                "VALUES (?, ?, ?, 0, NULL, ?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // 密码加密（SM3哈希）
            String encryptedPassword = SM3Util.encrypt(account.getPassword());

            pstmt.setString(1, account.getUsername());
            pstmt.setString(2, encryptedPassword);
            pstmt.setString(3, account.getRole());
            pstmt.setTimestamp(4, new Timestamp(account.getLastPasswordChangeDate().getTime()));

            pstmt.executeUpdate();
        }
    }

    // 更新用户密码（含密码强度校验）
    public void updatePassword(String username, String newPassword) throws Exception {
        // 密码强度校验
        if (!isPasswordValid(newPassword)) {
            throw new IllegalArgumentException("密码需8位以上，包含数字、大小写字母、特殊字符");
        }

        String sql = "UPDATE account SET " +
                "password = ?, " +
                "last_password_change_date = ?, " +
                "failed_times = 0, " +
                "lock_time = NULL " +
                "WHERE username = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            String encryptedPassword = SM3Util.encrypt(newPassword);

            pstmt.setString(1, encryptedPassword);
            pstmt.setTimestamp(2, new Timestamp(new Date().getTime()));
            pstmt.setString(3, username);

            int rows = pstmt.executeUpdate();
            if (rows == 0) {
                throw new SQLException("用户不存在");
            }
        }
    }

    // 用户登录验证（含锁定策略）
    public Account login(String username, String password) throws Exception {
        String sql = "SELECT * FROM account WHERE username = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (!rs.next()) {
                    return null; // 用户不存在
                }

                Account account = new Account();
                account.setId(rs.getLong("id"));
                account.setUsername(rs.getString("username"));
                account.setRole(rs.getString("role"));
                account.setFailedTimes(rs.getInt("failed_times"));
                account.setLockTime(rs.getTimestamp("lock_time"));
                account.setLastPasswordChangeDate(rs.getTimestamp("last_password_change_date"));

                // 检查账户锁定状态
                if (account.getLockTime() != null) {
                    long lockDuration = new Date().getTime() - account.getLockTime().getTime();
                    if (lockDuration < 30 * 60 * 1000) { // 30分钟锁定
                        throw new SQLException("账户已锁定，请30分钟后重试");
                    }
                }

                // 密码验证（SM3哈希比对）
                String storedHash = rs.getString("password");
                String inputHash = SM3Util.encrypt(password);

                if (!storedHash.equals(inputHash)) {
                    // 更新失败次数
                    updateFailedTimes(username);
                    throw new SQLException("密码错误");
                }

                // 清除失败次数
                resetFailedTimes(username);
                return account;
            }
        }
    }

    // 更新失败登录次数
    private void updateFailedTimes(String username) throws SQLException {
        String sql = "UPDATE account SET failed_times = failed_times + 1 " +
                "WHERE username = ? AND failed_times < 4"; // 最多记录4次失败

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, username);
            int rows = pstmt.executeUpdate();

            // 第5次失败时锁定账户
            if (rows == 0) {
                lockAccount(username);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    // 锁定账户
    private void lockAccount(String username) throws SQLException {
        String sql = "UPDATE account SET " +
                "lock_time = ?, " +
                "failed_times = 5 " +
                "WHERE username = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setTimestamp(1, new Timestamp(new Date().getTime()));
            pstmt.setString(2, username);
            pstmt.executeUpdate();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    // 重置失败次数
    private void resetFailedTimes(String username) throws SQLException {
        String sql = "UPDATE account SET failed_times = 0 WHERE username = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.executeUpdate();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    // 检查密码有效期（90天）
    public boolean isPasswordExpired(Account account) {
        if (account.getLastPasswordChangeDate() == null) {
            return true; // 首次登录强制修改密码
        }
        long currentTime = new Date().getTime();
        long lastChangeTime = account.getLastPasswordChangeDate().getTime();
        return (currentTime - lastChangeTime) > (90 * 24 * 60 * 60 * 1000);
    }

    // 密码强度校验
    private boolean isPasswordValid(String password) {
        String pattern = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
        return password.matches(pattern);
    }
}