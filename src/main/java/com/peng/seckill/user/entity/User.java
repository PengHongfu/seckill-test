package com.peng.seckill.user.entity;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

/**
 * Created by Peng
 * Time: 2017/4/17 15:50
 * 用户实体类
 */
public class User {

    //对应数据库表 t_user
    private String uid;//主键

    @NotEmpty(message = "用户名不能为空")
    @Length(min=3,max =30,message = "用户名必须在3到30字符")
    private String loginname;//登录名

    @NotEmpty(message = "密码不能为空")
    @Length(min=3,max =30,message = "密码必须在6到30字符")
    private String loginpass;//登录密码

    @NotEmpty(message = "邮箱不能为空")
    @Email(message = "邮箱格式不正确")
    private String email;//邮箱

    private String phone;//电话
    private String address;//地址

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getLoginpass() {
        return loginpass;
    }

    public void setLoginpass(String loginpass) {
        this.loginpass = loginpass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid='" + uid + '\'' +
                ", loginname='" + loginname + '\'' +
                ", loginpass='" + loginpass + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
