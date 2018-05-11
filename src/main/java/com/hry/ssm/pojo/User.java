package com.hry.ssm.pojo;

public class User {
    /**  */
    private Integer id;

    /**  */
    private String username;

    /**  */
    private String password;

    /**  */
    private String email;

    /**  */
    private String gender;

    /**  */
    private Integer deprid;

    public User() {
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
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

    public Integer getDeprid() {
        return deprid;
    }

    public void setDeprid(Integer deprid) {
        this.deprid = deprid;
    }
}