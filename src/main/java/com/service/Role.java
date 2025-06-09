package com.service;

import com.dao.*;
import com.model.*;
import com.model.leader.*;
import com.util.exceptions.WebException;

public class Role {
  public static void delete(String role, long id) throws WebException {
    switch (role) {
      case "student": {
        new StudentDao().delete(id);
        break;
      }
      case "secretary": {
        new SecretaryDao().delete(id);
        break;
      }
      case "mentor": {
        new MentorDao().delete(id);
        break;
      }
      case "college_leader": {
        new CollegeLeaderDao().delete(id);
        break;
      }
      case "student_leader": {
        new StudentLeaderDao().delete(id);
        break;
      }
    }
  }

  public static void add(String name, String role, Long accountId) throws WebException {
    switch (role) {
      case "student": {
        var dao = new StudentDao();
        var student = new Student();
        student.setName(name);
        student.setAccount_id(accountId);
        dao.add(student);
        break;
      }
      case "secretary": {
        var dao = new SecretaryDao();
        var secretary = new Secretary();
        secretary.setName(name);
        secretary.setAccount_id(accountId);
        dao.add(secretary);
        break;
      }
      case "mentor": {
        var dao = new MentorDao();
        var mentor = new Mentor();
        mentor.setName(name);
        mentor.setAccount_id(accountId);
        dao.add(mentor);
        break;
      }
      case "college_leader": {
        var dao = new CollegeLeaderDao();
        var college_leader = new CollegeLeader();
        college_leader.setName(name);
        college_leader.setAccount_id(accountId);
        dao.add(college_leader);
        break;
      }
      case "student_leader": {
        var dao = new StudentLeaderDao();
        var student_leader = new StudentLeader();
        student_leader.setName(name);
        student_leader.setAccount_id(accountId);
        dao.add(student_leader);
        break;
      }
      case "university_leader": {
        var dao = new UniversityLeaderDao();
        var university_leader = new UniversityLeader();
        university_leader.setName(name);
        university_leader.setAccount_id(accountId);
        dao.add(university_leader);
        break;
      }
    }
  }
}
