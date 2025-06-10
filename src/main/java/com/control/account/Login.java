package com.control.account;

import java.io.IOException;

import com.service.AccountService;
import com.util.Utils;
import com.util.exceptions.WebException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class Login extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    var username = req.getParameter("username");
    var password = req.getParameter("password");
    try {
      var account = AccountService.login(username, password);
      Utils.setAccount(req, account);
      resp.getWriter().write(account.getRole() + ": " + account.getUsername());
    } catch (WebException e) {
      resp.getWriter().write(e.getMessage());
    }
  }

}
