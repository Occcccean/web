package com.control;

import com.service.AcountService;
import com.util.exceptions.WebException;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addRole")
public class addRole extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    var username = req.getParameter("name");
    var password = req.getParameter("password");
    var role = req.getParameter("role");
    try {
      AcountService.add(username, password, role);
    } catch (WebException e) {
      resp.getWriter().write(e.getMessage());
    }
  }
}
