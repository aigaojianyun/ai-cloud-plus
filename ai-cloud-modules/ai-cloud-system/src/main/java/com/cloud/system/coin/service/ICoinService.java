package com.cloud.system.coin.service;

import com.cloud.system.coin.domain.Coin;

import java.util.List;

/**
 * 货币Service接口
 *
 * @author ai-cloud
 */
public interface ICoinService {
    /**
     * 查询货币
     *
     * @param id 货币主键
     * @return 货币
     */
    public Coin selectCoinById(Long id);

    /**
     * 查询货币列表
     *
     * @param coin 货币
     * @return 货币集合
     */
    public List<Coin> selectCoinList(Coin coin);

    /**
     * 新增货币
     *
     * @param coin 货币
     * @return 结果
     */
    public int insertCoin(Coin coin);

    /**
     * 修改货币
     *
     * @param coin 货币
     * @return 结果
     */
    public int updateCoin(Coin coin);

    /**
     * 批量删除货币
     *
     * @param ids 需要删除的货币主键集合
     * @return 结果
     */
    public int deleteCoinByIds(Long[] ids);

    /**
     * 删除货币信息
     *
     * @param id 货币主键
     * @return 结果
     */
    public int deleteCoinById(Long id);
}
