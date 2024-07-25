package com.dzc.domain.strategy.service;

import com.dzc.domain.strategy.model.entity.StrategyAwardEntity;

import java.util.List;

public interface IRaffleAward {
    /**
     * 根据策略ID查询抽奖奖品列表配置
     *
     * @param strategyId 策略ID
     * @return 奖品列表
     */
    List<StrategyAwardEntity> queryRaffleStrategyAwardList(Long strategyId);

}
