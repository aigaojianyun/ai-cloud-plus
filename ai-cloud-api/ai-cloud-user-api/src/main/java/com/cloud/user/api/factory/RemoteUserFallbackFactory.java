package com.cloud.user.api.factory;


import com.cloud.common.domain.R;
import com.cloud.i18n.utils.MessageUtils;
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
        log.error(MessageUtils.message("user.service.to"), throwable.getMessage());
        return new RemoteUserService() {
            @Override
            public R<LoginUser> getUserInfo(String param, String language, String source) {
                return R.fail(MessageUtils.message("user.query.to") + throwable.getMessage());
            }

            @Override
            public R<Boolean> registerUserInfo(User user, String language, String source) {
                return R.fail(MessageUtils.message("user.register.to") + throwable.getMessage());
            }

            @Override
            public R<Integer> updateUserInfo(User user, String language, String source) {
                return R.fail(MessageUtils.message("user.update.to") + throwable.getMessage());
            }

        };
    }
}
