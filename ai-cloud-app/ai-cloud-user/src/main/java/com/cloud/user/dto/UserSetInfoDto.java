package com.cloud.user.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 用户设置信息
 *
 * @author ai-cloud
 */
@Data
@ApiModel("用户设置信息")
public class UserSetInfoDto {

    @ApiModelProperty(value = "消息推送是否开启震动；1：开启，0：未开启", example = "1")
    private Integer messageShake;

    @ApiModelProperty(value = "消息推送是否开启铃声；1：开启，0：未开启", example = "1")
    private Integer messageAlarm;

    @ApiModelProperty(value = "点赞提醒是否开启；1：开启，0：未开启", example = "1")
    private Integer likeRemind;

    @ApiModelProperty(value = "关注提醒是否开启；1：开启，0：未开启", example = "1")
    private Integer attentionRemind;

    @ApiModelProperty(value = "系统通知提醒是否开启；1：开启，0：未开启", example = "1")
    private Integer notification;

    @ApiModelProperty(value = "评论提醒是否开启；1：开启，0：未开启", example = "1")
    private Integer commentRemind;

}
