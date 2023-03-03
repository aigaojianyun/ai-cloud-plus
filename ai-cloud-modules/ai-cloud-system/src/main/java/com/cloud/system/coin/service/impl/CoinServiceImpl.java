package com.cloud.system.coin.service.impl;

import com.cloud.common.utils.DateUtils;
import com.cloud.system.coin.domain.Coin;
import com.cloud.system.coin.mapper.CoinMapper;
import com.cloud.system.coin.service.ICoinService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 货币Service业务层处理
 *
 * @author ai-cloud
 */
@Service
public class CoinServiceImpl implements ICoinService {
    @Autowired
    private CoinMapper coinMapper;

    /**
     * 查询货币
     *
     * @param id 货币主键
     * @return 货币
     */
    @Override
    public Coin selectCoinById(Long id) {
        return coinMapper.selectCoinById(id);
    }

    /**
     * 查询货币列表
     *
     * @param coin 货币
     * @return 货币
     */
    @Override
    public List<Coin> selectCoinList(Coin coin) {
        return coinMapper.selectCoinList(coin);
    }

    /**
     * 新增货币
     *
     * @param coin 货币
     * @return 结果
     */
    @Override
    public int insertCoin(Coin coin) {
                coin.setCreateTime(DateUtils.getNowDate());
            return coinMapper.insertCoin(coin);
    }

    /**
     * 修改货币
     *
     * @param coin 货币
     * @return 结果
     */
    @Override
    public int updateCoin(Coin coin) {
                coin.setUpdateTime(DateUtils.getNowDate());
        return coinMapper.updateCoin(coin);
    }

    /**
     * 批量删除货币
     *
     * @param ids 需要删除的货币主键
     * @return 结果
     */
    @Override
    public int deleteCoinByIds(Long[] ids) {
        return coinMapper.deleteCoinByIds(ids);
    }

    /**
     * 删除货币信息
     *
     * @param id 货币主键
     * @return 结果
     */
    @Override
    public int deleteCoinById(Long id) {
        return coinMapper.deleteCoinById(id);
    }
}
