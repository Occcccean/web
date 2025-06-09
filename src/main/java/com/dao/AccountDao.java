package com.dao;

import com.model.Account;
import java.util.ArrayList;

public class AccountDao extends BaseDao {
  public boolean add(Account account) {
    var sql = "INSERT INTO account values (?, ?, ?, ?, ?, ?)";

    try (var connection = getConnection(); var statement = connection.prepareStatement(sql)) {
      statement.setString(1, account.getUsername());
      statement.setString(2, account.getPassword());
      statement.setString(3, account.getRole());
      statement.setLong(4, account.getFailedTimes());
      statement.setTimestamp(5, account.getLockTime());
      statement.setDate(6, account.getLastPasswordChangeDate());
      return statement.executeUpdate() > 0;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

  public Account getById(long id) {
    var sql = "SELECT * FROM account WHERE id = ?";
    try (var connection = getConnection(); var statement = connection.prepareStatement(sql)) {
      statement.setLong(1, id);
      var result = statement.executeQuery();
      if (result.next()) {
        Account account = new Account();
        account.setId(id);
        account.setUsername(result.getString("username"));
        account.setPassword(result.getString("password"));
        account.setRole(result.getString("role"));
        account.setFailedTimes(result.getInt("failed_times"));
        account.setLockTime(result.getTimestamp("lock_time"));
        account.setLastPasswordChangeDate(result.getDate("last_password_change_date"));
        return account;
      }
      return null;
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }

  public Account getByUsername(String username) {
    var sql = "SELECT * FROM account WHERE username = ?";
    try (var connection = getConnection(); var statement = connection.prepareStatement(sql)) {
      statement.setString(1, username);
      var result = statement.executeQuery();
      if (result.next()) {
        Account account = new Account();
        account.setId(result.getLong("id"));
        account.setUsername(username);
        account.setPassword(result.getString("password"));
        account.setRole(result.getString("role"));
        account.setFailedTimes(result.getInt("failed_times"));
        account.setLockTime(result.getTimestamp("lock_time"));
        account.setLastPasswordChangeDate(result.getDate("last_password_change_date"));
        return account;
      }
      return null;
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }

  public boolean update(Account account) {
    var sql = "UPDATE account SET username=?, password=?, role=?, failed_times=?, lock_time=?, last_password_change_date=? where id=?";

    try (var connection = getConnection(); var statement = connection.prepareStatement(sql)) {
      statement.setString(1, account.getUsername());
      statement.setString(2, account.getPassword());
      statement.setString(3, account.getRole());
      statement.setLong(4, account.getFailedTimes());
      statement.setTimestamp(5, account.getLockTime());
      statement.setDate(6, account.getLastPasswordChangeDate());
      statement.setLong(7, account.getId());
      return statement.executeUpdate() > 0;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

  public boolean delete(long id) {
    var sql = "DELETE FROM account WHERE id=?";
    try (var connection = getConnection(); var statement = connection.prepareStatement(sql)) {
      statement.setLong(1, id);
      return statement.executeUpdate() > 0;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

  public ArrayList<Account> getAll() {
    var list = new ArrayList<Account>();
    var sql = "SELECT * FROM account";
    try (
        var connection = getConnection();
        var statement = connection.createStatement();
        var result = statement.executeQuery(sql)) {
      while (result.next()) {
        var account = new Account();
        account.setId(result.getLong("id"));
        account.setUsername(result.getString("username"));
        account.setPassword(result.getString("password"));
        account.setRole(result.getString("role"));
        account.setFailedTimes(result.getInt("failed_times"));
        account.setLockTime(result.getTimestamp("lock_time"));
        account.setLastPasswordChangeDate(result.getDate("last_password_change_date"));
        list.add(account);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return list;
  }

}
