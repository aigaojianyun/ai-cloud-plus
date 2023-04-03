package com.cloud.sms.service;

import com.cloud.sms.domain.SmsResult;

import java.util.Map;

/**
 * 短信模板
 *
 * @author ai-cloud
 */
public interface SmsTemplate {

    /**
     * 发送短信
     *
     * @param phones     电话号(多个逗号分割)
     * @param templateId 模板id
     * @param param      模板对应参数
     *                   阿里 需使用 模板变量名称对应内容 例如: code=1234
     *                   腾讯 需使用 模板变量顺序对应内容 例如: 1=1234, 1为模板内第一个参数
     */
    public SmsResult send(String phones, String templateId, Map<String, String> param);

}
