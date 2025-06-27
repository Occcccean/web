package com.control.student;

import com.dao.StudentDao;
import com.model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/student/list")
public class GetAll extends HttpServlet {
  private final StudentDao studentDao = new StudentDao();

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
      // 获取所有学生
      ArrayList<Student> students = studentDao.getAll();

      // 构建HTML表格
      StringBuilder html = new StringBuilder();
      html.append("<!DOCTYPE html>\n");
      html.append("<html>\n<head><title>学生列表</title></head>\n<body>\n");
      html.append("<h1>学生信息列表</h1>\n");
      html.append("<table border='1'>\n");
      html.append("<tr>\n");
      html.append("<th>ID</th>\n");
      html.append("<th>学号</th>\n");
      html.append("<th>姓名</th>\n");
      html.append("<th>性别</th>\n");
      html.append("<th>学院</th>\n");
      html.append("<th>专业</th>\n");
      html.append("</tr>\n");

      for (Student student : students) {
        html.append("<tr>\n");
        html.append("<td>").append(student.getId()).append("</td>\n");
        html.append("<td>").append(student.getStudent_id()).append("</td>\n");
        html.append("<td>").append(student.getName()).append("</td>\n");
        html.append("<td>").append(student.getGender()).append("</td>\n");
        html.append("<td>").append(student.getCollege()).append("</td>\n");
        html.append("<td>").append(student.getMajor()).append("</td>\n");
        html.append("</tr>\n");
      }

      html.append("</table>\n</body>\n</html>");

      // 输出HTML
      resp.getWriter().write(html.toString());
    } catch (Exception e) {
      resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
      resp.getWriter().write("错误：获取学生列表失败 - " + e.getMessage());
    }
  }
}
