package com.cloud.user.api.model;

import com.cloud.user.api.domain.User;
import lombok.Data;

import java.io.Serializable;

/**
 * 用户信息
 *
 * @author ai-cloud
 */
@Data
public class LoginUser implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 用户唯一标识
     */
    private String token;

    /**
     * 用户类型
     */
    private String userType;

    /**
     * 用户名id
     */
    private Long userid;

    /**
     * 用户名
     */
    private String username;

    /**
     * 登录时间
     */
    private Long loginTime;

    /**
     * 过期时间
     */
    private Long expireTime;

    /**
     * 登录IP地址
     */
    private String ipaddr;

    /**
     * 普通用户信息
     */
    private User user;

}
