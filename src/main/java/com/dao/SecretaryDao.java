package com.dao;

import com.model.Secretary;
import java.sql.*;
import java.util.ArrayList;

public class SecretaryDao extends BaseDao {
    // 添加秘书
    public boolean add(Secretary secretary) {
        String sql = "INSERT INTO secretary (name, college, account_id) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, secretary.getName());
            pstmt.setString(2, secretary.getCollege());
            pstmt.setLong(3, secretary.getAccount_id());

            int rows = pstmt.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 根据ID获取秘书
    public Secretary getById(long id) {
        String sql = "SELECT * FROM secretary WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Secretary secretary = new Secretary();
                    secretary.setId(rs.getLong("id"));
                    secretary.setName(rs.getString("name"));
                    secretary.setCollege(rs.getString("college"));
                    secretary.setAccount_id(rs.getLong("account_id"));
                    return secretary;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 更新秘书信息
    public boolean update(Secretary secretary) {
        String sql = "UPDATE secretary SET name=?, college=?, account_id=? WHERE id=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, secretary.getName());
            pstmt.setString(2, secretary.getCollege());
            pstmt.setLong(3, secretary.getAccount_id());
            pstmt.setLong(4, secretary.getId());

            int rows = pstmt.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 删除秘书
    public boolean delete(long id) {
        String sql = "DELETE FROM secretary WHERE id=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, id);
            int rows = pstmt.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 获取所有秘书
    public ArrayList<Secretary> getAll() {
        ArrayList<Secretary> list = new ArrayList<>();
        String sql = "SELECT * FROM secretary";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Secretary secretary = new Secretary();
                secretary.setId(rs.getLong("id"));
                secretary.setName(rs.getString("name"));
                secretary.setCollege(rs.getString("college"));
                secretary.setAccount_id(rs.getLong("account_id"));
                list.add(secretary);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 根据账户ID获取秘书
    public Secretary getByAccountId(long accountId) {
        String sql = "SELECT * FROM secretary WHERE account_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, accountId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Secretary secretary = new Secretary();
                    secretary.setId(rs.getLong("id"));
                    secretary.setName(rs.getString("name"));
                    secretary.setCollege(rs.getString("college"));
                    secretary.setAccount_id(rs.getLong("account_id"));
                    return secretary;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 根据学院获取秘书列表
    public ArrayList<Secretary> getByCollege(String college) {
        ArrayList<Secretary> list = new ArrayList<>();
        String sql = "SELECT * FROM secretary WHERE college = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, college);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Secretary secretary = new Secretary();
                    secretary.setId(rs.getLong("id"));
                    secretary.setName(rs.getString("name"));
                    secretary.setCollege(rs.getString("college"));
                    secretary.setAccount_id(rs.getLong("account_id"));
                    list.add(secretary);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}