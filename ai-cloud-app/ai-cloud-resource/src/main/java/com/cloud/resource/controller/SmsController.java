package com.cloud.resource.controller;


import cn.hutool.core.util.RandomUtil;
import com.cloud.common.constant.CacheConstants;
import com.cloud.common.constant.Constants;
import com.cloud.common.domain.R;
import com.cloud.common.utils.SpringUtils;
import com.cloud.common.utils.StringUtils;
import com.cloud.common.web.controller.BaseController;
import com.cloud.redis.service.RedisService;
import com.cloud.sms.config.properties.SmsProperties;
import com.cloud.sms.domain.SmsResult;
import com.cloud.sms.service.SmsTemplate;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.NotBlank;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * 短信功能
 *
 * @author ai-cloud
 */
@Api(tags = "短信服务")
@RestController
@RequestMapping("/sms")
public class SmsController extends BaseController {

    @Autowired
    private SmsProperties smsProperties;
    @Autowired
    private RedisService redisService;

    /**
     * 短信验证码
     *
     * @param phone 用户手机号
     */
    @GetMapping("code")
    @ApiOperation(value = "发送短信验证码", notes = "发送短信验证码")
    public R smsCaptcha(@ApiParam(value = "手机号", required = true) @NotBlank(message = "{user.phone.not.blank}") String phone) {
        if (StringUtils.isEmpty(phone)) {
           return R.fail("手机号不能不能为空!");
        }
        if (!smsProperties.getEnabled()) {
            R.fail("当前系统没有开启短信功能！");
        }
        String key = CacheConstants.CAPTCHA_CODE_KEY + phone;
        String code = RandomUtil.randomNumbers(4);
        redisService.setCacheObject(key, code, Constants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
        // 验证码模板id 自行处理 (查数据库或写死均可)
        String templateId = "";
        Map<String, String> map = new HashMap<>(1);
        map.put("code", code);
        SmsTemplate smsTemplate = SpringUtils.getBean(SmsTemplate.class);
        SmsResult result = smsTemplate.send(phone, templateId, map);
        if (!result.getIsSuccess()) {
            return R.fail(result.getMessage());
        }
        return R.ok();
    }

}
