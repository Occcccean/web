package com.control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet("/test")
public class test extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("id");
            String name = req.getParameter("name");
            DataSource dataSource = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/CustomerDB");
            PreparedStatement stmt=  dataSource.getConnection().prepareStatement("INSERT INTO student_leader(account_id,name) values (?,?)");
            stmt.setInt(1,Integer.parseInt(id,10));
            stmt.setString(2,name);
            int line = stmt.executeUpdate();
            resp.getWriter().write("ok, updated "+line+" line");
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
