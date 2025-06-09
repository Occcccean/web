package com.service;

import com.dao.StudentDao;
import com.model.Student;
import com.util.exceptions.WebException;

import java.util.Date;
import java.util.List;

public class StudentService {

    private static StudentDao studentDao = new StudentDao();
    public static void add(
     String student_id,
     String name,
     String gender,
     String id_number,
     String phone_number)throws WebException {
        if (!student_id.matches("^\\d{12}$"))
            throw new WebException("学号格式错误");
        if (!gender.equals("男") && !gender.equals("女"))
            throw new WebException("这里是中国，滚出去");
        if (!id_number.matches("^[1-9]\\d{5}(18|19|20)\\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\\d|3[01])\\d{3}(\\d|X|x)$"))
            throw new WebException("身份证号格式错误");
        if(!phone_number.matches("^[1-9]\\d{10}$"))
            throw new WebException("手机号格式错误");

        AccountService.add(name,student_id,id_number.substring(id_number.length()-8),"student");
        var accountId = AccountService.getByUsername(student_id).getId();
        var student = studentDao.getByAccountId(accountId);
        student.setName(name);
        student.setGender(gender);
        student.setStudent_id(student_id);
        student.setId_number(id_number);
        student.setPhone_number(phone_number);
        studentDao.update(student);

    }
}