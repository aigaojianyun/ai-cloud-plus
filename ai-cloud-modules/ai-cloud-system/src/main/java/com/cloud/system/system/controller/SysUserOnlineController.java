package com.cloud.system.system.controller;

import com.cloud.common.constant.CacheConstants;
import com.cloud.common.utils.StringUtils;
import com.cloud.common.web.controller.BaseController;
import com.cloud.common.web.domain.AjaxResult;
import com.cloud.common.web.page.TableDataInfo;
import com.cloud.log.annotation.Log;
import com.cloud.log.enums.BusinessType;
import com.cloud.redis.service.RedisService;
import com.cloud.security.annotation.RequiresPermissions;
import com.cloud.system.api.model.SysLoginUser;
import com.cloud.system.system.domain.SysUserOnline;
import com.cloud.system.system.service.ISysUserOnlineService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 * 在线用户监控
 *
 * @author ai-cloud
 */
@Api(tags = "在线用户监控")
@RestController
@RequestMapping("/online")
public class SysUserOnlineController extends BaseController {
    @Autowired
    private ISysUserOnlineService userOnlineService;

    @Autowired
    private RedisService redisService;

    @RequiresPermissions("monitor:online:list")
    @GetMapping("/list")
    @ApiOperation(value = "在线用户列表", notes = "在线用户列表")
    public TableDataInfo list(String ipaddr, String userName) {
        Collection<String> keys = redisService.keys(CacheConstants.LOGIN_TOKEN_KEY + "*");
        List<SysUserOnline> userOnlineList = new ArrayList<SysUserOnline>();
        for (String key : keys) {
            SysLoginUser sysUser = redisService.getCacheObject(key);
            if (StringUtils.isNotNull(sysUser)) {
                if (StringUtils.isNotEmpty(ipaddr) && StringUtils.isNotEmpty(userName)) {
                    if (StringUtils.equals(ipaddr, sysUser.getIpaddr()) && StringUtils.equals(userName, sysUser.getUsername())) {
                        userOnlineList.add(userOnlineService.selectOnlineByInfo(ipaddr, userName, sysUser));
                    }
                } else if (StringUtils.isNotEmpty(ipaddr)) {
                    if (StringUtils.equals(ipaddr, sysUser.getIpaddr())) {
                        userOnlineList.add(userOnlineService.selectOnlineByIpaddr(ipaddr, sysUser));
                    }
                } else if (StringUtils.isNotEmpty(userName)) {
                    if (StringUtils.equals(userName, sysUser.getUsername())) {
                        userOnlineList.add(userOnlineService.selectOnlineByUserName(userName, sysUser));
                    }
                } else {
                    userOnlineList.add(userOnlineService.loginUserToUserOnline(sysUser));
                }
            }
        }
        Collections.reverse(userOnlineList);
        userOnlineList.removeAll(Collections.singleton(null));
        return getDataTable(userOnlineList);
    }

    /**
     * 强退用户
     */
    @RequiresPermissions("monitor:online:forceLogout")
    @Log(title = "在线用户", businessType = BusinessType.FORCE)
    @DeleteMapping("/{tokenId}")
    @ApiOperation(value = "强退用户", notes = "强退用户")
    public AjaxResult forceLogout(@PathVariable String tokenId) {
        redisService.deleteObject(CacheConstants.LOGIN_TOKEN_KEY + tokenId);
        return success();
    }
}
