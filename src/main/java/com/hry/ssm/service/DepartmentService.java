package com.hry.ssm.service;

import com.hry.ssm.pojo.Department;

import java.util.List;

public interface DepartmentService {
    /**
     * 查询所有部门
     */
    List<Department> getDepts();

}
