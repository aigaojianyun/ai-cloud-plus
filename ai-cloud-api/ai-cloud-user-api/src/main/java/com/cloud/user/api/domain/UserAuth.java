package com.cloud.user.api.domain;

import com.cloud.common.web.domain.Entity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 用户第三方授权对象 user_auth
 *
 * @author ai-cloud
 */
@Data
@ApiModel("用户第三方授权")
public class UserAuth extends Entity {

    private static final long serialVersionUID = 1L;

    /**
     * 授权ID
     */
    private Long id;

    /**
     * 系统用户ID
     */
    @ApiModelProperty(value = "系统用户ID", example = "Long")
    private Long userId;

    /**
     * 第三方平台用户唯一ID
     */
    @ApiModelProperty(value = "第三方平台用户唯一ID", example = "String")
    private String uuid;

    /**
     * 登录账号
     */
    @ApiModelProperty(value = "登录账号", example = "String")
    private String loginName;

    /**
     * 用户昵称
     */
    @ApiModelProperty(value = "用户昵称", example = "String")
    private String userName;

    /**
     * 头像地址
     */
    @ApiModelProperty(value = "头像地址", example = "String")
    private String avatar;

    /**
     * 用户邮箱
     */
    @ApiModelProperty(value = "用户邮箱", example = "String")
    private String email;

    /**
     * 用户来源
     */
    @ApiModelProperty(value = "用户来源", example = "String")
    private String source;

    /**
     * 状态：0：启用，2：停用
     */
    @ApiModelProperty(value = "状态：0：启用，2：停用", example = "Long")
    private Long statusFlag;

    /**
     * 删除：0：未删除，2：已删除
     */
    @ApiModelProperty(value = "删除：0：未删除，2：已删除", example = "Long")
    private Long deleteFlag;

}


