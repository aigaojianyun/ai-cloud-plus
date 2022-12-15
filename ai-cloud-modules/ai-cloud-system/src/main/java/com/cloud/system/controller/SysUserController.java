package com.cloud.system.controller;

import com.cloud.common.constant.UserConstants;
import com.cloud.common.domain.R;
import com.cloud.common.utils.DateUtils;
import com.cloud.common.utils.ShortIdUtils;
import com.cloud.common.utils.StringUtils;
import com.cloud.common.utils.poi.ExcelUtil;
import com.cloud.common.utils.uuid.IdUtils;
import com.cloud.common.web.controller.BaseController;
import com.cloud.common.web.domain.AjaxResult;
import com.cloud.common.web.page.TableDataInfo;
import com.cloud.log.annotation.Log;
import com.cloud.log.enums.BusinessType;
import com.cloud.security.annotation.InnerAuth;
import com.cloud.security.annotation.RequiresPermissions;
import com.cloud.security.utils.SecurityUtils;
import com.cloud.system.api.domain.SysDept;
import com.cloud.system.api.domain.SysRole;
import com.cloud.system.api.domain.SysUser;
import com.cloud.system.api.domain.User;
import com.cloud.system.api.model.LoginUser;
import com.cloud.system.service.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 用户信息
 *
 * @author ai-cloud
 */
@Api(tags = "用户信息")
@RestController
@RequestMapping("/user")
public class SysUserController extends BaseController {

    @Autowired
    private IUserService iUserService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysRoleService roleService;

    @Autowired
    private ISysDeptService deptService;

    @Autowired
    private ISysPostService postService;

    @Autowired
    private ISysPermissionService permissionService;

    @Autowired
    private ISysConfigService configService;

    /**
     * 获取用户列表
     */
    @RequiresPermissions("system:user:list")
    @GetMapping("/list")
    @ApiOperation(value = "获取用户列表", notes = "获取用户列表")
    public TableDataInfo list(SysUser user) {
        startPage();
        List<SysUser> list = userService.selectUserList(user);
        return getDataTable(list);
    }

    /**
     * 根据条件分页查询用户列表
     */
    @Log(title = "用户管理", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:user:export")
    @PostMapping("/export")
    @ApiOperation(value = "根据条件分页查询用户列表", notes = "根据条件分页查询用户列表")
    public void export(HttpServletResponse response, SysUser user) {
        List<SysUser> list = userService.selectUserList(user);
        ExcelUtil<SysUser> util = new ExcelUtil<SysUser>(SysUser.class);
        util.exportExcel(response, list, "用户数据");
    }

    /**
     * 导入用户数据
     */
    @Log(title = "用户管理", businessType = BusinessType.IMPORT)
    @RequiresPermissions("system:user:import")
    @PostMapping("/importData")
    @ApiOperation(value = "导入用户数据", notes = "导入用户数据")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<SysUser> util = new ExcelUtil<SysUser>(SysUser.class);
        List<SysUser> userList = util.importExcel(file.getInputStream());
        String operName = SecurityUtils.getUsername();
        String message = userService.importUser(userList, updateSupport, operName);
        return success(message);
    }

    /**
     * 导出用户数据
     */
    @PostMapping("/importTemplate")
    @ApiOperation(value = "导出用户数据", notes = "导出用户数据")
    public void importTemplate(HttpServletResponse response) throws IOException {
        ExcelUtil<SysUser> util = new ExcelUtil<SysUser>(SysUser.class);
        util.importTemplateExcel(response, "用户数据");
    }

    /**
     * 获取当前用户信息
     */
    @InnerAuth
    @GetMapping("/info/{username}")
    @ApiOperation(value = "获取当前用户信息", notes = "获取当前用户信息")
    public R<LoginUser> info(@PathVariable("username") String username) {
        //普通用户信息
        User user = iUserService.selectByUserNamePhone(username);
        //系统用户信息
        SysUser sysUser = userService.selectUserById(user.getId());
        LoginUser sysUserVo = new LoginUser();
        if (StringUtils.isNotNull(sysUser)) {
            // 角色集合
            Set<String> roles = permissionService.getRolePermission(sysUser);
            // 权限集合
            Set<String> permissions = permissionService.getMenuPermission(sysUser);
            sysUserVo.setUser(user);
            sysUserVo.setSysUser(sysUser);
            sysUserVo.setRoles(roles);
            sysUserVo.setPermissions(permissions);
        } else {
            sysUserVo.setUser(user);
        }
        return R.ok(sysUserVo);
    }

    /**
     * 注册用户信息
     */
    @InnerAuth
    @PostMapping("/register")
    @ApiOperation(value = "注册用户信息", notes = "注册用户信息")
    public R<Boolean> register(@RequestBody SysUser sysUser) {
        String username = sysUser.getUserName();
        if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser")))) {
            return R.fail("当前系统没有开启注册功能！");
        }
        if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(username))) {
            return R.fail("保存用户'" + username + "'失败，注册账号已存在");
        }
        return R.ok(userService.registerUser(sysUser));
    }

    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    @ApiOperation(value = "获取用户信息", notes = "获取用户信息")
    public AjaxResult getInfo() {
        SysUser user = userService.selectUserById(SecurityUtils.getUserId());
        AjaxResult ajax = success();
        if (StringUtils.isNotNull(user)) {
            // 角色集合
            Set<String> roles = permissionService.getRolePermission(user);
            // 权限集合
            Set<String> permissions = permissionService.getMenuPermission(user);
            ajax.put("user", user);
            ajax.put("roles", roles);
            ajax.put("permissions", permissions);
        } else {
            return error("该账号不具备权限,无法进行操作!");
        }
        return ajax;
    }

    /**
     * 根据用户编号获取详细信息
     */
    @RequiresPermissions("system:user:query")
    @GetMapping(value = {"/", "/{userId}"})
    @ApiOperation(value = "根据用户编号获取详细信息", notes = "根据用户编号获取详细信息")
    public AjaxResult getInfo(@PathVariable(value = "userId", required = false) Long userId) {
        userService.checkUserDataScope(userId);
        AjaxResult ajax = success();
        List<SysRole> roles = roleService.selectRoleAll();
        ajax.put("roles", SysUser.isAdmin(userId) ? roles : roles.stream().filter(r -> !r.isAdmin()).collect(Collectors.toList()));
        ajax.put("posts", postService.selectPostAll());
        if (StringUtils.isNotNull(userId)) {
            SysUser sysUser = userService.selectUserById(userId);
            ajax.put(AjaxResult.DATA_TAG, sysUser);
            ajax.put("postIds", postService.selectPostListByUserId(userId));
            ajax.put("roleIds", sysUser.getRoles().stream().map(SysRole::getRoleId).collect(Collectors.toList()));
        }
        return ajax;
    }

    /**
     * 新增用户
     */
    @RequiresPermissions("system:user:add")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation(value = "新增用户", notes = "新增用户")
    public AjaxResult add(@Validated @RequestBody SysUser sysUser) {
        if (UserConstants.NOT_UNIQUE.equals(userService.checkUserNameUnique(sysUser.getUserName()))) {
            return error("新增用户'" + sysUser.getUserName() + "'失败，登录账号已存在");
        } else if (StringUtils.isNotEmpty(sysUser.getPhonenumber())
                && UserConstants.NOT_UNIQUE.equals(userService.checkPhoneUnique(sysUser))) {
            return error("新增用户'" + sysUser.getUserName() + "'失败，手机号码已存在");
        } else if (StringUtils.isNotEmpty(sysUser.getEmail())
                && UserConstants.NOT_UNIQUE.equals(userService.checkEmailUnique(sysUser))) {
            return error("新增用户'" + sysUser.getUserName() + "'失败，邮箱账号已存在");
        }
        sysUser.setUserId(ShortIdUtils.generateId());
        sysUser.setCreateBy(SecurityUtils.getUsername());
        sysUser.setPassword(SecurityUtils.encryptPassword(sysUser.getPassword()));
        //创建用户登录信息
        User user = new User();
        user.setId(sysUser.getUserId());
        user.setUserName(sysUser.getUserName());
        user.setNickName(sysUser.getNickName());
        user.setPhone(sysUser.getPhonenumber());
        user.setPassword(sysUser.getPassword());
        user.setSex(sysUser.getSex());
        user.setUuid(IdUtils.fastSimpleUUID());
        user.setUserType(2);
        user.setActivateTime(DateUtils.getNowDate());
        user.setCreateBy(SecurityUtils.getUsername());
        iUserService.insertUser(user);
        return toAjax(userService.insertUser(sysUser));
    }

    /**
     * 修改用户
     */
    @RequiresPermissions("system:user:edit")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation(value = "修改用户", notes = "修改用户")
    public AjaxResult edit(@Validated @RequestBody SysUser sysUser) {
        userService.checkUserAllowed(sysUser);
        userService.checkUserDataScope(sysUser.getUserId());
        if (StringUtils.isNotEmpty(sysUser.getPhonenumber())
                && UserConstants.NOT_UNIQUE.equals(userService.checkPhoneUnique(sysUser))) {
            return error("修改用户'" + sysUser.getUserName() + "'失败，手机号码已存在");
        } else if (StringUtils.isNotEmpty(sysUser.getEmail())
                && UserConstants.NOT_UNIQUE.equals(userService.checkEmailUnique(sysUser))) {
            return error("修改用户'" + sysUser.getUserName() + "'失败，邮箱账号已存在");
        }
        sysUser.setUpdateBy(SecurityUtils.getUsername());
        //修改用户登录信息
        User user = iUserService.selectById(sysUser.getUserId());
        user.setUserName(sysUser.getUserName());
        user.setNickName(sysUser.getNickName());
        user.setPhone(sysUser.getPhonenumber());
        user.setSex(sysUser.getSex());
        iUserService.updateById(user);
        return toAjax(userService.updateUser(sysUser));
    }

    /**
     * 删除用户
     */
    @RequiresPermissions("system:user:remove")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{userIds}")
    @ApiOperation(value = "删除用户", notes = "删除用户")
    public AjaxResult remove(@PathVariable Long[] userIds) {
        if (ArrayUtils.contains(userIds, SecurityUtils.getUserId())) {
            return error("当前用户不能删除");
        }
        iUserService.deleteByIds(userIds);
        return toAjax(userService.deleteUserByIds(userIds));
    }

    /**
     * 重置密码
     */
    @RequiresPermissions("system:user:edit")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/resetPwd")
    @ApiOperation(value = "重置密码", notes = "重置密码")
    public AjaxResult resetPwd(@RequestBody SysUser user) {
        userService.checkUserAllowed(user);
        userService.checkUserDataScope(user.getUserId());
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        user.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(userService.resetPwd(user));
    }

    /**
     * 状态修改
     */
    @RequiresPermissions("system:user:edit")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    @ApiOperation(value = "状态修改", notes = "状态修改")
    public AjaxResult changeStatus(@RequestBody SysUser user) {
        userService.checkUserAllowed(user);
        userService.checkUserDataScope(user.getUserId());
        user.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(userService.updateUserStatus(user));
    }

    /**
     * 根据用户编号获取授权角色
     */
    @RequiresPermissions("system:user:query")
    @GetMapping("/authRole/{userId}")
    @ApiOperation(value = "根据用户编号获取授权角色", notes = "根据用户编号获取授权角色")
    public AjaxResult authRole(@PathVariable("userId") Long userId) {
        AjaxResult ajax = success();
        SysUser user = userService.selectUserById(userId);
        List<SysRole> roles = roleService.selectRolesByUserId(userId);
        ajax.put("user", user);
        ajax.put("roles", SysUser.isAdmin(userId) ? roles : roles.stream().filter(r -> !r.isAdmin()).collect(Collectors.toList()));
        return ajax;
    }

    /**
     * 用户授权角色
     */
    @RequiresPermissions("system:user:edit")
    @Log(title = "用户管理", businessType = BusinessType.GRANT)
    @PutMapping("/authRole")
    @ApiOperation(value = "用户授权角色", notes = "用户授权角色")
    public AjaxResult insertAuthRole(Long userId, Long[] roleIds) {
        userService.checkUserDataScope(userId);
        userService.insertUserAuth(userId, roleIds);
        return success();
    }

    /**
     * 获取部门树列表
     */
    @RequiresPermissions("system:user:list")
    @GetMapping("/deptTree")
    @ApiOperation(value = "获取部门树列表", notes = "获取部门树列表")
    public AjaxResult deptTree(SysDept dept) {
        return success(deptService.selectDeptTreeList(dept));
    }
}
