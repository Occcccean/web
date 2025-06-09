package com.model.leader;

import java.io.Serializable;

public class UniversityLeader implements Serializable {
  private static final long serialVersionUID = 1L;

  private long id; // 主键ID
  private String name; // 学校领导姓名
  private long account_id; // 关联账户ID（唯一）

  // ===================== 访问器方法 =====================

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public long getAccount_id() {
    return account_id;
  }

  public void setAccount_id(long account_id) {
    this.account_id = account_id;
  }

}
