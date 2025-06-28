package com.util.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.util.Utils;
import com.util.exceptions.WebException;

@WebFilter("/account/*")
public class Account implements Filter {

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {
    try {
      Utils.checkRole((HttpServletRequest) request, "system_manager");
      chain.doFilter(request, response);
      Utils.redirect((HttpServletResponse) response, "/account/edit.jsp");
    } catch (WebException e) {
      response.getWriter().write("权限不足");
    }
  }

}
