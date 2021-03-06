package com.hry.test;

import com.github.pagehelper.PageInfo;
import com.hry.ssm.pojo.User;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

// 指定spring配置文件
@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml", "classpath:spring/springmvc.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class TestPageHelper {
    @Autowired
    WebApplicationContext context;
    // 虚拟mvc请求获取到处理结果
    MockMvc mockMvc;

    @Before
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }



    @Test
    public void testPage() throws Exception {
        // 模拟请求并返回
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/user").param("pageNumber", "1")).andReturn();
        // 取出pageInfo进行验证
        MockHttpServletRequest request = result.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码" + pageInfo.getPageNum());
        System.out.println("总页码" + pageInfo.getPages());
        System.out.println("总记录数" + pageInfo.getTotal());
        int[] nums = pageInfo.getNavigatepageNums();
        System.out.print("连续显示的页码");
        for (int i : nums) {
            System.out.print("" + i);
        }
        System.out.println();
        List<User> userList = pageInfo.getList();
        for (User user : userList) {
            System.out.println("学生姓名：" + user.getUsername());
            System.out.println("学生密码：" + user.getPassword());
            System.out.println("所属部门：" + user.getDeptId());
        }
    }
}
