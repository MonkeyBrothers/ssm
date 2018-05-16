package com.hry.ssm.controller;

import com.hry.ssm.pojo.Department;
import com.hry.ssm.service.DepartmentService;
import com.hry.ssm.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;
    @RequestMapping("/depts")
    @ResponseBody
    public Message getDepts() {
        List<Department> list = departmentService.getDepts();
        return Message.success().add("depts", list);
    }
}
