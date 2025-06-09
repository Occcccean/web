package com.dao;

import com.model.Student;
import java.sql.*;
import java.util.ArrayList;

public class StudentDao extends BaseDao {
  // 添加学生
  public boolean add(Student student) {
    String sql = "INSERT INTO student (" +
        "student_id, name, gender, nation, birth_date, " +
        "birth_place, id_number, country, home_address, " +
        "phone_number, email, dorm_id, grade, college, " +
        "major, campus, entrance_date, class_id, " +
        "wechat, qq, home_phone_number, home_contact_man, " +
        "account_id, mentor_id, mentor) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    try (Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setString(1, student.getStudent_id());
      pstmt.setString(2, student.getName());
      pstmt.setString(3, student.getGender());
      pstmt.setString(4, student.getNation());
      pstmt.setDate(5, student.getBirth_date());
      pstmt.setString(6, student.getBirth_place());
      pstmt.setString(7, student.getId_number());
      pstmt.setString(8, student.getCountry());
      pstmt.setString(9, student.getHome_address());
      pstmt.setString(10, student.getPhone_number());
      pstmt.setString(11, student.getEmail());
      pstmt.setString(12, student.getDorm_id());
      pstmt.setInt(13, student.getGrade());
      pstmt.setString(14, student.getCollege());
      pstmt.setString(15, student.getMajor());
      pstmt.setString(16, student.getCampus());
      pstmt.setDate(17, student.getEntrance_date());
      pstmt.setString(18, student.getClass_id());
      pstmt.setString(19, student.getWechat());
      pstmt.setString(20, student.getQq());
      pstmt.setString(21, student.getHome_phone_number());
      pstmt.setString(22, student.getHome_contact_man());
      pstmt.setLong(23, student.getAccount_id());
      pstmt.setLong(24, student.getMentor_id());
      pstmt.setString(25, student.getMentor());

      int rows = pstmt.executeUpdate();
      return rows > 0;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

  // 根据ID获取学生
  public Student getById(long id) {
    String sql = "SELECT * FROM student WHERE id = ?";
    try (Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setLong(1, id);
      try (ResultSet rs = pstmt.executeQuery()) {
        if (rs.next()) {
          Student student = new Student();
          student.setId(rs.getLong("id"));
          student.setStudent_id(rs.getString("student_id"));
          student.setName(rs.getString("name"));
          student.setGender(rs.getString("gender"));
          student.setNation(rs.getString("nation"));
          student.setBirth_date(rs.getDate("birth_date"));
          student.setBirth_place(rs.getString("birth_place"));
          student.setId_number(rs.getString("id_number"));
          student.setCountry(rs.getString("country"));
          student.setHome_address(rs.getString("home_address"));
          student.setPhone_number(rs.getString("phone_number"));
          student.setEmail(rs.getString("email"));
          student.setDorm_id(rs.getString("dorm_id"));
          student.setGrade(rs.getInt("grade"));
          student.setCollege(rs.getString("college"));
          student.setMajor(rs.getString("major"));
          student.setCampus(rs.getString("campus"));
          student.setEntrance_date(rs.getDate("entrance_date"));
          student.setClass_id(rs.getString("class_id"));
          student.setWechat(rs.getString("wechat"));
          student.setQq(rs.getString("qq"));
          student.setHome_phone_number(rs.getString("home_phone_number"));
          student.setHome_contact_man(rs.getString("home_contact_man"));
          student.setAccount_id(rs.getLong("account_id"));
          student.setMentor_id(rs.getLong("mentor_id"));
          student.setMentor(rs.getString("mentor"));
          return student;
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  // 更新学生信息
  public boolean update(Student student) {
    String sql = "UPDATE student SET " +
        "student_id=?, name=?, gender=?, nation=?, birth_date=?, " +
        "birth_place=?, id_number=?, country=?, home_address=?, " +
        "phone_number=?, email=?, dorm_id=?, grade=?, college=?, " +
        "major=?, campus=?, entrance_date=?, class_id=?, " +
        "wechat=?, qq=?, home_phone_number=?, home_contact_man=?, " +
        "account_id=?, mentor_id=?, mentor=? " +
        "WHERE id=?";

    try (Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setString(1, student.getStudent_id());
      pstmt.setString(2, student.getName());
      pstmt.setString(3, student.getGender());
      pstmt.setString(4, student.getNation());
      pstmt.setDate(5, new java.sql.Date(student.getBirth_date().getTime()));
      pstmt.setString(6, student.getBirth_place());
      pstmt.setString(7, student.getId_number());
      pstmt.setString(8, student.getCountry());
      pstmt.setString(9, student.getHome_address());
      pstmt.setString(10, student.getPhone_number());
      pstmt.setString(11, student.getEmail());
      pstmt.setString(12, student.getDorm_id());
      pstmt.setInt(13, student.getGrade());
      pstmt.setString(14, student.getCollege());
      pstmt.setString(15, student.getMajor());
      pstmt.setString(16, student.getCampus());
      pstmt.setDate(17, new java.sql.Date(student.getEntrance_date().getTime()));
      pstmt.setString(18, student.getClass_id());
      pstmt.setString(19, student.getWechat());
      pstmt.setString(20, student.getQq());
      pstmt.setString(21, student.getHome_phone_number());
      pstmt.setString(22, student.getHome_contact_man());
      pstmt.setLong(23, student.getAccount_id());
      pstmt.setLong(24, student.getMentor_id());
      pstmt.setString(25, student.getMentor());
      pstmt.setLong(26, student.getId());

      int rows = pstmt.executeUpdate();
      return rows > 0;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

  // 删除学生
  public boolean delete(long id) {
    String sql = "DELETE FROM student WHERE id=?";
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

  // 获取所有学生
  public ArrayList<Student> getAll() {
    ArrayList<Student> list = new ArrayList<>();
    String sql = "SELECT * FROM student";
    try (Connection conn = getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql)) {

      while (rs.next()) {
        Student student = new Student();
        student.setId(rs.getLong("id"));
        student.setStudent_id(rs.getString("student_id"));
        student.setName(rs.getString("name"));
        student.setGender(rs.getString("gender"));
        student.setNation(rs.getString("nation"));
        student.setBirth_date(rs.getDate("birth_date"));
        student.setBirth_place(rs.getString("birth_place"));
        student.setId_number(rs.getString("id_number"));
        student.setCountry(rs.getString("country"));
        student.setHome_address(rs.getString("home_address"));
        student.setPhone_number(rs.getString("phone_number"));
        student.setEmail(rs.getString("email"));
        student.setDorm_id(rs.getString("dorm_id"));
        student.setGrade(rs.getInt("grade"));
        student.setCollege(rs.getString("college"));
        student.setMajor(rs.getString("major"));
        student.setCampus(rs.getString("campus"));
        student.setEntrance_date(rs.getDate("entrance_date"));
        student.setClass_id(rs.getString("class_id"));
        student.setWechat(rs.getString("wechat"));
        student.setQq(rs.getString("qq"));
        student.setHome_phone_number(rs.getString("home_phone_number"));
        student.setHome_contact_man(rs.getString("home_contact_man"));
        student.setAccount_id(rs.getLong("account_id"));
        student.setMentor_id(rs.getLong("mentor_id"));
        student.setMentor(rs.getString("mentor"));
        list.add(student);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return list;
  }

  // 根据学号获取学生
  public Student getByStudentId(String studentId) {
    String sql = "SELECT * FROM student WHERE student_id = ?";
    try (Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setString(1, studentId);
      try (ResultSet rs = pstmt.executeQuery()) {
        if (rs.next()) {
          return buildStudentFromResultSet(rs);
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  // 根据学院获取学生列表
  public ArrayList<Student> getByCollege(String college) {
    ArrayList<Student> list = new ArrayList<>();
    String sql = "SELECT * FROM student WHERE college = ?";
    try (Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setString(1, college);
      try (ResultSet rs = pstmt.executeQuery()) {
        while (rs.next()) {
          list.add(buildStudentFromResultSet(rs));
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return list;
  }

  // 根据导师ID获取学生列表
  public ArrayList<Student> getByMentorId(long mentorId) {
    ArrayList<Student> list = new ArrayList<>();
    String sql = "SELECT * FROM student WHERE mentor_id = ?";
    try (Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setLong(1, mentorId);
      try (ResultSet rs = pstmt.executeQuery()) {
        while (rs.next()) {
          list.add(buildStudentFromResultSet(rs));
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return list;
  }

  // 根据账户ID获取学生
  public Student getByAccountId(long accountId) {
    String sql = "SELECT * FROM student WHERE account_id = ?";
    try (Connection conn = getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

      pstmt.setLong(1, accountId);
      try (ResultSet rs = pstmt.executeQuery()) {
        if (rs.next()) {
          return buildStudentFromResultSet(rs);
        }
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  // 从结果集构建学生对象（辅助方法）
  private Student buildStudentFromResultSet(ResultSet rs) throws SQLException {
    Student student = new Student();
    student.setId(rs.getLong("id"));
    student.setStudent_id(rs.getString("student_id"));
    student.setName(rs.getString("name"));
    student.setGender(rs.getString("gender"));
    student.setNation(rs.getString("nation"));
    student.setBirth_date(rs.getDate("birth_date"));
    student.setBirth_place(rs.getString("birth_place"));
    student.setId_number(rs.getString("id_number"));
    student.setCountry(rs.getString("country"));
    student.setHome_address(rs.getString("home_address"));
    student.setPhone_number(rs.getString("phone_number"));
    student.setEmail(rs.getString("email"));
    student.setDorm_id(rs.getString("dorm_id"));
    student.setGrade(rs.getInt("grade"));
    student.setCollege(rs.getString("college"));
    student.setMajor(rs.getString("major"));
    student.setCampus(rs.getString("campus"));
    student.setEntrance_date(rs.getDate("entrance_date"));
    student.setClass_id(rs.getString("class_id"));
    student.setWechat(rs.getString("wechat"));
    student.setQq(rs.getString("qq"));
    student.setHome_phone_number(rs.getString("home_phone_number"));
    student.setHome_contact_man(rs.getString("home_contact_man"));
    student.setAccount_id(rs.getLong("account_id"));
    student.setMentor_id(rs.getLong("mentor_id"));
    student.setMentor(rs.getString("mentor"));
    return student;
  }
}
