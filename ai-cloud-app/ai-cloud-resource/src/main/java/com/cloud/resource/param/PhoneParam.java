package com.cloud.resource.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 发送验证码请求参数
 *
 * @author ai-cloud
 */
@Data
@ApiModel("发送验证码请求参数")
public class PhoneParam {

    @ApiModelProperty(value = "电话号码", example = "13888888888")
    private String phone;

    @ApiModelProperty(value = "区号", example = "86")
    private String zone;

}
