package com.hry.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hry.ssm.pojo.User;
import com.hry.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/user")
    public String findAllUsers(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber, Model model) {
        // 设置页码，和每页大小
        PageHelper.startPage(pageNumber, 5);
        List<User> allUsers = userService.findAllUsers();
        // 利用pageInfo进行封装  详细信息
        PageInfo pageInfo = new PageInfo(allUsers, 5);
        model.addAttribute("pageInfo", pageInfo);
        return "login";

    }
}
