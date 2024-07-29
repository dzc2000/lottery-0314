package com.dzc.domain.task.repository;


import com.dzc.domain.task.model.entity.TaskEntity;

import java.util.List;

public interface ITaskRepository {

    List<TaskEntity> queryNoSendMessageTaskList();

    void sendMessage(TaskEntity taskEntity);

    void updateTaskSendMessageCompleted(String userId, String messageId);

    void updateTaskSendMessageFail(String userId, String messageId);

}
