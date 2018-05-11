package com.hry.ssm.mapper;

import com.hry.ssm.pojo.User;
import com.hry.ssm.pojo.UserExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer uId);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    /**
     * 根据条件查询用户信息的时候连同用户所在部门一块查询
     * @param example
     * @return
     */
    List<User> selectByExampleWidthDept(UserExample example);

    User selectByPrimaryKey(Integer uId);

    /**
     * 根据主键查询用户信息的时候连同用户所在部门一块查询
     * @param uId
     * @return
     */
    User selectByPrimaryKeyWithDept(Integer uId);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}