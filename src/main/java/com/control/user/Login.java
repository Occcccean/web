package com.control.user;

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
      var role=account.getRole();
      Utils.setAccount(req, account);
      Utils.redirect(resp, getPath(account.getRole()));
    } catch (WebException e) {
      resp.getWriter().write(e.getMessage());
    }
  }

  static protected String getPath(String role){
      return switch (role) {
          case "student" -> "/student.jsp";
          case "system_manager" -> "/edit.jsp";
          case "mentor" -> "/mentor.jsp";
          case "secretary", "college_leader" -> "/secretary.jsp";
          case "auditor_manager" -> "/auditor_manager.jsp";
          case "student_leader", "student_manager", "university_leader" -> "/university_select.jsp";
          default -> "/login.jsp";
      };
  }

}
