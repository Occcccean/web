package com.control.mentor;

import com.dao.MentorDao;
import com.dao.StudentDao;
import com.model.Student;
import com.util.exceptions.WebException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/mentor/students")
public class GetStudents extends HttpServlet {
    private final StudentDao studentDao = new StudentDao();
    private final MentorDao mentorDao = new MentorDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            resp.setContentType("text/plain;charset=UTF-8");
            PrintWriter out = resp.getWriter();

            // 获取导师ID参数
            String mentorIdStr = req.getParameter("mentorId");
            if (mentorIdStr == null || mentorIdStr.isEmpty()) {
                throw new WebException("ID不能为空");

            }

            long mentorId = Long.parseLong(mentorIdStr);

            // 验证导师是否存在
            if (mentorDao.getById(mentorId)==null) {
                throw new WebException("指定导师不存在");

            }

            // 获取导师的学生列表
            ArrayList<Student> students = studentDao.getByMentorId(mentorId);


        } catch (NumberFormatException e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"code\":400,\"message\":\"无效的导师ID格式\"}");
        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("{\"code\":500,\"message\":\"获取学生列表失败: " + e.getMessage() + "\"}");
        }
    }


}
