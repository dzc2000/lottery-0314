package com.dzc.domain.rebate.repository;

import com.dzc.domain.rebate.model.aggregate.BehaviorRebateAggregate;
import com.dzc.domain.rebate.model.entity.BehaviorRebateOrderEntity;
import com.dzc.domain.rebate.model.valobj.BehaviorTypeVO;
import com.dzc.domain.rebate.model.valobj.DailyBehaviorRebateVO;

import java.util.List;

public interface IBehaviorRebateRepository {

    List<DailyBehaviorRebateVO> queryDailyBehaviorRebateConfig(BehaviorTypeVO behaviorTypeVO);

    void saveUserRebateRecord(String userId, List<BehaviorRebateAggregate> behaviorRebateAggregates);

    List<BehaviorRebateOrderEntity> queryOrderByOutBusinessNo(String userId, String outBusinessNo);
}
