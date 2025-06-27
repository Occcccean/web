package com.control.student;

import com.service.StudentService;
import com.util.exceptions.WebException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/student/add")
public class Add extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
      // 设置编码
      var sid = req.getParameter("student_id");
      var name = req.getParameter("name");
      var gender = req.getParameter("gender");
      var id_number = req.getParameter("id_number");
      var phone_number = req.getParameter("phone_number");
      StudentService.add(sid, name, gender, id_number, phone_number);
      resp.getWriter().write("200 ok");
    } catch (WebException e) {
      resp.getWriter().write(e.getMessage());
    } catch (NullPointerException e) {
      resp.getWriter().write("空指针异常: " + e.getMessage());
    } catch (Exception e) {
      resp.getWriter().write("未知异常: " + e.getMessage());
    }
  }
}
