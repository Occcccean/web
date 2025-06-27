package com.control.student;

import com.dao.AccountDao;
import com.dao.StudentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/student/delete")
public class Delete extends HttpServlet {
  private final StudentDao studentDao = new StudentDao();
  private final AccountDao accountDao = new AccountDao();

  @Override
  protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
      // 从请求中获取学生ID
      String idStr = req.getParameter("id");
      if (idStr == null || idStr.isEmpty()) {
        throw new IllegalArgumentException("学生ID不能为空");
      }

      long studentId = Long.parseLong(idStr);

      // 执行删除操作
      var student = studentDao.getById(studentId);
      boolean success = studentDao.delete(studentId);
      boolean success2 = accountDao.delete(student.getAccount_id());

      if (success && success2) {
        resp.getWriter().write("删除成功");
      } else if (!success) {
        resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
        resp.getWriter().write("学生不存在或删除失败");
      } else {
        resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
        resp.getWriter().write("账号删除失败");
      }
    } catch (NumberFormatException e) {
      resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
      resp.getWriter().write("无效的学生ID格式");
    } catch (Exception e) {
      resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
      resp.getWriter().write("删除失败: " + e.getMessage());
    }
  }
}
