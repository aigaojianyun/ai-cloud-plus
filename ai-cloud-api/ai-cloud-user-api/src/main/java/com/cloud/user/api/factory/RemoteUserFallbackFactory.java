package com.cloud.user.api.factory;


import com.cloud.common.domain.R;
import com.cloud.user.api.domain.User;
import com.cloud.user.api.model.LoginUser;
import com.cloud.user.api.service.RemoteUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * 用户服务降级处理
 *
 * @author ai-cloud
 */
@Component
public class RemoteUserFallbackFactory implements FallbackFactory<RemoteUserService> {
    private static final Logger log = LoggerFactory.getLogger(RemoteUserFallbackFactory.class);

    @Override
    public RemoteUserService create(Throwable throwable) {
        log.error("用户服务调用失败:{}", throwable.getMessage());
        return new RemoteUserService() {
            @Override
            public R<LoginUser> getUserInfo(String param, String source) {
                return R.fail("查询用户失败:" + throwable.getMessage());
            }

            @Override
            public R<User> getOpenIdUserInfo(String openid, String source) {
                return R.fail("查询用户失败:" + throwable.getMessage());
            }

            @Override
            public R<Boolean> registerUserInfo(User user, String source) {
                return R.fail("注册用户失败:" + throwable.getMessage());
            }

            @Override
            public R<Boolean> updateUserInfo(User user, String source) {
                return R.fail("更新用户失败:" + throwable.getMessage());
            }

        };
    }
}
