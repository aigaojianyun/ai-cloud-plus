package com.cloud.user.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 二维码信息
 *
 * @author ai-cloud
 */
@Data
@ApiModel("二维码信息")
public class QrCodeDto {

    @ApiModelProperty(value = "用户头像")
    private String headImg;

    @ApiModelProperty(value = "昵称")
    private String nickName;

    @ApiModelProperty(value = "用户ID")
    private String id;

    @ApiModelProperty(value = "邀请码")
    private String InvitationCode;

}
