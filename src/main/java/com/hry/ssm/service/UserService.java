package com.hry.ssm.service;

import com.hry.ssm.pojo.User;

import java.util.List;

public interface UserService {
    List<User> findAllUsers();
}
