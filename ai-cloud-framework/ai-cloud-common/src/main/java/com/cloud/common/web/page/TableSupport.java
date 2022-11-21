package com.cloud.common.web.page;

import com.cloud.common.text.Convert;
import com.cloud.common.utils.ServletUtils;

/**
 * 表格数据处理
 *
 * @author ai-cloud
 */
public class TableSupport {
    /**
     * 当前记录起始索引
     */
    public static final String PAGE_NUM = "pageNum";

    /**
     * 每页显示记录数
     */
    public static final String PAGE_SIZE = "pageSize";

    /**
     * 排序列
     */
    public static final String ORDER_BY_COLUMN = "orderByColumn";

    /**
     * 排序的方向 "desc" 或者 "asc".
     */
    public static final String IS_ASC = "isAsc";

    /**
     * 分页参数合理化
     */
    public static final String REASONABLE = "reasonable";

    /**
     * 封装分页对象
     */
    public static PageParam getPageDomain() {
        PageParam pageParam = new PageParam();
        pageParam.setPageNum(Convert.toInt(ServletUtils.getParameter(PAGE_NUM), 1));
        pageParam.setPageSize(Convert.toInt(ServletUtils.getParameter(PAGE_SIZE), 10));
        pageParam.setOrderByColumn(ServletUtils.getParameter(ORDER_BY_COLUMN));
        pageParam.setIsAsc(ServletUtils.getParameter(IS_ASC));
        pageParam.setReasonable(ServletUtils.getParameterToBool(REASONABLE));
        return pageParam;
    }

    public static PageParam buildPageRequest() {
        return getPageDomain();
    }
}
