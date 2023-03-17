package com.cloud.user.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cloud.user.domain.UserAccount;
import com.cloud.user.dto.BalanceDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.Map;


/**
 * 用户账户信息Mapper接口
 *
 * @author ai-cloud
 */
@Mapper
public interface UserAccountMapper extends BaseMapper<UserAccount> {

    /**
     * 查询账户的可用余额
     *
     * @param userId 用户id
     * @param type   账户类型
     * @return 可用余额
     */
    public BalanceDto selectByAvailableBalanceUserIdType(@Param("userId") Long userId, @Param("type") String type);

    /**
     * 查询用户存在账户数
     *
     * @param userId 用户id
     * @return
     */
    public Integer selectByCountUserId(@Param("userId") Long userId);

    /**
     * 查询用户账户信息
     *
     * @param userId 用户id
     * @param type   账户类型
     * @return
     */
    public UserAccount selectByUserIdType(@Param("userId") Long userId, @Param("type") String type);

    /**
     * 查询用户的支付密码和盐
     *
     * @param userId 用户id
     * @return
     */
    public Map selectByPasswordUserId(@Param("userId") Long userId);

    /**
     * 修改支付密码
     *
     * @param password
     * @param salt
     * @param userId   用户id
     * @return
     */
    public int updateByPasswordSaltUserId(@Param("password") String password, @Param("salt") String salt, @Param("userId") Long userId);

    /**
     * 增加减少账户余额
     *
     * @param userId 用户id
     * @param amount
     * @param type   账户类型
     * @return
     */
    public void updateByAvailableBalance(@Param("userId") Long userId, @Param("amount") BigDecimal amount, @Param("type") String type);


}
