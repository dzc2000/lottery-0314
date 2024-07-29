package com.dzc.infrastructure.persistent.dao;

import cn.bugstack.middleware.db.router.annotation.DBRouterStrategy;
import com.dzc.infrastructure.persistent.po.UserAwardRecord;
import org.apache.ibatis.annotations.Mapper;

@Mapper
@DBRouterStrategy(splitTable = true)
public interface IUserAwardRecordDao {

    void insert(UserAwardRecord userAwardRecord);

}
