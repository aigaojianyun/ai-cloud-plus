package com.cloud.system.system.controller;

import com.cloud.common.domain.R;
import com.cloud.common.utils.StringUtils;
import com.cloud.common.utils.file.FileTypeUtils;
import com.cloud.common.utils.file.MimeTypeUtils;
import com.cloud.common.web.controller.BaseController;
import com.cloud.common.web.domain.AjaxResult;
import com.cloud.file.api.domain.File;
import com.cloud.file.api.service.RemoteFileService;
import com.cloud.log.annotation.Log;
import com.cloud.log.enums.BusinessType;
import com.cloud.security.service.SysTokenService;
import com.cloud.security.utils.SecurityUtils;
import com.cloud.system.api.domain.SysUser;
import com.cloud.system.api.model.SysLoginUser;
import com.cloud.system.system.service.ISysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Arrays;

/**
 * 个人信息 业务处理
 *
 * @author ai-cloud
 */
@Api(tags = "个人信息")
@RestController
@RequestMapping("/user/profile")
public class SysProfileController extends BaseController {
    @Autowired
    private ISysUserService userService;

    @Autowired
    private SysTokenService sysTokenService;

    @Autowired
    private RemoteFileService remoteFileService;

    /**
     * 个人信息
     */
    @GetMapping
    @ApiOperation(value = "个人信息", notes = "个人信息")
    public AjaxResult profile() {
        String username = SecurityUtils.getUsername();
        SysUser user = userService.selectUserByUserName(username);
        AjaxResult ajax = success(user);
        ajax.put("roleGroup", userService.selectUserRoleGroup(username));
        ajax.put("postGroup", userService.selectUserPostGroup(username));
        return ajax;
    }

    /**
     * 修改用户
     */
    @Log(title = "个人信息", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation(value = "修改用户", notes = "修改用户")
    public AjaxResult updateProfile(@RequestBody SysUser user) {
        SysLoginUser sysLoginUser = SecurityUtils.getLoginUser();
        SysUser sysUser = sysLoginUser.getSysUser();
        user.setUserName(sysUser.getUserName());
        if (StringUtils.isNotEmpty(user.getPhonenumber()) && !userService.checkPhoneUnique(user)){
            return error("修改用户'" + user.getUserName() + "'失败，手机号码已存在");
        }   else if (StringUtils.isNotEmpty(user.getEmail()) && !userService.checkEmailUnique(user)) {
            return error("修改用户'" + user.getUserName() + "'失败，邮箱账号已存在");
        }
        user.setUserId(sysUser.getUserId());
        user.setPassword(null);
        user.setAvatar(null);
        user.setDeptId(null);
        if (userService.updateUserProfile(user) > 0) {
            // 更新缓存用户信息
            sysLoginUser.getSysUser().setNickName(user.getNickName());
            sysLoginUser.getSysUser().setPhonenumber(user.getPhonenumber());
            sysLoginUser.getSysUser().setEmail(user.getEmail());
            sysLoginUser.getSysUser().setSex(user.getSex());
            sysTokenService.setLoginUser(sysLoginUser);
            return success();
        }
        return error("修改个人信息异常，请联系管理员");
    }

    /**
     * 重置密码
     */
    @Log(title = "个人信息", businessType = BusinessType.UPDATE)
    @PutMapping("/updatePwd")
    @ApiOperation(value = "重置密码", notes = "重置密码")
    public AjaxResult updatePwd(String oldPassword, String newPassword) {
        String username = SecurityUtils.getUsername();
        SysUser sysUser = userService.selectUserByUserName(username);
        String password = sysUser.getPassword();
        if (!SecurityUtils.matchesPassword(oldPassword, password)) {
            return error("修改密码失败，旧密码错误");
        }
        if (SecurityUtils.matchesPassword(newPassword, password)) {
            return error("新密码不能与旧密码相同");
        }
        if (userService.resetUserPwd(username, SecurityUtils.encryptPassword(newPassword)) > 0) {
            // 更新缓存用户密码
            SysLoginUser sysLoginUser = SecurityUtils.getLoginUser();
            sysLoginUser.getSysUser().setPassword(SecurityUtils.encryptPassword(newPassword));
            sysTokenService.setLoginUser(sysLoginUser);
            return success();
        }
        return error("修改密码异常，请联系管理员");
    }

    /**
     * 头像上传
     */
    @Log(title = "用户头像", businessType = BusinessType.UPDATE)
    @PostMapping("/avatar")
    @ApiOperation(value = "头像上传", notes = "头像上传")
    public AjaxResult avatar(@RequestParam("avatarfile") MultipartFile file) {
        if (!file.isEmpty()) {
            SysLoginUser sysLoginUser = SecurityUtils.getLoginUser();
            String extension = FileTypeUtils.getExtension(file);
            if (!StringUtils.equalsAnyIgnoreCase(extension, MimeTypeUtils.IMAGE_EXTENSION)) {
                return error("文件格式不正确，请上传" + Arrays.toString(MimeTypeUtils.IMAGE_EXTENSION) + "格式");
            }
            R<File> fileResult = remoteFileService.upload(file);
            if (StringUtils.isNull(fileResult) || StringUtils.isNull(fileResult.getData())) {
                return error("文件服务异常，请联系管理员");
            }
            String url = fileResult.getData().getUrl();
            if (userService.updateUserAvatar(sysLoginUser.getUsername(), url)) {
                AjaxResult ajax = success();
                ajax.put("imgUrl", url);
                // 更新缓存用户头像
                sysLoginUser.getSysUser().setAvatar(url);
                sysTokenService.setLoginUser(sysLoginUser);
                return ajax;
            }
        }
        return error("上传图片异常，请联系管理员");
    }
}
