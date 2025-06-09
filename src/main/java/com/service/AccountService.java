package com.service;

import com.util.Password;
import com.util.exceptions.WebException;

import java.sql.Timestamp;
import java.time.temporal.ChronoUnit;
import java.util.Date;

import com.dao.AccountDao;
import com.model.Account;

public class AccountService {
  static AccountDao dao = new AccountDao();

  public static void add(String name, String username, String password, String role) throws WebException {
    var passwd = new Password(username);
    if (!passwd.isValidate())
      throw new WebException("非法密码");

    if (dao.getByUsername(username) != null)
      throw new WebException("已经存在的用户名");

    var account = new Account();
    account.setUsername(username);
    account.setPassword(passwd.getEncodedPassword());
    account.setRole(role);
    account.setLastPasswordChangeDate(new java.sql.Date(new Date().getTime()));
    dao.add(account);
    Role.add(name, role, dao.getByUsername(username).getId());
  }

  public static Account getByUsername(String username) throws WebException {
    return dao.getByUsername(username);
  }

  public static void delete(long id) throws WebException {
    var account = dao.getById(id);
    if (account == null)
      throw new WebException("不存在的账号");
    dao.delete(id);
    Role.delete(account.getRole(), id);
  }

  public static void changePassword(Long id, String newPassword) throws WebException {
    var newPasswd = new Password(newPassword);
    if (!newPasswd.isValidate())
      throw new WebException("非法密码");

    var account = dao.getById(id);

    if (account == null)
      throw new WebException("已经存在的用户名");

    account.setPassword(newPasswd.getEncodedPassword());

    if (!dao.update(account))
      throw new WebException("修改失败");
  }

  public static Account login(String username, String password) throws WebException {
    var passwd = new Password(password);

    var account = dao.getByUsername(username);

    try_login(account);

    if (!passwd.verify(account.getPassword())) {
      account.setFailedTimes(account.getFailedTimes() + 1);
      dao.update(account);
      throw new WebException("密码错误");
    }

    return account;
  }

  public static void try_login(Account account) throws WebException {
    if (account == null)
      throw new WebException("不存在的账号");

    var date = new Date();
    var failed = account.getFailedTimes();
    if (failed >= 5) {
      account.setLockTime(new Timestamp(new Date().getTime()));
      account.setFailedTimes(0);
      dao.update(account);
      throw new WebException("失败太多次，你被锁了");
    }

    var lock_time = account.getLockTime();

    if (lock_time != null) {
      var current = new Timestamp(date.getTime());
      var timeSpan = ChronoUnit.MINUTES.between(
          lock_time.toInstant(),
          current.toInstant());
      if (timeSpan < 30)
        throw new WebException("还没到时间");
    }

    var last_password_date = account.getLastPasswordChangeDate();
    if (last_password_date != null) {
      var dateSpan = ChronoUnit.DAYS.between(
          last_password_date.toInstant(),
          date.toInstant());
      if (dateSpan < 90)
        throw new WebException("密码太老了");
    }
  }
}
