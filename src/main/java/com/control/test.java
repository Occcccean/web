package com.control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.util.Password;

import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet("/test")
public class test extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
      var passwd = req.getParameter("password");
      resp.getWriter().write(new Password(passwd).getEncodedPassword());
    } catch (Exception e) {
      resp.getWriter().write(e.getMessage());
    }
  }
}
