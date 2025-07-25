package com.control.user;

import java.io.IOException;

import com.service.AccountService;
import com.util.Password;
import com.util.Utils;
import com.util.exceptions.WebException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user/password")
public class ChangePassword extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    var oldpasswd = req.getParameter("old");
    var newpasswd = req.getParameter("new");
    try {
      if (!new Password(oldpasswd).verify(Utils.getAccount(req).getPassword()))
        throw new WebException("密码错误");

      AccountService.changePassword(Utils.getAccount(req).getId(), newpasswd);
    } catch (WebException e) {
      resp.getWriter().write(e.getMessage());
    }
  }

}
