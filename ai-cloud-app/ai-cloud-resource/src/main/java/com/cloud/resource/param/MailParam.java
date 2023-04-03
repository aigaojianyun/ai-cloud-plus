package com.cloud.resource.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 发送邮箱请求参数
 *
 * @author ai-cloud
 */
@Data
@ApiModel("发送邮箱请求参数")
public class MailParam {

    @ApiModelProperty(value = "接收人", example = "935125578@qq.com")
    public String to;

}
