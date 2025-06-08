package com.service;

import com.dao.StudentDao;
import com.model.Student;

import java.util.Date;
import java.util.List;

public class StudentService {

    private final StudentDao studentDao = new StudentDao();

    // 添加学生
    public boolean addStudent(Student student) throws Exception {
        // 1. 验证学号唯一性
        if (studentDao.getByStudentId(student.getStudent_id()) != null) {
            throw new IllegalArgumentException("学号已存在");
        }

        // 2. 验证导师是否存在
        if (student.getMentor_id() != null &&
                new MentorService().getMentorById(student.getMentor_id()) == null) {
            throw new IllegalArgumentException("导师ID不存在");
        }

        // 3. 敏感信息处理（示例：简单掩码）
        if (student.getId_number() != null) {
            student.setId_number(maskSensitiveInfo(student.getId_number()));
        }
        if (student.getPhone_number() != null) {
            student.setPhone_number(maskSensitiveInfo(student.getPhone_number()));
        }

        // 4. 设置默认值
        if (student.getEntrance_date() == null) {
            student.setEntrance_date(new Date());
        }

        // 5. 调用DAO添加学生
        return studentDao.add(student);
    }

    // 根据ID获取学生
    public Student getStudentById(Long id) {
        Student student = studentDao.getById(id);
        if (student != null) {
            // 还原显示格式
            student.setId_number(unmaskSensitiveInfo(student.getId_number()));
            student.setPhone_number(unmaskSensitiveInfo(student.getPhone_number()));
        }
        return student;
    }

    // 更新学生信息
    public boolean updateStudent(Student student) throws Exception {
        // 1. 获取原始学生信息
        Student oldStudent = studentDao.getById(student.getId());
        if (oldStudent == null) {
            throw new IllegalArgumentException("学生ID不存在");
        }

        // 2. 处理敏感信息
        if (student.getId_number() != null) {
            student.setId_number(maskSensitiveInfo(student.getId_number()));
        } else {
            student.setId_number(oldStudent.getId_number());
        }

        if (student.getPhone_number() != null) {
            student.setPhone_number(maskSensitiveInfo(student.getPhone_number()));
        } else {
            student.setPhone_number(oldStudent.getPhone_number());
        }

        // 3. 验证导师是否存在
        if (!student.getMentor_id().equals(oldStudent.getMentor_id()) &&
                new MentorService().getMentorById(student.getMentor_id()) == null) {
            throw new IllegalArgumentException("导师ID不存在");
        }

        // 4. 更新学生信息
        return studentDao.update(student);
    }

    // 删除学生（逻辑删除）
    public boolean deleteStudent(Long id) throws Exception {
        // 验证学生存在
        Student student = studentDao.getById(id);
        if (student == null) {
            throw new IllegalArgumentException("学生ID不存在");
        }

        // 直接调用DAO的物理删除方法
        return studentDao.delete(id);
    }

    // 获取学院所有学生
    public List<Student> getStudentsByCollege(String college) {
        List<Student> students = studentDao.getByCollege(college);
        students.forEach(s -> {
            s.setId_number(unmaskSensitiveInfo(s.getId_number()));
            s.setPhone_number(unmaskSensitiveInfo(s.getPhone_number()));
        });
        return students;
    }

    // 简单敏感信息掩码
    private String maskSensitiveInfo(String info) {
        if (info == null || info.length() <= 4) return info;
        return "****" + info.substring(info.length() - 4);
    }

    // 简单敏感信息还原
    private String unmaskSensitiveInfo(String maskedInfo) {
        return maskedInfo; // 实际项目中应从加密存储中解密
    }
}