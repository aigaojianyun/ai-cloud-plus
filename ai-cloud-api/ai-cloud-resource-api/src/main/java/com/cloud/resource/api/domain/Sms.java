package com.cloud.resource.api.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * 短信信息
 *
 * @author ai-cloud
 */
@Data
public class Sms implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 是否成功
     */
    private Boolean isSuccess;

    /**
     * 响应消息
     */
    private String message;

    /**
     * 实际响应体
     * <p>
     * 可自行转换为 SDK 对应的 SendSmsResponse
     */
    private String response;

}
