package com.control.account;

import java.io.IOException;

import com.service.AccountService;
import com.util.exceptions.WebException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/account/password")
public class ChangePassword extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    var password = req.getParameter("password");
    var id = Long.parseLong(req.getParameter("id"));
    try {
      AccountService.changePassword(id, password);
    } catch (WebException e) {
      resp.getWriter().write(e.getMessage());
    }
  }

}
