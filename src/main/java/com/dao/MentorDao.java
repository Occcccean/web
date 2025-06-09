package com.dao;

import java.util.ArrayList;

import com.model.Mentor;

public class MentorDao extends BaseDao {
  public boolean add(Mentor mentor) {
    var sql = "Insert into mentor values(?,?,?)";
    try {
      try (var connection = getConnection(); var statement = connection.prepareStatement(sql)) {
        statement.setString(1, mentor.getName());
        statement.setString(2, mentor.getCollege());
        statement.setLong(3, mentor.getAccount_id());
        statement.executeUpdate();
        return true;
      }
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

  public Mentor getById(long id) {
    var mentor = new Mentor();
    var sql = "Select name, college, account_id from mentor where id = ?";
    try {
      try (var connection = getConnection(); var statement = connection.prepareStatement(sql)) {
        statement.setLong(1, id);
        var result = statement.executeQuery();
        mentor.setId(id);
        mentor.setName(result.getString("name"));
        mentor.setCollege(result.getString("college"));
        mentor.setAccount_id(result.getLong("account_id"));
      }
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
    return mentor;
  }

  public Mentor getByAccountId(long account) {
    var mentor = new Mentor();
    var sql = "Select name, college, account_id from mentor where account_id = ?";
    try {
      try (var connection = getConnection(); var statement = connection.prepareStatement(sql)) {
        statement.setLong(1, account);
        var result = statement.executeQuery();
        mentor.setAccount_id(account);
        mentor.setName(result.getString("name"));
        mentor.setCollege(result.getString("college"));
        mentor.setId(result.getLong("id"));
      }
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
    return mentor;
  }

  public boolean update(Mentor mentor) {
    var sql = "Update mentor set name=?, college=?, account_id=? where id = ?";
    try {
      try (var connection = getConnection(); var statement = connection.prepareStatement(sql)) {
        statement.setString(1, mentor.getName());
        statement.setString(2, mentor.getCollege());
        statement.setLong(3, mentor.getAccount_id());
        statement.setLong(4, mentor.getId());
        statement.executeUpdate();
      }
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
    return false;
  }

  public boolean delete(long id) {
    var sql = "Delete from mentor where id = ?";
    try {
      try (var connection = getConnection(); var statement = connection.prepareStatement(sql)) {
        statement.setLong(1, id);
        statement.executeUpdate();
      }
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
    return false;
  }

  public ArrayList<Mentor> getAll() {
    var list = new ArrayList<Mentor>();
    var sql = "Select * from mentor";
    try {
      try (
          var connection = getConnection();
          var statement = connection.createStatement();
          var result = statement.executeQuery(sql)) {
        while (result.next()) {
          var mentor = new Mentor();
          mentor.setId(result.getLong("id"));
          mentor.setName(result.getString("name"));
          mentor.setCollege(result.getString("name"));
          mentor.setAccount_id(result.getLong("account_id"));
          list.add(mentor);
        }
      }
    } catch (Exception e) {
      return null;
    }
    return list;
  }
}
