package com.cloud.user.domain;

import com.cloud.common.web.domain.Entity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 用户设置对象 user_set
 *
 * @author ai-cloud
 */
@Data
@ApiModel("用户设置")
public class UserSet extends Entity {

    private static final Long serialVersionUID = 1L;

    /**
     * id
     */
    private String id;

    /**
     * 用户id
     */
    @ApiModelProperty(value = "用户id", example = "String")
    private Long userId;

    /**
     * 用户头像
     */
    @ApiModelProperty(value = "用户头像", example = "String")
    private String headImg;

    /**
     * 用户昵称
     */
    @ApiModelProperty(value = "用户昵称", example = "String")
    private String nickName;

    /**
     * 设备唯一标识
     */
    @ApiModelProperty(value = "设备唯一标识", example = "String")
    private String uuid;

    /**
     * 消息推送是否开启震动；1：开启，0：未开启
     */
    @ApiModelProperty(value = "消息推送是否开启震动；1：开启，0：未开启", example = "Integer")
    private Integer messageShake;

    /**
     * 消息推送是否开启铃声；1：开启，0：未开启
     */
    @ApiModelProperty(value = "消息推送是否开启铃声；1：开启，0：未开启", example = "Integer")
    private Integer messageAlarm;

    /**
     * 点赞提醒是否开启；1：开启，0：未开启
     */
    @ApiModelProperty(value = "点赞提醒是否开启；1：开启，0：未开启", example = "Integer")
    private Integer likeRemind;

    /**
     * 关注提醒是否开启；1：开启，0：未开启
     */
    @ApiModelProperty(value = "关注提醒是否开启；1：开启，0：未开启", example = "Integer")
    private Integer attentionRemind;

    /**
     * 系统通知提醒是否开启；1：开启，0：未开启
     */
    @ApiModelProperty(value = "系统通知提醒是否开启；1：开启，0：未开启", example = "Integer")
    private Integer notification;

    /**
     * 评论提醒是否开启；1：开启，0：未开启
     */
    @ApiModelProperty(value = "评论提醒是否开启；1：开启，0：未开启", example = "Integer")
    private Integer commentRemind;

    /**
     * 状态：1：启用，0：停用
     */
    @ApiModelProperty(value = "状态：1：启用，0：停用", example = "Integer")
    private Integer statusFlag;

    /**
     * 1:删除，0：未删除
     */
    @ApiModelProperty(value = "1:删除，0：未删除", example = "Integer")
    private Integer deleteFlag;

}


