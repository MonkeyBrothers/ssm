package com.hry.ssm.service.impl;

import com.hry.ssm.mapper.UserMapper;
import com.hry.ssm.pojo.User;
import com.hry.ssm.pojo.UserExample;
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

    /**
     * 保存用户信息
     * @return
     */
    @Override
    public void saveUser(User user) {
        userMapper.insertSelective(user);
    }

    /**
     * 根据ID查询用户信息
     * @param id
     * @return
     */
    @Override
    public User getUser(int id) {
        User user = userMapper.selectByPrimaryKey(id);
        return user;
    }

    /**
     * 修改员工信息
     * @param user
     */

    public void updateUser(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    /**
     * 根据主键删除单个用户信息
     * @param id
     */
    @Override
    public void deleteUser(int id) {
        userMapper.deleteByPrimaryKey(id);
    }

    /**
     * 批量删除信息
     * @param ids
     */
    @Override
    public void deleteBatch(List<Integer> ids) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andUIdIn(ids);
        userMapper.deleteByExample(example);
    }
}
