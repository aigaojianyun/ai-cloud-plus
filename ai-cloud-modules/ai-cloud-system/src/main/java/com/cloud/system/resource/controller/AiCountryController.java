package com.cloud.system.resource.controller;

import com.cloud.common.utils.poi.ExcelUtil;
import com.cloud.common.web.controller.BaseController;
import com.cloud.common.web.domain.AjaxResult;
import com.cloud.common.web.page.TableDataInfo;
import com.cloud.log.annotation.Log;
import com.cloud.log.enums.BusinessType;
import com.cloud.security.annotation.RequiresPermissions;
import com.cloud.security.utils.SecurityUtils;
import com.cloud.system.resource.domain.AiCountry;
import com.cloud.system.resource.service.IAiCountryService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 区域信息Controller
 *
 * @author ai-cloud
 */
@Api(tags = "区域信息")
@RestController
@RequestMapping("/country")
public class AiCountryController extends BaseController {
    @Autowired
    private IAiCountryService aiCountryService;

    /**
     * 查询区域信息列表
     */
    @RequiresPermissions("resource:country:list")
    @GetMapping("/list")
    public TableDataInfo list(AiCountry aiCountry) {
        startPage();
        List<AiCountry> list = aiCountryService.selectAiCountryList(aiCountry);
        return getDataTable(list);
    }

    /**
     * 导出区域信息列表
     */
    @RequiresPermissions("resource:country:export")
    @Log(title = "导出区域信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AiCountry aiCountry) {
        List<AiCountry> list = aiCountryService.selectAiCountryList(aiCountry);
        ExcelUtil<AiCountry> util = new ExcelUtil<AiCountry>(AiCountry. class);
        util.exportExcel(response, list, "区域信息数据");
    }

    /**
     * 获取区域信息详细信息
     */
    @RequiresPermissions("resource:country:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(aiCountryService.selectAiCountryById(id));
    }

    /**
     * 新增区域信息
     */
    @RequiresPermissions("resource:country:add")
    @Log(title = "新增区域信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AiCountry aiCountry) {
        if (!aiCountryService.checkAiCountryUnique(aiCountry)) {
            return error("新增参数'" + aiCountry.getCnName() + "'失败，区域名称已存在");
        }
        aiCountry.setCreateBy(SecurityUtils.getUsername());
        return toAjax(aiCountryService.insertAiCountry(aiCountry));
    }

    /**
     * 修改区域信息
     */
    @RequiresPermissions("resource:country:edit")
    @Log(title = "修改区域信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AiCountry aiCountry) {
        if (!aiCountryService.checkAiCountryUnique(aiCountry)) {
            return error("新增参数'" + aiCountry.getCnName() + "'失败，区域名称已存在");
        }
        aiCountry.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(aiCountryService.updateAiCountry(aiCountry));
    }

    /**
     * 删除区域信息
     */
    @RequiresPermissions("resource:country:remove")
    @Log(title = "删除区域信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(aiCountryService.deleteAiCountryByIds(ids));
    }
}
