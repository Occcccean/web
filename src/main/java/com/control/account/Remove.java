package com.control.account;

import com.service.AccountService;
import com.util.exceptions.WebException;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/account/delete")
public class Remove extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    var id = Long.parseLong(req.getParameter("id"));
    try {
      AccountService.delete(id);
    } catch (WebException e) {
      resp.getWriter().write(e.getMessage());
    }
  }
}
