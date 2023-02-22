package com.cloud.mybatis.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.cloud.security.utils.SecurityUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 自动更新
 *
 * @author ai-cloud
 */
@Slf4j
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    /**
     * 插入人 插入时间
     */
    @Override
    public void insertFill(MetaObject metaObject) {
        log.info("start insert fill ....");
        boolean createTime = metaObject.hasSetter("createTime");
        if (metaObject.hasSetter("createBy")) {
            this.strictInsertFill(metaObject, "createBy", String.class, SecurityUtils.getUsername());
        }
        if (createTime) {
            this.strictInsertFill(metaObject, "createTime", Date.class, new Date());
        }
    }

    /**
     * 更新人 更新时间
     */
    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("start update fill ....");
        if (metaObject.hasSetter("updateBy")) {
            this.strictUpdateFill(metaObject, "updateBy", String.class, SecurityUtils.getUsername());

        }
        if (metaObject.hasSetter("updateTime")) {
            this.strictUpdateFill(metaObject, "updateTime", Date.class, new Date());
        }
    }

}
