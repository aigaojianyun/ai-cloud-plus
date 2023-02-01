package com.cloud.auth.param;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 请求公共参数
 *
 * @author ai-cloud
 */
@Data
@ApiModel("请求公共参数")
public class BaseParam {

    @ApiModelProperty(value = "设备uuid", example = "e1e4c24876514fc999d043ae0f496752")
    private String uuid;

    @ApiModelProperty(value = "邀请者id", example = "b893f5cde0b54223b2b4546660fb38ac")
    private String invitationId;

}
