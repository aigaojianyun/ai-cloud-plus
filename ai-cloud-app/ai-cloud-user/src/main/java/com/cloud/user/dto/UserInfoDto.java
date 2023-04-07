package com.cloud.user.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * 用户详细信息
 *
 * @author ai-cloud
 */
@Data
@ApiModel("用户详细信息")
public class UserInfoDto {

    @ApiModelProperty(value = "账号", example = "ai888")
    private String userName;

    @ApiModelProperty(value = "昵称", example = "小宝贝")
    private String nickName;

    @ApiModelProperty(value = "用户头像", example = "https://aicloud.png")
    private String headImg;

    @ApiModelProperty(value = "绑定手机号", example = "13888888888")
    private String phone;

    @ApiModelProperty(value = "性别 0男 1女 2未知", example = "0")
    private String sex;

    @ApiModelProperty(value = "年龄", example = "18")
    private String age;

    @ApiModelProperty(value = "签名", example = "这个世界本就是平衡的")
    private String sign;

    @ApiModelProperty(value = "用户类型（1普通用户 ，2会员用户）", example = "1")
    private Integer userType;

    @ApiModelProperty(value = "会员类型（1非会员 ，2普通会员 ，3VIP会员 ，4SVIP会员）", example = "1")
    private Integer vipType;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty(value = "会员开始时间", example = "2020-01-01")
    private Date vipStartTime;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty(value = "会员结束时间", example = "2030-01-01")
    private Date vipEndTime;

    @ApiModelProperty(value = "粉丝总数", example = "100")
    private Integer fans;

    @ApiModelProperty(value = "关注总数", example = "100")
    private Integer attention;

    @ApiModelProperty(value = "点赞总数", example = "100")
    private Integer likes;

    @ApiModelProperty(value = "排名", example = "1")
    private Integer rank;

}
