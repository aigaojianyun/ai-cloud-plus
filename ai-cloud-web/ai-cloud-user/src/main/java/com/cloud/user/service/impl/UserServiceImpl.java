package com.cloud.user.service.impl;

import cn.hutool.core.lang.Snowflake;
import com.cloud.common.constant.UserAccountConstants;
import com.cloud.common.constant.UserConstants;
import com.cloud.common.utils.StringUtils;
import com.cloud.system.api.domain.User;
import com.cloud.user.domain.UserMockData;
import com.cloud.user.mapper.UserMapper;
import com.cloud.user.mapper.UserMockDataMapper;
import com.cloud.user.service.IUserAccountService;
import com.cloud.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;


/**
 * 用户信息Service业务层处理
 *
 * @author ai-cloud
 */
@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserMockDataMapper userMockDataMapper;

    @Autowired
    private IUserAccountService userAccountService;

    /**
     * 通过openId查询用户
     *
     * @param openId openId
     * @return 用户对象信息
     */
    @Override
    public User selectByOpenId(String openId) {
        return userMapper.selectByOpenId(openId);
    }

    /**
     * 校验用户名称是否唯一
     *
     * @param username 用户名称
     * @return 结果
     */
    @Override
    public String checkUserNameUnique(String username) {
        int count = userMapper.checkUserNameUnique(username);
        if (count > 0) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 校验手机号码是否唯一
     *
     * @param user 用户信息
     * @return
     */
    @Override
    public String checkPhoneUnique(User user) {
        Long userId = StringUtils.isNull(user.getId()) ? -1L : user.getId();
        User info = userMapper.checkPhoneUnique(user.getPhone());
        if (StringUtils.isNotNull(info) && !info.getId().equals(userId)) {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }


    /**
     * 注册用户信息：新用户创建账号和账户
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public boolean registerUser(User user) {
        //Id随机数生成
        Snowflake snowflake = new Snowflake(1, 1);
        Long userId = snowflake.nextId();
        user.setId(userId);
        //创建随机用户昵称
        Random random = new Random();
        List<UserMockData> nickNameMockData = userMockDataMapper.selectByMockData(1);
        int randomNickName = random.nextInt(nickNameMockData.size());
        UserMockData nickName = nickNameMockData.get(randomNickName);
        user.setNickName(nickName.getValue());
        //创建随机用户头像
        List<UserMockData> headImgMockData = userMockDataMapper.selectByMockData(2);
        int randomHeadImg = random.nextInt(headImgMockData.size());
        UserMockData headImg = headImgMockData.get(randomHeadImg);
        user.setHeadImg(headImg.getValue());
        //创建账户
        userAccountService.createAccount(user.getId(), user.getUuid(), UserAccountConstants.ACCOUNT_TYPE_BALANCE);
        userAccountService.createAccount(user.getId(), user.getUuid(), UserAccountConstants.ACCOUNT_TYPE_KB);
        return userMapper.insert(user) > 0;
    }

    /**
     * 更新用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public boolean updateUser(User user) {
        userMapper.updateById(user);
        return true;
    }

}
