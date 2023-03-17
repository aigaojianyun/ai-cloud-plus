package com.cloud.user.service;

import com.cloud.user.dto.*;
import com.cloud.user.param.*;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * 我的信息Service接口
 *
 * @author ai-cloud
 */
public interface IUserCenterService {

    /**
     * 查询我的信息
     *
     * @param
     * @return 用户对象信息
     */
    public UserInfoDto userInfo();

    /**
     * 设置签名
     *
     * @param
     * @param sign -- 签名信息
     */
    public void updateSign(String sign);

    /**
     * 生成我的二维码所需信息
     *
     * @param
     * @return 二维码信息
     */
    public QrCodeDto qrcode();

    /**
     * 保存我的信息
     *
     * @param param
     * @return
     */
    public int userSave(UserParam param);

    /**
     * 查询钱包余额
     *
     * @param
     * @return
     */
    public BalanceDto wallet();

    /**
     * 用户申请提现
     *
     * @param param
     * @return
     */
    public boolean walletWithdraw(WalletWithdrawParam param);

    /**
     * 查询钱包账单
     *
     * @param param
     * @return
     */
    public PageInfo<BillDto> walletBill(WalletBillParam param);

    /**
     * 查询账单明细
     *
     * @param param
     * @return
     */
    List<BillDetailDto> walletBillDetail(WalletBillDetailParam param);

    /**
     * 查询银行卡绑定信息
     *
     * @param
     * @return
     */
    public List<BindBankDto> walletBindBankInfo();

    /**
     * 保存绑定银行卡信息
     *
     * @param param
     * @return
     */
    public boolean walletBindBankSave(BindBankParam param);

    /**
     * 查询支付宝绑定信息
     *
     * @param
     * @return
     */
    public List<BindAlipayDto> walletBindAlipayInfo();

    /**
     * 保存绑定支付宝信息
     *
     * @param param
     * @return
     */
    public boolean walletBindAlipaySave(BindAlipayParam param);

    /**
     * 是否设置支付密码
     *
     * @param
     * @return
     */
    public boolean walletIsSetPassword();

    /**
     * 设置支付密码
     *
     * @param param
     * @return
     */
    public int walletSetPassword(WalletSetPasswordParam param);

    /**
     * 验证支付密码
     *
     * @param param
     * @return
     */
    public boolean walletVerifyPassword(WalletVerifyPasswordParam param);

    /**
     * 用户设置
     *
     * @param
     * @return
     */
    public UserSetInfoDto setInfo();

    /**
     * 保存用户设置信息
     *
     * @param param
     * @return
     */
    public void setInfoSave(UserSetInfoParam param);

}
