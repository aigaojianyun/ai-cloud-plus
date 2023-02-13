package com.cloud.user.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import com.cloud.common.constant.UserAccountConstants;
import com.cloud.common.exception.ServiceException;
import com.cloud.common.utils.DateUtils;
import com.cloud.common.utils.SerialNumberUtils;
import com.cloud.common.utils.StringUtils;
import com.cloud.common.utils.sign.MathUtil;
import com.cloud.common.utils.sign.Md5Util;
import com.cloud.security.utils.SecurityUtils;
import com.cloud.user.api.domain.User;
import com.cloud.user.domain.*;
import com.cloud.user.dto.*;
import com.cloud.user.mapper.*;
import com.cloud.user.param.*;
import com.cloud.user.service.IUserCenterService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 我的信息Service业务层处理
 *
 * @author ai-cloud
 */
@Service
public class UserCenterServiceImpl implements IUserCenterService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserAccountMapper userAccountMapper;

    @Autowired
    private UserAccountDetailMapper userAccountDetailMapper;

    @Autowired
    private UserBindMapper userBindMapper;

    @Autowired
    private UserWithdrawApplyMapper userWithdrawApplyMapper;


    @Autowired
    private UserSetMapper userSetMapper;


    /**
     * 查询我的信息
     *
     * @param
     * @return 用户对象信息
     */
    @Override
    public UserInfoDto userInfo() {
        //获取userId
        Long userId = SecurityUtils.getUserId();
        return userMapper.selectByUserInfo(userId);
    }

    /**
     * 设置签名
     *
     * @param
     * @param sign -- 签名信息
     */
    @Override
    public void updateSign(String sign) {
        if (StringUtils.isNull(sign)) {
            throw new ServiceException("签名不能为空!");
        }
        //获取userId
        Long userId = SecurityUtils.getUserId();
        userMapper.updateSign(userId, sign);
    }

    /**
     * 生成我的二维码所需信息
     *
     * @param
     * @return 二维码信息
     */
    @Override
    public QrCodeDto qrcode() {
        //获取userId
        Long userId = SecurityUtils.getUserId();
        User user = userMapper.selectById(userId);
        QrCodeDto codeDto = new QrCodeDto();
        BeanUtil.copyProperties(user, codeDto);
        return codeDto;
    }

    /**
     * 保存我的信息
     *
     * @param param
     * @return
     */
    @Override
    public int userSave(UserParam param) {
        //获取userId
        Long userId = SecurityUtils.getUserId();
        User user = userMapper.selectById(userId);
        user.setNickName(param.getNickName());
        user.setHeadImg(param.getHeadImg());
        user.setSex(param.getSex());
        user.setAge(param.getAge());
        user.setSign(param.getSign());
        user.setInvitationUrlAnd(param.getInvitationUrlAnd());
        user.setInvitationUrlIos(param.getInvitationUrlIos());
        return userMapper.updateById(user);
    }

    /**
     * 查询钱包余额
     *
     * @param
     * @return
     */
    @Override
    public BalanceDto wallet() {
        //获取userId
        Long userId = SecurityUtils.getUserId();
        BalanceDto balanceDto = userAccountMapper.selectByAvailableBalanceUserIdType(userId, UserAccountConstants.ACCOUNT_TYPE_BALANCE);
        balanceDto.setAvailableBalance(balanceDto.getAvailableBalance().setScale(4,BigDecimal.ROUND_HALF_UP));
        balanceDto.setFrozenAmount(balanceDto.getFrozenAmount().setScale(4,BigDecimal.ROUND_HALF_UP));
        return balanceDto;
    }

    @Override
    public boolean walletWithdraw(WalletWithdrawParam param) {
        if (StringUtils.isNull(param.getType())) {
            throw new ServiceException("提现方式不能为空!");
        }
        if (StringUtils.isNull(param.getAmount())) {
            throw new ServiceException("提现金额不能为空!");
        }
        if (StringUtils.isEmpty(param.getPassword())) {
            throw new ServiceException("支付密码不能为空!");
        }
        Assert.isTrue(NumberUtil.isGreater(param.getAmount(), new BigDecimal(0)), "提现金额不能为负数!");
        Assert.isTrue(NumberUtil.isGreaterOrEqual(param.getAmount(), new BigDecimal(50)), "提现金额不能小于50元!");
        UserBind bind = null;
        //获取userId
        Long userId = SecurityUtils.getUserId();
        if (UserAccountConstants.BELONG_BANK_ALIPAY.equals(param.getType())) {
            //验证用户是否绑定支付宝
            bind = userBindMapper.selectByBelongBankUserId(UserAccountConstants.BELONG_BANK_ALIPAY, userId);
            if (StringUtils.isNull(bind)) {
                throw new ServiceException("未绑定支付宝!");
            }
        } else if (UserAccountConstants.BELONG_BANK_BANK_CARD.equals(param.getType())) {
            //验证用户是否绑定银行卡
            bind = userBindMapper.selectByBelongBankUserId(UserAccountConstants.BELONG_BANK_BANK_CARD, userId);
            if (StringUtils.isNull(bind)) {
                throw new ServiceException("未绑定银行卡!");
            }
        } else {
            throw new ServiceException("提现方式错误!");
        }
        //验证支付密码是否正确
        Map map = userAccountMapper.selectByPasswordUserId(userId);
        if (StringUtils.isNull(map)) {
            throw new ServiceException("支付密码未设置!");
        }
        String password = (String) map.get("password");
        String salt = (String) map.get("salt");
        //校验支付密码
        String md5ofStr = Md5Util.getMD5ofStr(param.getPassword() + salt);
        if (!StringUtils.equalsIgnoreCase(password, md5ofStr)) {
            throw new ServiceException("支付密码错误!");
        }
        //用户余额账户扣除提现的金额，产生支出记录
        //用户余额支出账户明细
        User user = userMapper.selectById(userId);
        UserAccount userAccount = userAccountMapper.selectByUserIdType(userId, UserAccountConstants.ACCOUNT_TYPE_BALANCE);
        //检查余额
        Assert.isTrue(NumberUtil.isGreaterOrEqual(userAccount.getAvailableBalance(), param.getAmount()), "余额不足！");
        //添加提现申请
        UserWithdrawApply userWithdrawApply = new UserWithdrawApply();
        if (UserAccountConstants.BELONG_BANK_ALIPAY.equals(param.getType())) {
            userWithdrawApply.setAlipayAccount(bind.getAlipayAccount());
            userWithdrawApply.setAlipayName(bind.getAlipayName());
        } else if (UserAccountConstants.BELONG_BANK_BANK_CARD.equals(param.getType())) {
            userWithdrawApply.setBankAccount(bind.getBankAccount());
            userWithdrawApply.setBankName(bind.getBankName());
            userWithdrawApply.setBankCard(bind.getBankCard());
        }
        //减少某个账户余额
        userAccountMapper.updateByAvailableBalance(userId, NumberUtil.sub(userAccount.getAvailableBalance(), param.getAmount()), UserAccountConstants.ACCOUNT_TYPE_BALANCE);

        UserAccountDetail userAccountDetail = new UserAccountDetail();
        userAccountDetail.setAccountId(userAccount.getId());
        userAccountDetail.setAccountNumber(userAccount.getNumber());
        userAccountDetail.setAccountType(UserAccountConstants.ACCOUNT_TYPE_BALANCE);
        userAccountDetail.setType(UserAccountConstants.DETAIL_TYPE_EXPEND);
        userAccountDetail.setCreditType(UserAccountConstants.ACCOUNT_TYPE_CHINESE_BALANCE);
        userAccountDetail.setCreditNumber(userAccount.getNumber());
        userAccountDetail.setCreditPhone(user.getPhone());
        userAccountDetail.setImg(user.getHeadImg());
        userAccountDetail.setOrderPrice(param.getAmount());
        userAccountDetail.setBeforeAvailableBalance(userAccount.getAvailableBalance());
        userAccountDetail.setAfterAvailableBalance(NumberUtil.sub(userAccount.getAvailableBalance(), param.getAmount()));
        userAccountDetail.setDealName("余额提现");

        //生成交易流水号
        String dealSerialNumber = SerialNumberUtils.getOrderCode("");
        userAccountDetail.setDealSerialNumber(dealSerialNumber);
        userAccountDetail.setDealType(UserAccountConstants.DEAL_TYPE_提现);
        userAccountDetailMapper.insert(userAccountDetail);

        //提现记录
        userWithdrawApply.setDealSerialNumber(dealSerialNumber);
        userWithdrawApply.setAmount(param.getAmount());
        userWithdrawApply.setBelongBank(param.getType());
        userWithdrawApply.setUserId(userId);
        userWithdrawApply.setUuid(bind.getUuid());
        userWithdrawApply.setApplyTime(DateUtils.getNowDate());
        userWithdrawApplyMapper.insert(userWithdrawApply);
        return true;
    }

    /**
     * 查询钱包账单
     *
     * @param param
     * @return
     */
    @Override
    public PageInfo<BillDto> walletBill(WalletBillParam param) {
        //获取userId
        Long userId = SecurityUtils.getUserId();
        PageHelper.startPage(param.getPageNum(), param.getPageSize());
        PageInfo<BillDto> page = new PageInfo<>(userAccountDetailMapper.selectByDealType(userId, param.getDealType(), param.getStart(), param.getEnd()));
        return page;
    }

    /**
     * 查询账单明细
     *
     * @param param
     * @return
     */
    @Override
    public List<BillDetailDto> walletBillDetail(WalletBillDetailParam param) {
        //获取userId
        Long userId = SecurityUtils.getUserId();
        return userAccountDetailMapper.selectByDetail(userId, param.getDetailId());
    }

    /**
     * 查询银行卡绑定信息
     *
     * @param
     * @return
     */
    @Override
    public List<BindBankDto> walletBindBankInfo() {
        //获取userId
        Long userId = SecurityUtils.getUserId();
        return userBindMapper.selectByWalletBindBankInfo(userId);
    }

    /**
     * 保存绑定银行卡信息、
     *
     * @param param
     * @return
     */
    @Override
    public boolean walletBindBankSave(BindBankParam param) {
        if (StringUtils.isEmpty(param.getBankName())) {
            throw new ServiceException("银行卡名称不能为空!");
        }
        if (StringUtils.isEmpty(param.getBankCard())) {
            throw new ServiceException("卡号不能为空!");
        }
        if (StringUtils.isEmpty(param.getBankAccount())) {
            throw new ServiceException("姓名不能为空!");
        }
        if (StringUtils.isEmpty(param.getUuid())) {
            throw new ServiceException("设备唯一标识不能为空!");
        }
        //获取userId
        Long userId = SecurityUtils.getUserId();
        UserBind bind = userBindMapper.selectByBelongBankUserId(UserAccountConstants.BELONG_BANK_BANK_CARD, userId);
        if (StringUtils.isNotNull(bind)) {
            bind.setBankAccount(param.getBankAccount());
            bind.setBankCard(param.getBankCard());
            bind.setBankName(param.getBankName());
            userBindMapper.updateById(bind);
        } else {
            bind = new UserBind();
            BeanUtil.copyProperties(param, bind);
            bind.setBelongBank(UserAccountConstants.BELONG_BANK_BANK_CARD);
            bind.setUserId(userId);
            bind.setBindTime(new Date());
            userBindMapper.insert(bind);
        }
        return true;
    }

    /**
     * 查询支付宝绑定信息
     *
     * @param
     * @return
     */
    @Override
    public List<BindAlipayDto> walletBindAlipayInfo() {
        //获取userId
        Long userId = SecurityUtils.getUserId();
        return userBindMapper.selectByWalletBindAlipayInfo(userId);
    }

    /**
     * 保存绑定支付宝信息
     *
     * @param param
     * @return
     */
    @Override
    public boolean walletBindAlipaySave(BindAlipayParam param) {
        if (StringUtils.isEmpty(param.getAlipayAccount())) {
            throw new ServiceException("支付宝账号不能为空!");
        }
        if (StringUtils.isEmpty(param.getAlipayName())) {
            throw new ServiceException("支付宝认证姓名不能为空!");
        }
        if (StringUtils.isEmpty(param.getUuid())) {
            throw new ServiceException("设备唯一标识不能为空!");
        }
        //获取userId
        Long userId = SecurityUtils.getUserId();
        UserBind bind = userBindMapper.selectByBelongBankUserId(UserAccountConstants.BELONG_BANK_ALIPAY, userId);
        if (ObjectUtil.isNotEmpty(bind)) {
            bind.setAlipayAccount(param.getAlipayAccount());
            bind.setAlipayName(param.getAlipayName());
            userBindMapper.updateById(bind);
        } else {
            bind = new UserBind();
            BeanUtil.copyProperties(param, bind);
            bind.setBelongBank(UserAccountConstants.BELONG_BANK_ALIPAY);
            bind.setUserId(userId);
            bind.setBindTime(new Date());
            userBindMapper.insert(bind);
        }
        return true;
    }

    /**
     * 是否设置支付密码
     *
     * @param
     * @return
     */
    @Override
    public boolean walletIsSetPassword() {
        //获取userId
        Long userId = SecurityUtils.getUserId();
        Map map = userAccountMapper.selectByPasswordUserId(userId);
        if (StringUtils.isNotEmpty(map)) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 设置支付密码
     *
     * @param param
     * @return
     */
    @Override
    public int walletSetPassword(WalletSetPasswordParam param) {
        if (StringUtils.isEmpty(param.getPassword())) {
            throw new ServiceException("新密码不能为空!");
        }
        //获取userId
        Long userId = SecurityUtils.getUserId();
        Integer count = userAccountMapper.selectByCountUserId(userId);
        if (count == 0) {
            throw new ServiceException("账户不存在，请联系客服!");
        }
        Map map = userAccountMapper.selectByPasswordUserId(userId);
        //存在旧密码，验证
        if (StringUtils.isNotEmpty(map)) {
            String password = (String) map.get("password");
            String salt = (String) map.get("salt");
            if (StringUtils.isEmpty(param.getOldPassword())) {
                throw new ServiceException("旧密码不能为空!");
            }
            String md5ofStr = Md5Util.getMD5ofStr(param.getOldPassword() + salt);
            Assert.isTrue(org.apache.commons.lang3.StringUtils.equalsIgnoreCase(password, md5ofStr), "旧密码错误!");
        }
        //修改密码
        String salt = MathUtil.get(8, MathUtil.UPPERCASE_SEED);
        String password = Md5Util.getMD5ofStr(param.getPassword() + salt);
        return userAccountMapper.updateByPasswordSaltUserId(password, salt, userId);
    }

    /**
     * 验证支付密码
     *
     * @param param
     * @return
     */
    @Override
    public boolean walletVerifyPassword(WalletVerifyPasswordParam param) {
        if (StringUtils.isEmpty(param.getPassword())) {
            throw new ServiceException("密码不能为空!");
        }
        //获取userId
        Long userId = SecurityUtils.getUserId();
        Integer count = userAccountMapper.selectByCountUserId(userId);
        if (count == 0) {
            throw new ServiceException("账户不存在，请联系客服!");
        }
        Map map = userAccountMapper.selectByPasswordUserId(userId);
        if (StringUtils.isNotEmpty(map)) {
            String password = (String) map.get("password");
            String salt = (String) map.get("salt");
            String md5ofStr = Md5Util.getMD5ofStr(param.getPassword() + salt);
            if (StringUtils.equalsIgnoreCase(password, md5ofStr)) {
                return true;
            } else {
                return false;
            }
        } else {
            throw new ServiceException("未设置密码!");
        }
    }

    /**
     * 用户设置
     *
     * @param
     * @return
     */
    @Override
    public UserSetInfoDto setInfo() {
        //获取userId
        Long userId = SecurityUtils.getUserId();
        UserSetInfoDto dto = new UserSetInfoDto();
        UserSet set = userSetMapper.selectByUserId(userId);
        BeanUtil.copyProperties(set, dto);
        return dto;
    }

    /**
     * 保存用户设置信息
     *
     * @param param
     * @return
     */
    @Override
    public void setInfoSave(UserSetInfoParam param) {
        if (StringUtils.isNull(param.getMessageShake())) {
            throw new ServiceException("消息推送是否开启震动不能为空!");
        }
        if (StringUtils.isNull(param.getMessageAlarm())) {
            throw new ServiceException("消息推送是否开启铃声不能为空!");
        }
        if (StringUtils.isNull(param.getLikeRemind())) {
            throw new ServiceException("点赞提醒是否开启不能为空!");
        }
        if (StringUtils.isNull(param.getAttentionRemind())) {
            throw new ServiceException("关注提醒是否开启不能为空!");
        }
        if (StringUtils.isNull(param.getNotification())) {
            throw new ServiceException("系统通知提醒是否开启不能为空!");
        }
        if (StringUtils.isNull(param.getCommentRemind())) {
            throw new ServiceException("评论提醒是否开启不能为空!");
        }
        //获取userId
        Long userId = SecurityUtils.getUserId();
        UserSet set = userSetMapper.selectByUserId(userId);
        if (ObjectUtil.isEmpty(set)) {
            set = new UserSet();
            set.setAttentionRemind(param.getAttentionRemind());
            set.setCommentRemind(param.getCommentRemind());
            set.setLikeRemind(param.getLikeRemind());
            set.setMessageAlarm(param.getMessageAlarm());
            set.setMessageShake(param.getMessageShake());
            set.setNotification(param.getNotification());
            set.setUserId(userId);
            User user = userMapper.selectById(userId);
            set.setHeadImg(user.getHeadImg());
            set.setNickName(user.getNickName());
            set.setUuid(user.getUuid());
            userSetMapper.insert(set);
        } else {
            set.setAttentionRemind(param.getAttentionRemind());
            set.setCommentRemind(param.getCommentRemind());
            set.setLikeRemind(param.getLikeRemind());
            set.setMessageAlarm(param.getMessageAlarm());
            set.setMessageShake(param.getMessageShake());
            set.setNotification(param.getNotification());
            set.setUserId(userId);
            userSetMapper.updateById(set);
        }
    }


}
