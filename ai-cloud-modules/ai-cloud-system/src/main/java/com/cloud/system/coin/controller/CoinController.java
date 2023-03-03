package com.cloud.system.coin.controller;

import com.cloud.common.utils.poi.ExcelUtil;
import com.cloud.common.web.controller.BaseController;
import com.cloud.common.web.domain.AjaxResult;
import com.cloud.common.web.page.TableDataInfo;
import com.cloud.log.annotation.Log;
import com.cloud.log.enums.BusinessType;
import com.cloud.security.annotation.RequiresPermissions;
import com.cloud.system.coin.domain.Coin;
import com.cloud.system.coin.service.ICoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 货币Controller
 *
 * @author ai-cloud
 */
@RestController
@RequestMapping("/coin")
public class CoinController extends BaseController {
    @Autowired
    private ICoinService coinService;

    /**
     * 查询货币列表
     */
    @RequiresPermissions("coin:coin:list")
    @GetMapping("/list")
    public TableDataInfo list(Coin coin) {
        startPage();
        List<Coin> list = coinService.selectCoinList(coin);
        return getDataTable(list);
    }

    /**
     * 导出货币列表
     */
    @RequiresPermissions("coin:coin:export")
    @Log(title = "货币", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Coin coin) {
        List<Coin> list = coinService.selectCoinList(coin);
        ExcelUtil<Coin> util = new ExcelUtil<Coin>(Coin. class);
        util.exportExcel(response, list, "货币数据");
    }

    /**
     * 获取货币详细信息
     */
    @RequiresPermissions("coin:coin:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(coinService.selectCoinById(id));
    }

    /**
     * 新增货币
     */
    @RequiresPermissions("coin:coin:add")
    @Log(title = "货币", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Coin coin) {
        return toAjax(coinService.insertCoin(coin));
    }

    /**
     * 修改货币
     */
    @RequiresPermissions("coin:coin:edit")
    @Log(title = "货币", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Coin coin) {
        return toAjax(coinService.updateCoin(coin));
    }

    /**
     * 删除货币
     */
    @RequiresPermissions("coin:coin:remove")
    @Log(title = "货币", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(coinService.deleteCoinByIds(ids));
    }
}
