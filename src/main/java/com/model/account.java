package com.model;

import org.bouncycastle.jce.provider.BouncyCastleProvider;
import java.security.MessageDigest;
import java.security.Security;
import java.util.UUID;
import java.io.Serializable;
import java.util.Date;

public class account implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;
    private String username;             // 用户名（学号/工号）
    private String encryptedPassword;    // 加密密码
    private String role;                 // 用户角色
    private Integer failedTimes;         // 登录失败次数
    private Date lockTime;               // 锁定时间
    private Date lastPasswordChangeDate; // 最后密码修改时间
    private boolean firstLogin;          // 是否首次登录（非数据库字段）

    // ===================== 密码加密/解密访问器 =====================

    public String getPassword() {
        return SM3Util.sm3(encryptedPassword);
    }

    public void setPassword(String password) {
        this.encryptedPassword = SM3Util.sm3(password);
    }

    // ===================== 其他字段访问器 =====================

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Integer getFailedTimes() {
        return failedTimes;
    }

    public void setFailedTimes(Integer failedTimes) {
        this.failedTimes = failedTimes;
    }

    public Date getLockTime() {
        return lockTime;
    }

    public void setLockTime(Date lockTime) {
        this.lockTime = lockTime;
    }

    public Date getLastPasswordChangeDate() {
        return lastPasswordChangeDate;
    }

    public void setLastPasswordChangeDate(Date lastPasswordChangeDate) {
        this.lastPasswordChangeDate = lastPasswordChangeDate;
    }

    public boolean isFirstLogin() {
        return firstLogin;
    }

    public void setFirstLogin(boolean firstLogin) {
        this.firstLogin = firstLogin;
    }

}

class SM3Util {
    static {
        Security.addProvider(new BouncyCastleProvider());
    }

    public static String sm3(String data) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SM3", "BC");
            byte[] hashBytes = digest.digest(data.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}