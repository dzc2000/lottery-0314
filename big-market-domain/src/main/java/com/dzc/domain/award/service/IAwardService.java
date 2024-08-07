package com.dzc.domain.award.service;

import com.dzc.domain.award.model.entity.DistributeAwardEntity;
import com.dzc.domain.award.model.entity.UserAwardRecordEntity;

public interface IAwardService {

    void saveUserAwardRecord(UserAwardRecordEntity userAwardRecordEntity);

    /**
     * 配送发货奖品
     */
    void distributeAward(DistributeAwardEntity distributeAwardEntity);

}
