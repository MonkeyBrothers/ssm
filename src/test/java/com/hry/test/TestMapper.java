package com.hry.test;

import com.hry.ssm.mapper.UserMapper;
import com.hry.ssm.pojo.User;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class TestMapper {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    @Test
    public void testCurd() {
        SqlSession sqlSession = sqlSessionTemplate.getSqlSessionFactory().openSession(ExecutorType.BATCH, false);
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        for (int i = 0; i < 50; i++) {
            String username = UUID.randomUUID().toString().substring(0, 5).replace("-", "");
            mapper.insertSelective(new User(null, username + "hry", "123", username + "@qq.com", "male", 1));
            sqlSession.commit();
        }
        System.out.println("批量成功");
    }

}

