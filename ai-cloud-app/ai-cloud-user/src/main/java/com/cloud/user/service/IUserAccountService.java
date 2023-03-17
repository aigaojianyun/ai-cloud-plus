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
     * @param uuid
     * @param type
     * @return
     */
    public int createAccount(Long userId, String uuid, String type);

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
