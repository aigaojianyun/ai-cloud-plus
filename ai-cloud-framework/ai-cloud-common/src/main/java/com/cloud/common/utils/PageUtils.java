package com.cloud.common.utils;

import com.cloud.common.utils.sql.SqlUtil;
import com.cloud.common.web.page.PageParam;
import com.cloud.common.web.page.TableSupport;
import com.github.pagehelper.PageHelper;

/**
 * 分页工具类
 *
 * @author ai-cloud
 */
public class PageUtils extends PageHelper {
    /**
     * 设置请求分页数据
     */
    public static void startPage() {
        PageParam pageParam = TableSupport.buildPageRequest();
        Integer pageNum = pageParam.getPageNum();
        Integer pageSize = pageParam.getPageSize();
        String orderBy = SqlUtil.escapeOrderBySql(pageParam.getOrderBy());
        Boolean reasonable = pageParam.getReasonable();
        PageHelper.startPage(pageNum, pageSize, orderBy).setReasonable(reasonable);
    }

    /**
     * 清理分页的线程变量
     */
    public static void clearPage() {
        PageHelper.clearPage();
    }
}
