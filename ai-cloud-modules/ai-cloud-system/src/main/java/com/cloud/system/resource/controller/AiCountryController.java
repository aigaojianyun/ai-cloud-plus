package com.cloud.system.resource.controller;

import com.cloud.common.utils.poi.ExcelUtil;
import com.cloud.common.web.controller.BaseController;
import com.cloud.common.web.domain.AjaxResult;
import com.cloud.common.web.page.TableDataInfo;
import com.cloud.log.annotation.Log;
import com.cloud.log.enums.BusinessType;
import com.cloud.security.annotation.RequiresPermissions;
import com.cloud.system.resource.domain.AiCountry;
import com.cloud.system.resource.service.IAiCountryService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 国家信息Controller
 *
 * @author ai-cloud
 */
@Api(tags = "国家信息")
@RestController
@RequestMapping("/country")
public class AiCountryController extends BaseController {
    @Autowired
    private IAiCountryService aiCountryService;

    /**
     * 查询国家信息列表
     */
    @RequiresPermissions("resource:country:list")
    @GetMapping("/list")
    public TableDataInfo list(AiCountry aiCountry) {
        startPage();
        List<AiCountry> list = aiCountryService.selectAiCountryList(aiCountry);
        return getDataTable(list);
    }

    /**
     * 导出国家信息列表
     */
    @RequiresPermissions("resource:country:export")
    @Log(title = "国家信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AiCountry aiCountry) {
        List<AiCountry> list = aiCountryService.selectAiCountryList(aiCountry);
        ExcelUtil<AiCountry> util = new ExcelUtil<AiCountry>(AiCountry. class);
        util.exportExcel(response, list, "国家信息数据");
    }

    /**
     * 获取国家信息详细信息
     */
    @RequiresPermissions("resource:country:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(aiCountryService.selectAiCountryById(id));
    }

    /**
     * 新增国家信息
     */
    @RequiresPermissions("resource:country:add")
    @Log(title = "国家信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AiCountry aiCountry) {
        return toAjax(aiCountryService.insertAiCountry(aiCountry));
    }

    /**
     * 修改国家信息
     */
    @RequiresPermissions("resource:country:edit")
    @Log(title = "国家信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AiCountry aiCountry) {
        return toAjax(aiCountryService.updateAiCountry(aiCountry));
    }

    /**
     * 删除国家信息
     */
    @RequiresPermissions("resource:country:remove")
    @Log(title = "国家信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(aiCountryService.deleteAiCountryByIds(ids));
    }
}
