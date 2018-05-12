package com.hry.ssm.service.impl;

import com.hry.ssm.mapper.UserMapper;
import com.hry.ssm.pojo.User;
import com.hry.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    /**
     * 查询所有用户信息
     * @return
     */
    @Override
    public List<User> findAllUsers() {
        List<User> userList = userMapper.selectByExampleWidthDept(null);
        return userList;
    }
}
