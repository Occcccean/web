package com.model;

import java.io.Serializable;

public class Secretary implements Serializable {
  private static final long serialVersionUID = 1L;

  private Long id; // 主键ID
  private String name; // 秘书姓名
  private String college; // 所属学院（注意：原表中为college，可能拼写错误）
  private Long account_id; // 关联账户ID（唯一）

  // ===================== 访问器方法 =====================

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getCollege() {
    return college;
  }

  public void setCollege(String college) {
    this.college = college;
  }

  public Long getAccount_id() {
    return account_id;
  }

  public void setAccount_id(Long account_id) {
    this.account_id = account_id;
  }

}
