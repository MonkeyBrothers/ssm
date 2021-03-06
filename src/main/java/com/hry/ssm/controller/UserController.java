package com.hry.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hry.ssm.pojo.User;
import com.hry.ssm.service.UserService;
import com.hry.ssm.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

//    @RequestMapping("/user")
//    public String findAllUsers(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber, Model model) {
//        // 设置页码，和每页大小
//        PageHelper.startPage(pageNumber, 3);
//        List<User> allUsers = userService.findAllUsers();
//        // 利用pageInfo进行封装  详细信息
//        PageInfo pageInfo = new PageInfo(allUsers, 5);
//        model.addAttribute("pageInfo", pageInfo);
//        return "login";
//
//    }
    @RequestMapping("/user")
    @ResponseBody
    public Message getUsersWithJson(@RequestParam(value = "pageNumber", defaultValue = "1") Integer pageNumber) {
        PageHelper.startPage(pageNumber, 3);
        List<User> userList = userService.findAllUsers();
        // 连续显示页数
        PageInfo pageInfo = new PageInfo(userList, 3);
        return Message.success().add("pageInfo", pageInfo);
    }

    /**
     * 添加用户
     * @param user
     * @return
     */
    @RequestMapping( value = "/user", method = RequestMethod.POST)
    @ResponseBody
    public Message saveUser(User user) {
        userService.saveUser(user);
        return Message.success().add("pageInfo", "ok");
    }

    /**
     * 根据主键查询用户
     */
    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Message getUser(@PathVariable("id") Integer id) {
        User user = userService.getUser(id);
        return Message.success().add("user", user);

    }

    /**
     * 根据主键更新用户
     */
    @ResponseBody
    @RequestMapping(value = "/user/{uId}", method = RequestMethod.PUT)
    public Message updateUser(User user) {
        userService.updateUser(user);
        return Message.success();
    }

    /**
     * 单个多个二合一
     *
     */
    @ResponseBody
    @RequestMapping(value = "/user/{ids}", method = RequestMethod.DELETE)
    public Message deleteUser(@PathVariable("ids") String ids) {
        // 判断是不是有“-” 进行批量删除
        if (ids.contains("-")) {
            // 创建一个数组接受要删除的id
            List<Integer> del_ids = new ArrayList<>();
            // 分割或得到的字符串
            String[] str_ids = ids.split("-");
            for (String string : str_ids) {
                // 把分割好的放进数组中
                del_ids.add(Integer.parseInt(string));
            }
            // 调用批量删除方法
            userService.deleteBatch(del_ids);
        } else {
            Integer id = Integer.parseInt(ids);
            userService.deleteUser(id);
        }
        return Message.success();
    }

}
