package com.dao;

import com.model.leader.CollegeLeader;
import java.sql.*;
import java.util.ArrayList;

public class CollegeLeaderDao extends BaseDao {

    // 添加学院领导
    public boolean add(CollegeLeader leader) {
        String sql = "INSERT INTO college_leader (name, college, account_id) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, leader.getName());
            pstmt.setString(2, leader.getCollege());
            pstmt.setLong(3, leader.getAccount_id());

            int rows = pstmt.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 根据ID获取学院领导
    public CollegeLeader getById(long id) {
        String sql = "SELECT * FROM college_leader WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    CollegeLeader leader = new CollegeLeader();
                    leader.setId(rs.getLong("id"));
                    leader.setName(rs.getString("name"));
                    leader.setCollege(rs.getString("college"));
                    leader.setAccount_id(rs.getLong("account_id"));
                    return leader;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 更新学院领导信息
    public boolean update(CollegeLeader leader) {
        String sql = "UPDATE college_leader SET name=?, college=?, account_id=? WHERE id=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, leader.getName());
            pstmt.setString(2, leader.getCollege());
            pstmt.setLong(3, leader.getAccount_id());
            pstmt.setLong(4, leader.getId());

            int rows = pstmt.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 删除学院领导
    public boolean delete(long id) {
        String sql = "DELETE FROM college_leader WHERE id=?";
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

    // 获取所有学院领导
    public ArrayList<CollegeLeader> getAll() {
        ArrayList<CollegeLeader> list = new ArrayList<>();
        String sql = "SELECT * FROM college_leader";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                CollegeLeader leader = new CollegeLeader();
                leader.setId(rs.getLong("id"));
                leader.setName(rs.getString("name"));
                leader.setCollege(rs.getString("college"));
                leader.setAccount_id(rs.getLong("account_id"));
                list.add(leader);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 根据账户ID获取学院领导
    public CollegeLeader getByAccountId(long accountId) {
        String sql = "SELECT * FROM college_leader WHERE account_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, accountId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    CollegeLeader leader = new CollegeLeader();
                    leader.setId(rs.getLong("id"));
                    leader.setName(rs.getString("name"));
                    leader.setCollege(rs.getString("college"));
                    leader.setAccount_id(rs.getLong("account_id"));
                    return leader;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 根据学院获取学院领导列表
    public ArrayList<CollegeLeader> getByCollege(String college) {
        ArrayList<CollegeLeader> list = new ArrayList<>();
        String sql = "SELECT * FROM college_leader WHERE college = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, college);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    CollegeLeader leader = new CollegeLeader();
                    leader.setId(rs.getLong("id"));
                    leader.setName(rs.getString("name"));
                    leader.setCollege(rs.getString("college"));
                    leader.setAccount_id(rs.getLong("account_id"));
                    list.add(leader);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}