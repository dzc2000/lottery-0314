package com.dzc.domain.activity.service.quota.rule;

import com.dzc.domain.activity.model.entity.ActivityCountEntity;
import com.dzc.domain.activity.model.entity.ActivityEntity;
import com.dzc.domain.activity.model.entity.ActivitySkuEntity;

public interface IActionChain extends IActionChainArmory {

    boolean action(ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity);

}
