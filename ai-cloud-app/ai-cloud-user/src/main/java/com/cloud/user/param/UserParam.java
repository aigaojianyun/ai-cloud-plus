package com.cloud.user.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 保存我的信息参数
 *
 * @author ai-cloud
 */
@Data
@ApiModel("保存我的信息参数")
public class UserParam {

    @ApiModelProperty(value = "用户头像", example = "https://aicloud.png")
    private String headImg;

    @ApiModelProperty(value = "昵称", example = "小可爱")
    private String nickName;

    @ApiModelProperty(value = "性别", example = "1")
    private String sex;

    @ApiModelProperty(value = "年龄", example = "19")
    private Long age;

    @ApiModelProperty(value = "签名", example = "这个世界本就是平衡的，想要得到什么就要付出什么")
    private String sign;

    @ApiModelProperty(value = "安卓推广地址", example = "")
    private String invitationUrlAnd;

    @ApiModelProperty(value = "IOS推广地址", example = "")
    private String invitationUrlIos;

}
