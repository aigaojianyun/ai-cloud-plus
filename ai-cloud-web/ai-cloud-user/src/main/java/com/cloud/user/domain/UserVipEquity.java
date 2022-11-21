package com.cloud.user.domain;

import com.cloud.common.web.domain.Entity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 会员权益对象 user_vip_equity
 *
 * @author ai-cloud
 */
@Data
@ApiModel("会员权益")
public class UserVipEquity extends Entity {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    private String id;

    /**
     * 会员主表id
     */
    @ApiModelProperty(value = "会员主表id", example = "String")
    private String vipId;

    /**
     * 会员权益名称
     */
    @ApiModelProperty(value = "会员权益名称", example = "String")
    private String name;

    /**
     * 会员权益介绍
     */
    @ApiModelProperty(value = "会员权益介绍", example = "String")
    private String introduce;

    /**
     * 会员权益图标
     */
    @ApiModelProperty(value = "会员权益图标", example = "String")
    private String icon;

    /**
     * 会员权益权重值
     */
    @ApiModelProperty(value = "会员权益权重值", example = "Long")
    private Long weight;

    /**
     * 会员权益跳转链接
     */
    @ApiModelProperty(value = "会员权益跳转链接", example = "String")
    private String link;

    /**
     * 状态：1：启用，0：停用
     */
    @ApiModelProperty(value = "状态：1：启用，0：停用", example = "Long")
    private Long statusFlag;

    /**
     * 1:删除，0：未删除
     */
    @ApiModelProperty(value = "1:删除，0：未删除", example = "Long")
    private Long deleteFlag;

}


