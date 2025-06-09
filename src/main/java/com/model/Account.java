package com.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.sql.Date;

public class Account implements Serializable {
  private static final long serialVersionUID = 1L;

  private long id;
  private String username; // 用户名（学号/工号）
  private String password; // 加密密码
  private String role; // 用户角色
  private int failedTimes; // 登录失败次数
  private Timestamp lockTime; // 锁定时间
  private Date lastPasswordChangeDate; // 最后密码修改时间

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getRole() {
    return role;
  }

  public void setRole(String role) {
    this.role = role;
  }

  public int getFailedTimes() {
    return failedTimes;
  }

  public void setFailedTimes(int failedTimes) {
    this.failedTimes = failedTimes;
  }

  public Timestamp getLockTime() {
    return lockTime;
  }

  public void setLockTime(Timestamp lockTime) {
    this.lockTime = lockTime;
  }

  public Date getLastPasswordChangeDate() {
    return lastPasswordChangeDate;
  }

  public void setLastPasswordChangeDate(Date lastPasswordChangeDate) {
    this.lastPasswordChangeDate = lastPasswordChangeDate;
  }
}
