package com.cloud.user.api.domain;

import com.cloud.common.web.domain.Entity;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 用户信息对象 user
 *
 * @author ai-cloud
 */
@Data
@ApiModel("用户信息")
public class User extends Entity {

    private static final long serialVersionUID = 1L;

    /**
     * 用户id
     */
    private Long id;

    /**
     * 用户账号
     */
    @ApiModelProperty(value = "用户账号", example = "String")
    private String userName;

    /**
     * 用户昵称
     */
    @ApiModelProperty(value = "用户昵称", example = "String")
    private String nickName;

    /**
     * 用户密码
     */
    @ApiModelProperty(value = "用户密码", example = "String")
    private String password;

    /**
     * 设备唯一标识
     */
    @ApiModelProperty(value = "设备唯一标识", example = "String")
    private String uuid;

    /**
     * 用户绑定手机号
     */
    @ApiModelProperty(value = "用户绑定手机号", example = "String")
    private String phone;

    /**
     * 头像
     */
    @ApiModelProperty(value = "头像", example = "String")
    private String headImg;

    /**
     * 性别 0男 1女 2未知
     */
    @ApiModelProperty(value = "性别 0男 1女 2未知", example = "Long")
    private String sex;

    /**
     * 年龄
     */
    @ApiModelProperty(value = "年龄", example = "Long")
    private Long age;

    /**
     * 出生年月
     */
    @ApiModelProperty(value = "出生年月", example = "String")
    private String birthday;

    /**
     * 签名
     */
    @ApiModelProperty(value = "签名", example = "String")
    private String sign;

    /**
     * 国家
     */
    @ApiModelProperty(value = "国家", example = "String")
    private String state;

    /**
     * 省份
     */
    @ApiModelProperty(value = "省份", example = "String")
    private String capital;

    /**
     * 城市
     */
    @ApiModelProperty(value = "城市", example = "String")
    private String city;

    /**
     * 县区
     */
    @ApiModelProperty(value = "县区", example = "String")
    private String counties;

    /**
     * QQ绑定的id
     */
    @ApiModelProperty(value = "QQ绑定的id", example = "String")
    private String bindQqId;

    /**
     * 绑定微信id
     */
    @ApiModelProperty(value = "绑定微信id", example = "String")
    private String bindWechatId;

    /**
     * 绑定微博id
     */
    @ApiModelProperty(value = "绑定微博id", example = "String")
    private String bindSinaId;

    /**
     * 绑定支付宝id
     */
    @ApiModelProperty(value = "绑定支付宝id", example = "String")
    private String bindAlipayId;

    /**
     * 是否激活; 用户注册后未登录过，即为此用户未激活 1：未激活 2：已激活
     */
    @ApiModelProperty(value = "是否激活; 用户注册后未登录过，即为此用户未激活 1：未激活 2：已激活", example = "Long")
    private Long activate;

    /**
     * 激活时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty(value = "激活时间", example = "Date")
    private Date activateTime;

    /**
     * 粉丝数
     */
    @ApiModelProperty(value = "粉丝数", example = "Long")
    private Long fans;

    /**
     * 用户关注数
     */
    @ApiModelProperty(value = "用户关注数", example = "Long")
    private Long attention;

    /**
     * 用户作品数量
     */
    @ApiModelProperty(value = "用户作品数量", example = "Long")
    private Long opus;

    /**
     * 点赞数
     */
    @ApiModelProperty(value = "点赞数", example = "Long")
    private Long likes;

    /**
     * 获取的总KB值
     */
    @ApiModelProperty(value = "获取的总KB值", example = "BigDecimal")
    private BigDecimal kbs;

    /**
     * 用户邀请码
     */
    @ApiModelProperty(value = "用户邀请码", example = "String")
    private String invitationCode;

    /**
     * 邀请者二维码
     */
    @ApiModelProperty(value = "邀请者二维码", example = "String")
    private String invitationQrcode;

    /**
     * 邀请者id
     */
    @ApiModelProperty(value = "邀请者id", example = "String")
    private String invitationId;

    /**
     * 推广安卓URL
     */
    @ApiModelProperty(value = "推广安卓URL", example = "String")
    private String invitationUrlAnd;

    /**
     * 推广IOSURL
     */
    @ApiModelProperty(value = "推广IOSURL", example = "String")
    private String invitationUrlIos;

    /**
     * 推广微信小程序URL
     */
    @ApiModelProperty(value = "推广微信小程序URL", example = "String")
    private String invitationUrlWeixin;

    /**
     * 推广链
     */
    @ApiModelProperty(value = "推广链", example = "String")
    private String invitationIds;

    /**
     * 用户类型（1普通用户 ，2会员用户）
     */
    @ApiModelProperty(value = "用户类型", example = "Integer")
    private Integer userType;

    /**
     * 会员类型（1非会员 ，2普通会员 ，3VIP会员 ，4SVIP会员）
     */
    @ApiModelProperty(value = "会员类型", example = "String")
    private String vipType;

    /**
     * 会员开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty(value = "会员开始时间", example = "Date")
    private Date vipStartTime;

    /**
     * 会员结束时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty(value = "会员结束时间", example = "Date")
    private Date vipEndTime;

    /**
     * 是否实名认证（1未验证，2已验证）
     */
    @ApiModelProperty(value = "是否实名认证", example = "String")
    private String realnameAuth;

    /**
     * 微信登录openid
     */
    @ApiModelProperty(value = "微信登录openid", example = "String")
    private String openId;

    /**
     * 微信登录会话KEY
     */
    @ApiModelProperty(value = "微信登录会话KEY", example = "String")
    private String sessionKey;

    /**
     * 最后登录IP
     */
    @ApiModelProperty(value = "最后登录IP", example = "String")
    private String loginIp;

    /**
     * 最后登录时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ApiModelProperty(value = "最后登录时间", example = "Date")
    private Date loginDate;

    /**
     * 状态：0：启用，2：停用
     */
    @ApiModelProperty(value = "帐号状态", example = "String")
    private String statusFlag;

    /**
     * 删除：0未删除，2已删除
     */
    @ApiModelProperty(value = "删除", example = "String")
    private String deleteFlag;

    /**
     * 备注
     */
    @ApiModelProperty(value = "备注", example = "String")
    private String remark;


}


