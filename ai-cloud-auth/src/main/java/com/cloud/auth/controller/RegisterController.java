package com.cloud.auth.controller;


import com.cloud.auth.param.RegisterParam;
import com.cloud.auth.service.impl.RegisterService;
import com.cloud.common.domain.R;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 注册接口
 *
 * @author ai-cloud
 */
@Api(tags = "注册接口")
@RestController
public class RegisterController {

    @Autowired
    private RegisterService registerService;

    /**
     * 用户账号密码注册
     *
     * @param param
     * @return 注册结果
     */
    @PostMapping("register")
    public R<?> registerUser(@RequestBody RegisterParam param) {
        //用户注册
        registerService.registerUser(param.getUsername(), param.getPassword(),param.getPhone(), param.getUuid());
        return R.ok();
    }

}
