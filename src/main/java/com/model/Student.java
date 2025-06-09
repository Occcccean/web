package com.model;

import java.io.Serializable;
import java.sql.Date;

public class Student implements Serializable {
  private static final long serialVersionUID = 1L;

  private long id;
  private String student_id; // 学号
  private String name; // 姓名
  private String gender; // 性别
  private String nation; // 民族
  private Date birth_date; // 出生日期
  private String birth_place; // 出生地
  private String id_number; // 身份证号
  private String country; // 国家
  private String home_address; // 家庭地址
  private String phone_number; // 手机号
  private String email; // 邮箱
  private String dorm_id; // 宿舍号
  private int grade; // 年级
  private String college; // 学院（注意：原表中为college，可能拼写错误）
  private String major; // 专业
  private String campus; // 校区
  private Date entrance_date; // 入学日期
  private String class_id; // 班级（Java关键字，需使用class_或className）
  private String wechat; // 微信
  private String qq; // QQ
  private String home_phone_number; // 家庭电话
  private String home_contact_man; // 家庭联系人

  private long account_id; // 账户ID
  private long mentor_id; // 导师ID
  private String mentor; // 导师姓名

  // ===================== 访问器方法 =====================

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public String getStudent_id() {
    return student_id;
  }

  public void setStudent_id(String student_id) {
    this.student_id = student_id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public String getNation() {
    return nation;
  }

  public void setNation(String nation) {
    this.nation = nation;
  }

  public Date getBirth_date() {
    return birth_date;
  }

  public void setBirth_date(Date birth_date) {
    this.birth_date = birth_date;
  }

  public String getBirth_place() {
    return birth_place;
  }

  public void setBirth_place(String birth_place) {
    this.birth_place = birth_place;
  }

  public String getId_number() {
    return id_number;
  }

  public void setId_number(String id_number) {
    this.id_number = id_number;
  }

  public String getCountry() {
    return country;
  }

  public void setCountry(String country) {
    this.country = country;
  }

  public String getHome_address() {
    return home_address;
  }

  public void setHome_address(String home_address) {
    this.home_address = home_address;
  }

  public String getPhone_number() {
    return phone_number;
  }

  public void setPhone_number(String phone_number) {
    this.phone_number = phone_number;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getDorm_id() {
    return dorm_id;
  }

  public void setDorm_id(String dorm_id) {
    this.dorm_id = dorm_id;
  }

  public int getGrade() {
    return grade;
  }

  public void setGrade(int grade) {
    this.grade = grade;
  }

  public String getCollege() {
    return college;
  }

  public void setCollege(String college) {
    this.college = college;
  }

  public String getMajor() {
    return major;
  }

  public void setMajor(String major) {
    this.major = major;
  }

  public String getCampus() {
    return campus;
  }

  public void setCampus(String campus) {
    this.campus = campus;
  }

  public Date getEntrance_date() {
    return entrance_date;
  }

  public void setEntrance_date(Date entrance_date) {
    this.entrance_date = entrance_date;
  }

  public String getClass_id() {
    return class_id;
  }

  public void setClass_id(String class_num) {
    this.class_id = class_num;
  }

  public String getWechat() {
    return wechat;
  }

  public void setWechat(String wechat) {
    this.wechat = wechat;
  }

  public String getQq() {
    return qq;
  }

  public void setQq(String qq) {
    this.qq = qq;
  }

  public String getHome_phone_number() {
    return home_phone_number;
  }

  public void setHome_phone_number(String home_phone_number) {
    this.home_phone_number = home_phone_number;
  }

  public String getHome_contact_man() {
    return home_contact_man;
  }

  public void setHome_contact_man(String home_contact_man) {
    this.home_contact_man = home_contact_man;
  }

  public long getAccount_id() {
    return account_id;
  }

  public void setAccount_id(long account_id) {
    this.account_id = account_id;
  }

  public long getMentor_id() {
    return mentor_id;
  }

  public void setMentor_id(long mentor_id) {
    this.mentor_id = mentor_id;
  }

  public String getMentor() {
    return mentor;
  }

  public void setMentor(String mentor) {
    this.mentor = mentor;
  }

}
