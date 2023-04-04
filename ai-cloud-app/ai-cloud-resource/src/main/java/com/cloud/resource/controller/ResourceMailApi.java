package com.cloud.resource.controller;

import cn.hutool.core.util.RandomUtil;
import com.cloud.common.constant.CacheConstants;
import com.cloud.common.constant.Constants;
import com.cloud.common.constant.LangConstants;
import com.cloud.common.domain.R;
import com.cloud.mail.config.properties.MailProperties;
import com.cloud.mail.utils.MailUtils;
import com.cloud.redis.service.RedisService;
import com.cloud.resource.param.MailParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.concurrent.TimeUnit;

/**
 * 邮箱服务
 *
 * @author ai-cloud
 */
@Api(tags = "邮箱服务")
@RestController
@RequestMapping("mail")
public class ResourceMailApi {

    @Autowired
    private RedisService redisService;

    @Autowired
    private MailProperties mailProperties;

    private Long validTime = Constants.CAPTCHA_EXPIRATION;

    /**
     * 发送邮件
     *
     * @param param    发送验证码参数
     * @param language 语言类型
     */
    @PostMapping("/login/code")
    @ApiOperation(value = "邮箱登录验证码", notes = "邮箱登录验证码")
    public R<?> sendText(@RequestBody MailParam param,
                         @RequestHeader(value = LangConstants.LANGUAGE, required = true)
                         @ApiParam(value = "语言类型", example = "zh-CN") String language) {
        if (!mailProperties.getEnabled()) {
            return R.fail("当前系统没有开启邮箱功能");
        }
        String code = RandomUtil.randomNumbers(6);
        // 保存验证码信息
        String key = CacheConstants.CAPTCHA_CODE_KEY + param.getTo();
        redisService.setCacheObject(key, code, validTime, TimeUnit.MINUTES);
        String subject = "登录验证码";
        String text = "你的登录验证码为:" + "[" + code + "]";
        // 发送邮件
        MailUtils.sendText(param.getTo(), subject, text);
        return R.ok();
    }

}
