package com.cloud.resource.controller;


import cn.hutool.core.util.RandomUtil;
import cn.hutool.extra.mail.MailException;
import com.cloud.common.constant.CacheConstants;
import com.cloud.common.constant.Constants;
import com.cloud.common.domain.R;
import com.cloud.common.exception.ServiceException;
import com.cloud.common.utils.StringUtils;
import com.cloud.mail.config.properties.MailProperties;
import com.cloud.redis.service.RedisService;
import com.cloud.resource.service.MailService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.constraints.NotBlank;
import java.util.concurrent.TimeUnit;

/**
 * 邮件功能
 *
 * @author ai-cloud
 */
@Api(tags = "邮箱服务")
@RestController
@RequestMapping("/mail")
public class MailControoller {

    @Autowired
    private MailProperties mailProperties;
    @Autowired
    private MailService mailService;

    @Autowired
    private RedisService redisService;

    /**
     * 发送邮件
     *
     * @param to 接收人
     */
    @GetMapping("code")
    @ApiOperation(value = "发送邮件验证码", notes = "发送邮件验证码")
    public R mailCaptcha(@ApiParam(value="邮箱", required = true) @NotBlank(message = "{user.to.not.blank}") String to) {
        if (StringUtils.isEmpty(to)) {
            throw new ServiceException("邮箱不能不能为空!");
        }
        if (mailProperties.getEnabled()) {
            R.fail("当前系统没有开启邮箱功能！");
        }
        //设置邮件的主题
        String subject = "登录验证码";
        String key = CacheConstants.CAPTCHA_CODE_KEY + to;
        // 设置邮件的正文
        String code = RandomUtil.randomNumbers(6);
        String text = "您的验证码为：" + code + ",请勿泄露给他人。";
        // 发送邮件
        try {
            mailService.send(to, subject, text);
            //将验证码保存到redis缓存中，设置有效时间为30分钟
            redisService.setCacheObject(key, code, Constants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
            return R.ok();
        } catch (MailException e) {
            e.printStackTrace();
        }
        return R.fail("发送失败");
    }

}
