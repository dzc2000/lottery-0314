package com.dzc.infrastructure.persistent.dao;

import com.dzc.infrastructure.persistent.po.RaffleActivity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IRaffleActivityDao {

    RaffleActivity queryRaffleActivityByActivityId(Long activityId);

}
