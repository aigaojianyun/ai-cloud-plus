package com.cloud.system.system.controller;

import com.cloud.common.utils.poi.ExcelUtil;
import com.cloud.common.web.controller.BaseController;
import com.cloud.common.web.domain.AjaxResult;
import com.cloud.common.web.page.TableDataInfo;
import com.cloud.log.annotation.Log;
import com.cloud.log.enums.BusinessType;
import com.cloud.security.annotation.InnerAuth;
import com.cloud.security.annotation.RequiresPermissions;
import com.cloud.system.api.domain.SysOperLog;
import com.cloud.system.system.service.ISysOperLogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 操作日志记录
 *
 * @author ai-cloud
 */
@Api(tags = "操作日志")
@RestController
@RequestMapping("/operlog")
public class SysOperlogController extends BaseController {
    @Autowired
    private ISysOperLogService operLogService;

    /**
     * 获取操作日志列表
     */
    @RequiresPermissions("system:operlog:list")
    @GetMapping("/list")
    @ApiOperation(value = "获取操作日志列表", notes = "获取操作日志列表")
    public TableDataInfo list(SysOperLog operLog) {
        startPage();
        List<SysOperLog> list = operLogService.selectOperLogList(operLog);
        return getDataTable(list);
    }

    /**
     * 导出操作日志
     */
    @Log(title = "操作日志", businessType = BusinessType.EXPORT)
    @RequiresPermissions("system:operlog:export")
    @PostMapping("/export")
    @ApiOperation(value = "导出操作日志", notes = "导出操作日志")
    public void export(HttpServletResponse response, SysOperLog operLog) {
        List<SysOperLog> list = operLogService.selectOperLogList(operLog);
        ExcelUtil<SysOperLog> util = new ExcelUtil<SysOperLog>(SysOperLog.class);
        util.exportExcel(response, list, "操作日志");
    }

    /**
     * 删除系统操作日志
     */
    @Log(title = "操作日志", businessType = BusinessType.DELETE)
    @RequiresPermissions("system:operlog:remove")
    @DeleteMapping("/{operIds}")
    @ApiOperation(value = "删除系统操作日志", notes = "删除系统操作日志")
    public AjaxResult remove(@PathVariable Long[] operIds) {
        return toAjax(operLogService.deleteOperLogByIds(operIds));
    }

    /**
     * 清空操作日志
     */
    @RequiresPermissions("system:operlog:remove")
    @Log(title = "操作日志", businessType = BusinessType.CLEAN)
    @DeleteMapping("/clean")
    @ApiOperation(value = "清空操作日志", notes = "清空操作日志")
    public AjaxResult clean() {
        operLogService.cleanOperLog();
        return success();
    }

    /**
     * 新增操作日志
     */
    @InnerAuth
    @PostMapping
    @ApiOperation(value = "新增操作日志", notes = "新增操作日志")
    public AjaxResult add(@RequestBody SysOperLog operLog) {
        return toAjax(operLogService.insertOperlog(operLog));
    }
}
