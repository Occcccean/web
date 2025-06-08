package com.dao;

import com.model.leader.UniversityLeader;
import java.sql.*;
import java.util.ArrayList;

public class UniversityLeaderDao extends BaseDao {

    // 添加学校领导
    public boolean add(UniversityLeader leader) {
        String sql = "INSERT INTO university_leader (name, account_id) VALUES (?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, leader.getName());
            pstmt.setLong(2, leader.getAccount_id());

            int rows = pstmt.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 根据ID获取学校领导
    public UniversityLeader getById(long id) {
        String sql = "SELECT * FROM university_leader WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    UniversityLeader leader = new UniversityLeader();
                    leader.setId(rs.getLong("id"));
                    leader.setName(rs.getString("name"));
                    leader.setAccount_id(rs.getLong("account_id"));
                    return leader;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 更新学校领导信息
    public boolean update(UniversityLeader leader) {
        String sql = "UPDATE university_leader SET name=?, account_id=? WHERE id=?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, leader.getName());
            pstmt.setLong(2, leader.getAccount_id());
            pstmt.setLong(3, leader.getId());

            int rows = pstmt.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // 删除学校领导
    public boolean delete(long id) {
        String sql = "DELETE FROM university_leader WHERE id=?";
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

    // 获取所有学校领导
    public ArrayList<UniversityLeader> getAll() {
        ArrayList<UniversityLeader> list = new ArrayList<>();
        String sql = "SELECT * FROM university_leader";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                UniversityLeader leader = new UniversityLeader();
                leader.setId(rs.getLong("id"));
                leader.setName(rs.getString("name"));
                leader.setAccount_id(rs.getLong("account_id"));
                list.add(leader);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 根据账户ID获取学校领导
    public UniversityLeader getByAccountId(long accountId) {
        String sql = "SELECT * FROM university_leader WHERE account_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setLong(1, accountId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    UniversityLeader leader = new UniversityLeader();
                    leader.setId(rs.getLong("id"));
                    leader.setName(rs.getString("name"));
                    leader.setAccount_id(rs.getLong("account_id"));
                    return leader;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}