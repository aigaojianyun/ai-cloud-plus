package com.cloud.resource.controller;

import cn.hutool.core.util.RandomUtil;
import com.cloud.common.constant.CacheConstants;
import com.cloud.common.constant.Constants;
import com.cloud.common.constant.LangConstants;
import com.cloud.common.domain.R;
import com.cloud.common.utils.SpringUtils;
import com.cloud.redis.service.RedisService;
import com.cloud.resource.param.PhoneParam;
import com.cloud.sms.config.properties.SmsProperties;
import com.cloud.sms.domain.SmsResult;
import com.cloud.sms.service.SmsTemplate;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * 短信服务
 *
 * @author ai-cloud
 */
@Api(tags = "短信服务")
@RestController
@RequestMapping("sms")
public class ResourceSmsApi {

    @Autowired
    private RedisService redisService;

    @Autowired
    private SmsProperties smsProperties;

    private Long validTime = Constants.CAPTCHA_EXPIRATION;


    /**
     * 短信验证码
     *
     * @param param    发送验证码参数
     * @param language 语言类型
     */
    @PostMapping("/login/code")
    @ApiOperation(value = "快捷登录验证码", notes = "快捷登录验证码")
    public R<?> smsCaptcha(@RequestBody PhoneParam param,
                           @RequestHeader(value = LangConstants.LANGUAGE, required = true)
                           @ApiParam(value = "语言类型", example = "zh_CN") String language) {
        if (!smsProperties.getEnabled()) {
            if (language.equals(LangConstants.EN_US)) {
                return R.fail("The SMS function is not enabled in the system!");
            } else if (language.equals(LangConstants.ZH_CN)) {
                return R.fail("当前系统没有开启短信功能!");
            }
        }
        String code = RandomUtil.randomNumbers(6);
        // 保存验证码信息
        String key = CacheConstants.CAPTCHA_CODE_KEY + param.getPhone();
        redisService.setCacheObject(key, code, validTime, TimeUnit.MINUTES);
        // 验证码模板id 自行处理 (查数据库或写死均可)
        String templateId = "1";
        Map<String, String> map = new HashMap<>(1);
        map.put("code", code);
        SmsTemplate smsTemplate = SpringUtils.getBean(SmsTemplate.class);
        SmsResult result = smsTemplate.send(param.getPhone(), templateId, map);
        if (!result.getIsSuccess()) {
            return R.fail(result.getMessage());
        }
        //Object result = smsTemplate.send(param.getPhone(), templateId, map);
        return R.ok(result);
    }


}
