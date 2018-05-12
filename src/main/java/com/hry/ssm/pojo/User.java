package com.hry.ssm.pojo;

public class User {
    /** 用户ID */
    private Integer uId;

    /** 用户名 */
    private String username;

    /** 用户密码 */
    private String password;

    /** 用户邮箱 */
    private String email;

    /** 用户性别 */
    private String gender;

    /** 用户所属部门 */
    private Integer deptId;

    /** 增加部门属性*/
    private Department department;

    public User() {
    }

    public User(Integer uId, String username, String password, String email, String gender, Integer deptId) {
        this.uId = uId;
        this.username = username;
        this.password = password;
        this.email = email;
        this.gender = gender;
        this.deptId = deptId;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getUsername() {
        return username;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }
}