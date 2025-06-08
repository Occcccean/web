package com.service;

import com.util.Password;
import com.util.exceptions.WebException;
import com.dao.AccountDao;
import com.model.Account;

public class AccountService {
  public static Long add(String username, String password, String role) throws WebException {
    var passwd = new Password(username);
    if (!passwd.isValidate())
      throw new WebException("invalid password");

    var dao = new AccountDao();
    if (dao.getByUsername(username) != null)
      throw new WebException("username already used");

    var account = new Account();
    account.setUsername(username);
    account.setPassword(passwd.getEncodedPassword());
    account.setRole(role);
    dao.add(account);
    return dao.getByUsername(username).getId();
  }

  public static boolean changePassword(Long id, String oldPassword, String newPassword) throws WebException {
    var oldPasswd = new Password(oldPassword);
    var newPasswd = new Password(newPassword);
    if (!newPasswd.isValidate())
      throw new WebException("invalid password");

    var dao = new AccountDao();
    var account = dao.getById(id);

    if (account == null)
      throw new WebException("this id is not exists");

    if (!oldPasswd.verify(account.getPassword()))
      throw new WebException("old password is not correct");

    account.setPassword(newPasswd.getEncodedPassword());

    return dao.update(account);
  }
}
