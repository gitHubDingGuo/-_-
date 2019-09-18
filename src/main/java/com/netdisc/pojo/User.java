package com.netdisc.pojo;

import java.util.Date;

import lombok.Data;

/**
 * @author Stodger
 * @date 2019年8月28日
 * @version
 */

@Data
public class User {
    /**
     * 用户Id(自定义生成)
     */
    private String id;

    /**
     * 用户名
     */
    private String username;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 手机号
     */
    private String phone;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 头像
     */
    private String picture;

    /**
     * 总容量
     */
    private Integer totalCapacity;

    /**
     * 已使用容量
     */
    private Integer hasCapacity;
    
    /**
     * 注册时间
     */
    private Date registerTime;
    
    /**
     * 性别
     */
    private String sex;

    /**
     * 状态
     */
    private Integer status;
}