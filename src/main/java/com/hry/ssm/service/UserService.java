package com.hry.ssm.service;

import com.hry.ssm.pojo.User;

import java.util.List;

public interface UserService {
    List<User> findAllUsers();

    /**
     * 添加新的用户
     * @param user
     */
    void saveUser(User user);
    /**
     * 查询用户信息
     */
    User getUser(int id);
    /**
     * 修改员工信息
     */
    void updateUser(User user);
}
