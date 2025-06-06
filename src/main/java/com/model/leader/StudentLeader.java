package com.model.leader;

import java.io.Serializable;

public class StudentLeader implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;                // 主键ID
    private String name;            // 学生干部姓名
    private Long account_id;        // 关联账户ID（唯一）

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

    public Long getAccount_id() {
        return account_id;
    }

    public void setAccount_id(Long account_id) {
        this.account_id = account_id;
    }

}