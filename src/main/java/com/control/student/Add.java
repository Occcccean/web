package com.control.student;

import com.dao.StudentDao;
import com.model.Student;

import com.service.StudentService;
import com.util.exceptions.WebException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/student/add")
public class Add  extends HttpServlet {
    private final StudentDao studentDao = new StudentDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // 设置编码
            req.setCharacterEncoding("UTF-8");
            resp.setContentType("application/json;charset=UTF-8");

            var sid=req.getParameter("student_id");
            var name=req.getParameter("name");
            var gender=req.getParameter("gender");
            var id_number=req.getParameter("id_number");
            var phone_number=req.getParameter("phone_number");
            StudentService.add(sid,name,gender,id_number,phone_number);
        } catch (WebException e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write(e.getMessage());
        }
    }

    private Student createStudentFromRequest(HttpServletRequest req) throws ParseException {
        Student student = new Student();

        // 基本信息
        student.setName(req.getParameter("name"));
        student.setStudent_id(req.getParameter("student_id"));
        student.setGender(req.getParameter("gender"));
        student.setNation(req.getParameter("nation"));
        student.setBirth_place(req.getParameter("birth_place"));
        student.setId_number(req.getParameter("id_number"));
        student.setCountry(req.getParameter("country"));
        student.setHome_address(req.getParameter("home_address"));
        student.setPhone_number(req.getParameter("phone_number"));
        student.setEmail(req.getParameter("email"));
        student.setDorm_id(req.getParameter("dorm_id"));
        student.setWechat(req.getParameter("wechat"));
        student.setQq(req.getParameter("qq"));
        student.setHome_phone_number(req.getParameter("home_phone_number"));
        student.setHome_contact_man(req.getParameter("home_contact_man"));

        // 日期字段处理
        student.setBirth_date(parseDate(req.getParameter("birth_date")));
        student.setEntrance_date(parseDate(req.getParameter("entrance_date")));

        // 教育信息
        if (req.getParameter("grade") != null && !req.getParameter("grade").isEmpty()) {
            student.setGrade(Integer.parseInt(req.getParameter("grade")));
        }
        student.setCollege(req.getParameter("college"));
        student.setMajor(req.getParameter("major"));
        student.setCampus(req.getParameter("campus"));
        student.setClass_id(req.getParameter("class_id"));

        // 关联ID
        if (req.getParameter("account_id") != null && !req.getParameter("account_id").isEmpty()) {
            student.setAccount_id(Long.parseLong(req.getParameter("account_id")));
        }
        if (req.getParameter("mentor_id") != null && !req.getParameter("mentor_id").isEmpty()) {
            student.setMentor_id(Long.parseLong(req.getParameter("mentor_id")));
        }
        student.setMentor(req.getParameter("mentor"));

        return student;
    }

    // 辅助方法：解析日期字符串
    private Date parseDate(String dateStr) throws ParseException {
        if (dateStr == null || dateStr.isEmpty()) {
            return null;
        }
        // 支持 yyyy-MM-dd 格式
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return new Date(sdf.parse(dateStr).getTime());
    }
}
