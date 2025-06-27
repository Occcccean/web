package com.util;

import com.model.Account;
import com.util.exceptions.UnAuthException;
import com.util.exceptions.WebException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Utils {
  public static void redirect(HttpServletResponse resp, String location) {
    resp.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
    resp.setHeader("location", "/myapp" + location);
  }

  public static void setAccount(HttpServletRequest req, Account account) {
    req.getSession().setAttribute("account", account);
  }

  public static Account getAccount(HttpServletRequest req) throws WebException {
    try {
      var account = (Account) req.getSession().getAttribute("account");
      if (account == null)
        throw new WebException("没有登录");
      return account;
    } catch (ClassCastException e) {
      throw new WebException("没有登录");
    }
  }

  public static boolean isUsernameMatches(HttpServletRequest req, String username) throws WebException {
    return getAccount(req).getUsername().equals(username);
  }

  public static void checkUsername(HttpServletRequest req, String username) throws WebException {
    if (!isUsernameMatches(req, username))
      throw new UnAuthException(username);
  }

  public static boolean isIdMatches(HttpServletRequest req, Long id) throws WebException {
    return getAccount(req).getId() == id;
  }

  public static void checkId(HttpServletRequest req, Long id) throws WebException {
    if (!isIdMatches(req, id))
      throw new UnAuthException("编号" + id);
  }

  public static boolean isRoleMatches(HttpServletRequest req, String role) throws WebException {
    return getAccount(req).getRole().equals(role);
  }

  public static void checkRole(HttpServletRequest req, String role) throws WebException {
    if (!isRoleMatches(req, role))
      throw new UnAuthException(role, getAccount(req).getRole());
  }
}
