package com.service;

import com.util.Password;
import com.util.exceptions.WebException;
import com.util.exceptions.WebException;
import com.dao.AccountDao;
import com.model.Account;

public class AcountService {
  public static Long add(String username, String password, String role) throws WebException {
    var dao = new AccountDao();
    if (!Password.validate(password))
      throw new WebException("invalid password");

    if (dao.getByUsername(username) != null)
      throw new WebException("username already used");

    var account = new Account();
    account.setUsername(username);
    account.setPassword(password);
    account.setRole(role);
    dao.add(account);
    return dao.getByUsername(username).getId();
  }
}
