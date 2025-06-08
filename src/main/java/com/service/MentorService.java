package com.service;

import com.dao.MentorDao;
import com.model.Mentor;

import java.util.ArrayList;
import java.util.List;

public class MentorService {

    private final MentorDao mentorDao = new MentorDao();

    // 添加导师
    public boolean addMentor(Mentor mentor) {
        // 1. 验证账户ID唯一性（基于现有DAO方法）
        if (mentor.getAccount_id() != null && mentorDao.getByAccountId(mentor.getAccount_id()) != null) {
            throw new IllegalArgumentException("账户ID已被使用");
        }

        // 2. 调用DAO添加导师
        return mentorDao.add(mentor);
    }

    // 根据ID获取导师
    public Mentor getMentorById(Long id) {
        return mentorDao.getById(id);
    }

    // 根据账户ID获取导师
    public Mentor getMentorByAccountId(Long accountId) {
        return mentorDao.getByAccountId(accountId);
    }

    // 更新导师信息
    public boolean updateMentor(Mentor mentor) {
        // 1. 验证导师存在
        Mentor existingMentor = mentorDao.getById(mentor.getId());
        if (existingMentor == null) {
            throw new IllegalArgumentException("导师ID不存在");
        }

        // 2. 验证账户ID是否被其他导师使用
        if (mentor.getAccount_id() != null &&
                !mentor.getAccount_id().equals(existingMentor.getAccount_id()) &&
                mentorDao.getByAccountId(mentor.getAccount_id()) != null) {
            throw new IllegalArgumentException("账户ID已被其他导师使用");
        }

        // 3. 更新导师信息
        return mentorDao.update(mentor);
    }

    // 删除导师
    public boolean deleteMentor(Long id) {
        // 1. 验证导师存在
        Mentor existingMentor = mentorDao.getById(id);
        if (existingMentor == null) {
            throw new IllegalArgumentException("导师ID不存在");
        }

        // 2. 删除导师
        return mentorDao.delete(id);
    }

    // 获取所有导师
    public List<Mentor> getAllMentors() {
        ArrayList<Mentor> mentors = mentorDao.getAll();
        return mentors != null ? mentors : new ArrayList<>();
    }
}