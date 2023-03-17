package com.cloud.user.controller;

import com.cloud.common.domain.R;
import com.cloud.log.annotation.Log;
import com.cloud.log.enums.BusinessType;
import com.cloud.user.param.ChangeWalletParam;
import com.cloud.user.service.IUserAccountService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 账户信息
 *
 * @author ai-cloud
 */
@Api(tags = "账户信息")
@RestController
@RequestMapping("/account")
public class UserAccountApi {

    @Autowired
    private IUserAccountService userAccountService;

    /**
     * 变更余额
     *
     * @param param
     * @return
     */
    @Log(title = "变更余额", businessType = BusinessType.UPDATE)
    @PostMapping("changeBalance")
    @ApiOperation(value = "变更余额", notes = "变更余额")
    public R changeBalance(@RequestBody ChangeWalletParam param) {
        userAccountService.changeBalance(param);
        return R.ok();
    }

    /**
     * 变更Kb
     *
     * @param param
     * @return
     */
    @Log(title = "变更Kb", businessType = BusinessType.UPDATE)
    @PostMapping("changeKb")
    @ApiOperation(value = "变更KB", notes = "变更KB")
    public R changeKb(@RequestBody ChangeWalletParam param) {
        userAccountService.changeKb(param);
        return R.ok();
    }


}
