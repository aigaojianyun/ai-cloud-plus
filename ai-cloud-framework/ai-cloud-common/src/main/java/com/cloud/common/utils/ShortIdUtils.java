package com.cloud.common.utils;


import java.time.LocalDate;

/**
 * 短id工具类
 *
 * @author ai-cloud
 */

public class ShortIdUtils {

    /**
     * 生成短id
     */
    public static Long generateId() {
        LocalDate now = LocalDate.now();
        String yearStr = now.getYear() + "";
        yearStr = yearStr.substring(2);
        String dayOfYearStr = now.getDayOfYear() + "";
        if (dayOfYearStr.length() < 3) {
            StringBuilder zeroStr = new StringBuilder();
            for (int i = dayOfYearStr.length(); i < 3; i++) {
                zeroStr.append("0");
            }
            dayOfYearStr = zeroStr + dayOfYearStr;
        }
        StringBuilder id = new StringBuilder(yearStr + dayOfYearStr);
        for (int i = id.length(); i < 10; i++) {
            id.append(getRandomIndex(0, 9));
        }
        return Long.parseLong(id.toString());
    }

    /**
     * 返回范围内的随机int
     *
     * @param min 最小值
     * @param max 最大值
     * @return
     */
    private static int getRandomIndex(int min, int max) {
        return min + (int) (Math.random() * (max - min + 1));
    }

}
