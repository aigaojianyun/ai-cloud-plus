package com.cloud.system.resource.controller;

import com.cloud.common.utils.poi.ExcelUtil;
import com.cloud.common.web.controller.BaseController;
import com.cloud.common.web.domain.AjaxResult;
import com.cloud.common.web.page.TableDataInfo;
import com.cloud.log.annotation.Log;
import com.cloud.log.enums.BusinessType;
import com.cloud.security.annotation.RequiresPermissions;
import com.cloud.security.utils.SecurityUtils;
import com.cloud.system.resource.domain.AiBank;
import com.cloud.system.resource.service.IAiBankService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 银行信息Controller
 *
 * @author ai-cloud
 */
@Api(tags = "银行信息")
@RestController
@RequestMapping("/bank")
public class AiBankController extends BaseController {
    @Autowired
    private IAiBankService aiBankService;

    /**
     * 查询银行信息列表
     */
    @RequiresPermissions("resource:bank:list")
    @GetMapping("/list")
    public TableDataInfo list(AiBank aiBank) {
        startPage();
        List<AiBank> list = aiBankService.selectAiBankList(aiBank);
        return getDataTable(list);
    }

    /**
     * 导出银行信息列表
     */
    @RequiresPermissions("resource:bank:export")
    @Log(title = "导出银行信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AiBank aiBank) {
        List<AiBank> list = aiBankService.selectAiBankList(aiBank);
        ExcelUtil<AiBank> util = new ExcelUtil<AiBank>(AiBank.class);
        util.exportExcel(response, list, "银行信息数据");
    }

    /**
     * 获取银行信息详细信息
     */
    @RequiresPermissions("resource:bank:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(aiBankService.selectAiBankById(id));
    }

    /**
     * 新增银行信息
     */
    @RequiresPermissions("resource:bank:add")
    @Log(title = "新增银行信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AiBank aiBank) {
        if (!aiBankService.checkAiBankUnique(aiBank)) {
            return error("新增参数'" + aiBank.getBankName() + "'失败，银行名称已存在");
        }
        aiBank.setCreateBy(SecurityUtils.getUsername());
        return toAjax(aiBankService.insertAiBank(aiBank));
    }

    /**
     * 修改银行信息
     */
    @RequiresPermissions("resource:bank:edit")
    @Log(title = "修改银行信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AiBank aiBank) {
        if (!aiBankService.checkAiBankUnique(aiBank)) {
            return error("新增参数'" + aiBank.getBankName() + "'失败，银行名称已存在");
        }
        aiBank.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(aiBankService.updateAiBank(aiBank));
    }

    /**
     * 删除银行信息
     */
    @RequiresPermissions("resource:bank:remove")
    @Log(title = "删除银行信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(aiBankService.deleteAiBankByIds(ids));
    }
}
