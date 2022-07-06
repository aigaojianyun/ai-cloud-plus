package com.cloud.user.service;

import com.cloud.user.param.ChangeWalletParam;

/**
 * 用户账户信息Service接口
 *
 * @author ai-cloud
 */
public interface IUserAccountService {

    /**
     * 创建账户
     *
     * @param userId
     * @param deviceId
     * @param type
     * @return
     */
    public int createAccount(String userId, String deviceId, String type);

    /**
     * 变更余额
     *
     * @param param
     * @return
     */
    public void changeBalance(ChangeWalletParam param);

    /**
     * 变更Kb
     *
     * @param param
     * @return
     */
    public void changeKb(ChangeWalletParam param);

}
