package com.control.student;

import com.dao.StudentDao;
import com.model.Student;

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



@WebServlet("/student/update")
public class Update extends HttpServlet {
    private final StudentDao studentDao = new StudentDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("UTF-8");
            resp.setContentType("application/json;charset=UTF-8");

            // 获取学生学号并验证
            String idStr = req.getParameter("student_id");
            if (idStr == null || idStr.isEmpty()) {
                throw new WebException("学号不能为空");
            }

            // 检查学生是否存在
            Student existingStudent = studentDao.getByStudentId(idStr);
            if (existingStudent == null) {
                throw new WebException("学号不存在");
            }

            // 更新学生信息（根据DAO方法调整字段映射）
            updateStudentFields(existingStudent, req);

            // 执行更新
            boolean success = studentDao.update(existingStudent);

            if (success) {
                resp.getWriter().write("更新成功");
            } else {
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                resp.getWriter().write("更新失败");
            }
        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write(e.getMessage());
        }
    }

    private void updateStudentFields(Student student, HttpServletRequest req) throws ParseException {
        // 基本信息
        updateStringField(student::setName, req.getParameter("name"));
        updateStringField(student::setGender, req.getParameter("gender"));
        updateStringField(student::setNation, req.getParameter("nation"));
        updateStringField(student::setBirth_place, req.getParameter("birth_place"));

        // 身份证号验证
        String idNumber = req.getParameter("id_number");
        if (idNumber != null && !idNumber.isEmpty()) {
            if (!isValidIdNumber(idNumber)) {
                throw new IllegalArgumentException("无效的身份证号码");
            }
            student.setId_number(idNumber);
        }

        // 其他信息
        updateStringField(student::setCountry, req.getParameter("country"));
        updateStringField(student::setHome_address, req.getParameter("home_address"));
        updateStringField(student::setPhone_number, req.getParameter("phone_number"));

        // 邮箱验证
        String email = req.getParameter("email");
        if (email != null && !email.isEmpty()) {
            if (!isValidEmail(email)) {
                throw new IllegalArgumentException("无效的邮箱地址");
            }
            student.setEmail(email);
        }

        // 剩余字段更新
        updateStringField(student::setDorm_id, req.getParameter("dorm_id"));
        updateStringField(student::setWechat, req.getParameter("wechat"));
        updateStringField(student::setQq, req.getParameter("qq"));
        updateStringField(student::setHome_phone_number, req.getParameter("home_phone_number"));
        updateStringField(student::setHome_contact_man, req.getParameter("home_contact_man"));

        // 日期字段处理
        updateDateField(student::setBirth_date, req.getParameter("birth_date"));
        updateDateField(student::setEntrance_date, req.getParameter("entrance_date"));

        // 教育信息
        updateIntegerField(student::setGrade, req.getParameter("grade"));
        updateStringField(student::setCollege, req.getParameter("college"));
        updateStringField(student::setMajor, req.getParameter("major"));
        updateStringField(student::setCampus, req.getParameter("campus"));

        // 修正：根据DAO方法，班级字段应为class_name
        updateStringField(student::setClass_id, req.getParameter("class_name"));

        // 关联ID
        updateLongField(student::setAccount_id, req.getParameter("account_id"));
        updateLongField(student::setMentor_id, req.getParameter("mentor_id"));
        updateStringField(student::setMentor, req.getParameter("mentor"));
    }

    // 辅助方法：更新字符串字段
    private void updateStringField(java.util.function.Consumer<String> setter, String value) {
        if (value != null && !value.isEmpty()) {
            setter.accept(value);
        }
    }

    // 辅助方法：更新日期字段
    private void updateDateField(java.util.function.Consumer<Date> setter, String dateStr) throws ParseException {
        if (dateStr != null && !dateStr.isEmpty()) {
            setter.accept(parseDate(dateStr));
        }
    }

    // 辅助方法：更新整数字段
    private void updateIntegerField(java.util.function.Consumer<Integer> setter, String value) {
        if (value != null && !value.isEmpty()) {
            setter.accept(Integer.parseInt(value));
        }
    }

    // 辅助方法：更新长整数字段
    private void updateLongField(java.util.function.Consumer<Long> setter, String value) {
        if (value != null && !value.isEmpty()) {
            setter.accept(Long.parseLong(value));
        }
    }

    // 解析日期字符串
    private Date parseDate(String dateStr) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return new Date(sdf.parse(dateStr).getTime());
    }

    // 身份证号验证
    private boolean isValidIdNumber(String idNumber) {
        if (idNumber == null || idNumber.isEmpty()) {
            return false;
        }

        // 长度校验
        int length = idNumber.length();
        if (length == 18) {
            // 18位验证
            return idNumber.matches("^[1-9]\\d{5}(18|19|20)\\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\\d|3[01])\\d{3}(\\d|X|x)$");
        } else if (length == 15) {
            // 15位验证
            return idNumber.matches("^[1-9]\\d{5}\\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\\d|3[01])\\d{3}$");
        }

        return false;
    }

    // 邮箱验证
    private boolean isValidEmail(String email) {
        if (email == null || email.isEmpty()) {
            return false;
        }
        return email.matches("^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$");
    }
}
