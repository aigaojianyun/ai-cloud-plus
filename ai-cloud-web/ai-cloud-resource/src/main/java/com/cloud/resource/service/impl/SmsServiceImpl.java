package com.cloud.resource.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.cloud.common.domain.R;
import com.cloud.common.exception.ServiceException;
import com.cloud.common.utils.SpringUtils;
import com.cloud.resource.api.domain.Sms;
import com.cloud.resource.service.SmsService;
import com.cloud.sms.config.properties.SmsProperties;
import com.cloud.sms.domain.SmsResult;
import com.cloud.sms.service.SmsTemplate;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 短信服务
 *
 * @author ai-cloud
 */
@RequiredArgsConstructor
@Service
public class SmsServiceImpl implements SmsService {

    private final SmsProperties smsProperties;

    /**
     * 发送短信
     *
     * @param phones     电话号(多个逗号分割)
     * @param templateId 模板id
     * @param param      模板对应参数
     */
    public Sms send(String phones, String templateId, Map<String, String> param) throws ServiceException {
        if (smsProperties.getEnabled()) {
            R.fail("当前系统没有开启短信功能！");
        }
        SmsTemplate smsTemplate = SpringUtils.getBean(SmsTemplate.class);
        SmsResult smsResult = smsTemplate.send(phones, templateId, param);
        return BeanUtil.toBean(smsResult, Sms.class);
    }

}
