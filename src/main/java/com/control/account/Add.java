package com.control.account;

import com.service.AccountService;
import com.util.Utils;
import com.util.exceptions.WebException;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/account/add")
public class Add extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    var name = req.getParameter("name");
    var username = req.getParameter("username");
    var password = req.getParameter("password");
    var role = req.getParameter("role");
    try {
      Utils.checkRole(req, "system_manager");
      AccountService.add(name, username, password, role);
      resp.getWriter().write("200 ok");
    } catch (WebException e) {
      resp.getWriter().write(e.getMessage());
    }
  }
}
