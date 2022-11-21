package com.cloud.resource.api.service;

import com.cloud.common.exception.ServiceException;
import com.cloud.resource.api.domain.Sms;


import java.util.Map;

/**
 * 短信服务
 *
 * @author ai-cloud
 */
public interface RemoteSmsService {

    /**
     * 发送短信
     *
     * @param phones     电话号(多个逗号分割)
     * @param templateId 模板id
     * @param param      模板对应参数
     */
   public Sms send(String phones, String templateId, Map<String, String> param) throws ServiceException;

}
