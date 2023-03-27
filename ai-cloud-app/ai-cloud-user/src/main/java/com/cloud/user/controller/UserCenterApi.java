package com.cloud.user.controller;


import com.cloud.common.domain.R;
import com.cloud.common.web.controller.BaseController;
import com.cloud.log.annotation.Log;
import com.cloud.log.enums.BusinessType;
import com.cloud.user.dto.*;
import com.cloud.user.param.*;
import com.cloud.user.service.IUserCenterService;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 我的信息
 *
 * @author ai-cloud
 */
@Api(tags = "我的信息")
@RestController
@RequestMapping("/center")
public class UserCenterApi extends BaseController {

    @Autowired
    private IUserCenterService userCenterService;

    /**
     * 查询我的信息
     *
     * @param
     * @return 用户信息
     */
    @Log(title = "查询我的信息", businessType = BusinessType.OTHER)
    @PostMapping(value = "info")
    @ApiOperation("查询我的信息")
    public R<UserInfoDto> userInfo() {
        return R.ok(userCenterService.userInfo());
    }

    /**
     * 设置签名
     *
     * @param
     * @param sign -- 签名信息
     */
    @Log(title = "设置签名", businessType = BusinessType.OTHER)
    @PostMapping("sign")
    @ApiOperation(value = "设置签名")
    public R sign(@ApiParam(value = "签名", required = true) @RequestParam("sign") String sign) {
        userCenterService.updateSign(sign);
        return R.ok();
    }

    /**
     * 生成我的二维码所需信息
     *
     * @param
     * @return 二维码信息
     */
    @Log(title = "查询二维码所需信息", businessType = BusinessType.OTHER)
    @PostMapping("qrcode")
    @ApiOperation(value = "我的二维码")
    public R<QrCodeDto> qrcode() {
        return R.ok(userCenterService.qrcode());
    }

    /**
     * 保存我的信息
     *
     * @param param
     * @return
     */
    @Log(title = "保存我的信息", businessType = BusinessType.OTHER)
    @PostMapping(value = "save")
    @ApiOperation("保存我的信息")
    public R userSave(@RequestBody UserParam param) {
        userCenterService.userSave(param);
        return R.ok();
    }

    /**
     * 查询钱包余额
     *
     * @param
     * @return
     */
    @Log(title = "查询钱包余额", businessType = BusinessType.OTHER)
    @PostMapping(value = "wallet")
    @ApiOperation(value = "查询钱包余额")
    public R<BalanceDto> wallet() {
        return R.ok(userCenterService.wallet());
    }

    /**
     * 用户申请提现
     *
     * @param param
     * @return
     */
    @Log(title = "用户申请提现", businessType = BusinessType.OTHER)
    @PostMapping(value = "wallet/withdraw")
    @ApiOperation(value = "用户申请提现")
    public R<Boolean> walletWithdraw(@RequestBody WalletWithdrawParam param) {
        return R.ok(userCenterService.walletWithdraw(param));
    }

    /**
     * 查询钱包账单
     *
     * @param param
     * @return
     */
    @Log(title = "查询钱包账单", businessType = BusinessType.OTHER)
    @PostMapping(value = "wallet/bill")
    @ApiOperation(value = "查询钱包账单")
    public R<PageInfo<BillDto>> walletBill(@RequestBody WalletBillParam param) {
        return R.ok(userCenterService.walletBill(param));
    }

    /**
     * 查询账单明细
     *
     * @param param
     * @return
     */
    @Log(title = "查询账单明细", businessType = BusinessType.OTHER)
    @PostMapping(value = "wallet/bill/detail")
    @ApiOperation(value = "查询账单明细")
    public R<List<BillDetailDto>> walletBillDetail(@RequestBody WalletBillDetailParam param) {
        return R.ok(userCenterService.walletBillDetail(param));
    }

    /**
     * 查询银行卡绑定信息
     *
     * @param
     * @return
     */
    @Log(title = "查询银行卡绑定信息", businessType = BusinessType.OTHER)
    @PostMapping(value = "wallet/bindBank/info")
    @ApiOperation(value = "查询银行卡绑定信息")
    public R<List<BindBankDto>> walletBindBankInfo() {
        return R.ok(userCenterService.walletBindBankInfo());
    }

    /**
     * 保存绑定银行卡信息
     *
     * @param param
     * @return
     */
    @Log(title = "保存绑定银行卡信息", businessType = BusinessType.OTHER)
    @PostMapping("wallet/bindBank/save")
    @ApiOperation(value = "保存绑定银行卡信息")
    public R<Boolean> walletBindBankSave(@RequestBody BindBankParam param) {
        return R.ok(userCenterService.walletBindBankSave(param));
    }

    /**
     * 查询支付宝绑定信息
     *
     * @param
     * @return
     */
    @Log(title = "查询支付宝绑定信息", businessType = BusinessType.OTHER)
    @PostMapping("wallet/bindAlipay/Info")
    @ApiOperation(value = "查询支付宝绑定信息")
    public R<List<BindAlipayDto>> walletBindAlipayInfo() {
        return R.ok(userCenterService.walletBindAlipayInfo());
    }

    /**
     * 保存绑定支付宝信息
     *
     * @param param
     * @return
     */
    @Log(title = "保存绑定支付宝信息", businessType = BusinessType.OTHER)
    @PostMapping("wallet/bindAlipay/save")
    @ApiOperation(value = "保存绑定支付宝信息")
    public R<Boolean> walletBindAlipaySave(@RequestBody BindAlipayParam param) {
        return R.ok(userCenterService.walletBindAlipaySave(param));
    }

    /**
     * 是否设置支付密码
     *
     * @param
     * @return
     */
    @Log(title = "是否设置支付密码", businessType = BusinessType.OTHER)
    @PostMapping("wallet/isSetPassword")
    @ApiOperation(value = "是否设置支付密码")
    public R<Boolean> walletIsSetPassword() {
        return R.ok(userCenterService.walletIsSetPassword());
    }

    /**
     * 设置支付密码
     *
     * @param param
     * @return
     */
    @Log(title = "设置支付密码", businessType = BusinessType.OTHER)
    @PostMapping("wallet/setPassword")
    @ApiOperation(value = "设置支付密码")
    public R walletSetPassword(@RequestBody WalletSetPasswordParam param) {
        userCenterService.walletSetPassword(param);
        return R.ok();
    }

    /**
     * 验证支付密码
     *
     * @param param
     * @return
     */
    @Log(title = "验证支付密码", businessType = BusinessType.OTHER)
    @PostMapping("wallet/verifyPassword")
    @ApiOperation(value = "验证支付密码")
    public R<Boolean> walletVerifyPassword(@RequestBody WalletVerifyPasswordParam param) {
        return R.ok(userCenterService.walletVerifyPassword(param));
    }

    /**
     * 用户设置
     *
     * @param
     * @return
     */
    @Log(title = "设置信息", businessType = BusinessType.OTHER)
    @PostMapping("setInfo")
    @ApiOperation(value = "设置信息")
    public R<UserSetInfoDto> setinfo() {
        return R.ok(userCenterService.setInfo());
    }

    /**
     * 保存用户设置信息
     *
     * @param param
     * @return
     */
    @Log(title = "保存设置信息", businessType = BusinessType.OTHER)
    @PostMapping("setInfo/save")
    @ApiOperation(value = "保存设置信息")
    public R setInfoSave(@RequestBody UserSetInfoParam param) {
        userCenterService.setInfoSave(param);
        return R.ok();
    }

}

