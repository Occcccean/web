package com.dao;

import com.model.Mentor;
import java.sql.*;
import java.util.ArrayList;

public class MentorDao extends BaseDao {

  // 添加导师（修复SQL和参数顺序）
  public boolean add(Mentor mentor) {
    String sql = "INSERT INTO mentor (name, collage, account_id) VALUES (?, ?, ?)";
    try (Connection conn = getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setString(1, mentor.getName());
      pstmt.setString(2, mentor.getCollege());
      pstmt.setLong(3, mentor.getAccount_id());

      int rows = pstmt.executeUpdate();
      return rows > 0;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

  // 根据ID获取导师（修复字段映射和结果集处理）
  public Mentor getById(long id) {
    String sql = "SELECT * FROM mentor WHERE id = ?";
    try (Connection conn = getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setLong(1, id);
      try (ResultSet rs = pstmt.executeQuery()) {
        if (rs.next()) {
          Mentor mentor = new Mentor();
          mentor.setId(rs.getLong("id"));
          mentor.setName(rs.getString("name"));
          mentor.setCollege(rs.getString("collage"));
          mentor.setAccount_id(rs.getLong("account_id"));
          return mentor;
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  // 更新导师（修复返回值问题）
  public boolean update(Mentor mentor) {
    String sql = "UPDATE mentor SET name=?, collage=?, account_id=? WHERE id=?";
    try (Connection conn = getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setString(1, mentor.getName());
      pstmt.setString(2, mentor.getCollege());
      pstmt.setLong(3, mentor.getAccount_id());
      pstmt.setLong(4, mentor.getId());

      int rows = pstmt.executeUpdate();
      return rows > 0;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

  // 删除导师（修复返回值问题）
  public boolean delete(long id) {
    String sql = "DELETE FROM mentor WHERE id=?";
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

  // 获取所有导师（修复字段映射）
  public ArrayList<Mentor> getAll() {
    ArrayList<Mentor> list = new ArrayList<>();
    String sql = "SELECT * FROM mentor";
    try (Connection conn = getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql)) {

      while (rs.next()) {
        Mentor mentor = new Mentor();
        mentor.setId(rs.getLong("id"));
        mentor.setName(rs.getString("name"));
        mentor.setCollege(rs.getString("collage"));
        mentor.setAccount_id(rs.getLong("account_id"));
        list.add(mentor);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return list;
  }

  // 根据账户ID获取导师
  public Mentor getByAccountId(long accountId) {
    String sql = "SELECT * FROM mentor WHERE account_id = ?";
    try (Connection conn = getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setLong(1, accountId);
      try (ResultSet rs = pstmt.executeQuery()) {
        if (rs.next()) {
          Mentor mentor = new Mentor();
          mentor.setId(rs.getLong("id"));
          mentor.setName(rs.getString("name"));
          mentor.setCollege(rs.getString("collage"));
          mentor.setAccount_id(rs.getLong("account_id"));
          return mentor;
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  // 根据学院获取导师列表
  public ArrayList<Mentor> getByCollage(String collage) {
    ArrayList<Mentor> list = new ArrayList<>();
    String sql = "SELECT * FROM mentor WHERE collage = ?";
    try (Connection conn = getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setString(1, collage);
      try (ResultSet rs = pstmt.executeQuery()) {
        while (rs.next()) {
          Mentor mentor = new Mentor();
          mentor.setId(rs.getLong("id"));
          mentor.setName(rs.getString("name"));
          mentor.setCollege(rs.getString("collage"));
          mentor.setAccount_id(rs.getLong("account_id"));
          list.add(mentor);
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return list;
  }
}
