package com.hry.ssm.pojo;

public class Department {
    /** 主键 */
    private Integer deptId;

    /** 部门名称 */
    private String deptname;

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname = deptname == null ? null : deptname.trim();
    }
}