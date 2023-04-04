package com.cloud.auth.controller;


import com.cloud.auth.param.RegisterParam;
import com.cloud.auth.service.RegisterService;
import com.cloud.common.constant.LangConstants;
import com.cloud.common.domain.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 注册接口
 *
 * @author ai-cloud
 */
@Api(tags = "移动端注册接口")
@RestController
@RequestMapping("/app")
public class RegisterController {

    @Autowired
    private RegisterService registerService;

    /**
     * 用户账号密码注册
     *
     * @param param
     * @param language 语言类型
     * @return 注册结果
     */
    @PostMapping("/register")
    @ApiOperation(value = "账号密码注册", notes = "账号密码注册")
    public R<?> registerUser(@RequestBody RegisterParam param,
                             @RequestHeader(value = LangConstants.LANGUAGE, required = true)
                             @ApiParam(value = "语言类型", example = "zh-CN") String language) {
        //用户注册
        registerService.registerUser(param.getUsername(), param.getPassword(), param.getPhone(), param.getUuid(),language);
        return R.ok();
    }

}
