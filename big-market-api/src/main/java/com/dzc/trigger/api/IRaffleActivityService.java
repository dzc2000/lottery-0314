package com.dzc.trigger.api;

import com.dzc.trigger.api.dto.ActivityDrawRequestDTO;
import com.dzc.trigger.api.dto.ActivityDrawResponseDTO;
import com.dzc.types.model.Response;

public interface IRaffleActivityService {

    /**
     * 活动装配，数据预热缓存
     * @param activityId 活动ID
     * @return 装配结果
     */
    Response<Boolean> armory(Long activityId);

    /**
     * 活动抽奖接口
     * @param request 请求对象
     * @return 返回结果
     */
    Response<ActivityDrawResponseDTO> draw(ActivityDrawRequestDTO request);

}
