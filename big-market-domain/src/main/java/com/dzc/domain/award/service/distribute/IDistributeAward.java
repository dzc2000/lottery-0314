package com.dzc.domain.award.service.distribute;

import com.dzc.domain.award.model.entity.DistributeAwardEntity;

/**
 * @author dzc
 * @date 2024/8/6 16:15
 */
public interface IDistributeAward {
    void giveOutPrizes(DistributeAwardEntity distributeAwardEntity);
}
