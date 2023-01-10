package com.cloud.user.service.impl;

import com.cloud.common.constant.UserAccountConstants;
import com.cloud.common.exception.ServiceException;
import com.cloud.common.utils.SerialNumberUtils;
import com.cloud.common.utils.StringUtils;
import com.cloud.common.utils.uuid.IdUtils;
import com.cloud.user.api.domain.User;
import com.cloud.user.domain.UserAccount;
import com.cloud.user.domain.UserAccountDetail;
import com.cloud.user.mapper.UserAccountDetailMapper;
import com.cloud.user.mapper.UserAccountMapper;
import com.cloud.user.mapper.UserMapper;
import com.cloud.user.param.ChangeAccountParam;
import com.cloud.user.param.ChangeWalletParam;
import com.cloud.user.service.IUserAccountService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户账户信息Service业务层处理
 *
 * @author ai-cloud
 */
@Service
public class UserAccountServiceImpl implements IUserAccountService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserAccountMapper userAccountMapper;

    @Autowired
    private UserAccountDetailMapper userAccountDetailMapper;


    /**
     * 创建账户
     *
     * @param userId
     * @param uuid
     * @param type
     * @return
     */
    @Override
    public int createAccount(Long userId, String uuid, String type) {
        UserAccount userAccount = new UserAccount();
        //账户号
        userAccount.setNumber(IdUtils.fastSimpleUUID());
        userAccount.setUserId(userId);
        userAccount.setUuid(uuid);
        userAccount.setType(type);
        return userAccountMapper.insert(userAccount);
    }

    /**
     * 变更余额
     *
     * @param param
     * @return
     */
    @Override
    public void changeBalance(ChangeWalletParam param) {
        ChangeAccountParam changeAccountParam = new ChangeAccountParam();
        BeanUtils.copyProperties(param, changeAccountParam);
        changeAccountParam.setAccountType(UserAccountConstants.ACCOUNT_TYPE_BALANCE);
        changeAccountParam.setDealName("余额账户变更");
        changeAccountParam.setDealType(UserAccountConstants.DEAL_TYPE_其他);
        changeAccount(changeAccountParam);
    }

    /**
     * 变更Kb
     *
     * @param param
     * @return
     */
    @Override
    public void changeKb(ChangeWalletParam param) {
        ChangeAccountParam changeAccountParam = new ChangeAccountParam();
        BeanUtils.copyProperties(param, changeAccountParam);
        changeAccountParam.setAccountType(UserAccountConstants.ACCOUNT_TYPE_KB);
        changeAccountParam.setDealName("KB账户变更");
        changeAccountParam.setDealType(UserAccountConstants.DEAL_TYPE_其他);
        changeAccount(changeAccountParam);
    }

    /**
     * 变更账户
     *
     * @param param
     * @return
     */
    public synchronized Map<String, String> changeAccount(ChangeAccountParam param) {
        Map<String, String> map = new HashMap<>();
        if (StringUtils.isNull(param.getAddNum())) {
            throw new ServiceException("新增数量不能为空!");
        }
        if (StringUtils.isNull(param.getSubNum())) {
            throw new ServiceException("减少人数量不能为空!");
        }
        User subUser = userMapper.selectById(param.getSubUserId());
        User addUser = userMapper.selectById(param.getAddUserId());
        UserAccount subAccount = userAccountMapper.selectByUserIdType(Long.valueOf(param.getSubUserId()), param.getAccountType());
        if (StringUtils.isNull(subAccount)) {
            throw new ServiceException("减少金额的账户不存在!");
        }
        UserAccount addAccount = userAccountMapper.selectByUserIdType(Long.valueOf(param.getAddUserId()), param.getAccountType());
        if (StringUtils.isNull(addAccount)) {
            throw new ServiceException("增加金额的账户不存在!");
        }
        BigDecimal availableBalance = subAccount.getAvailableBalance();
        //维护支出记录
        userAccountMapper.updateByAvailableBalance(Long.valueOf(param.getSubUserId()), availableBalance.subtract(param.getSubNum()), param.getAccountType());
        //添加账户明细记录
        UserAccountDetail detail = new UserAccountDetail();
        detail.setAccountId(subAccount.getId());
        detail.setAccountNumber(subAccount.getNumber());
        detail.setAccountType(param.getAccountType());
        detail.setType(UserAccountConstants.DETAIL_TYPE_EXPEND);
        detail.setDebitType(param.getAccountType());
        detail.setDebitNumber(addAccount.getNumber());
        detail.setDebitPhone(addUser.getPhone());
        detail.setOrderNumber(param.getOrderNumber());
        detail.setCreditType(param.getAccountType());
        detail.setCreditNumber(subAccount.getNumber());
        detail.setCreditPhone(subUser.getPhone());
        detail.setImg(subUser.getHeadImg());
        detail.setOrderPrice(param.getSubNum());
        detail.setBeforeAvailableBalance(availableBalance);
        detail.setAfterAvailableBalance(availableBalance.subtract(param.getSubNum()));
        detail.setDealName(param.getDealName() + "支出");
        String subNumber = SerialNumberUtils.getOrderCode("");
        detail.setDealSerialNumber(subNumber);
        detail.setDealType(param.getDealType());
        detail.setServiceCharge(param.getCharge());
        userAccountDetailMapper.insert(detail);
        availableBalance = addAccount.getAvailableBalance();
        //维护收入记录
        userAccountMapper.updateByAvailableBalance(Long.valueOf(param.getAddUserId()), availableBalance.add(param.getAddNum()), param.getAccountType());
        //添加账户明细记录
        detail = new UserAccountDetail();
        detail.setAccountId(addAccount.getId());
        detail.setAccountNumber(addAccount.getNumber());
        detail.setAccountType(param.getAccountType());
        detail.setType(UserAccountConstants.DETAIL_TYPE_INCOME);
        detail.setDebitType(param.getAccountType());
        detail.setDebitNumber(addAccount.getNumber());
        detail.setDebitPhone(addUser.getPhone());
        detail.setImg(addUser.getHeadImg());
        detail.setOrderNumber(param.getOrderNumber());
        detail.setCreditType(param.getAccountType());
        detail.setCreditNumber(subAccount.getNumber());
        detail.setCreditPhone(subUser.getPhone());
        detail.setOrderPrice(param.getAddNum());
        detail.setBeforeAvailableBalance(availableBalance);
        detail.setAfterAvailableBalance(availableBalance.add(param.getAddNum()));
        detail.setDealName(param.getDealName() + "收入");
        String addNumber = SerialNumberUtils.getOrderCode("");
        detail.setDealSerialNumber(addNumber);
        detail.setDealType(param.getDealType());
        detail.setServiceCharge(param.getCharge());
        userAccountDetailMapper.insert(detail);
        map.put("subNumber", subNumber);
        map.put("addNumber", addNumber);
        return map;
    }


}
