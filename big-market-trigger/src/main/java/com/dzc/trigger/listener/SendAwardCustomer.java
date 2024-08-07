package com.dzc.trigger.listener;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.dzc.domain.award.event.SendAwardMessageEvent;
import com.dzc.domain.award.model.entity.DistributeAwardEntity;
import com.dzc.domain.award.service.IAwardService;
import com.dzc.types.event.BaseEvent;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.kafka.support.KafkaHeaders;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Optional;

/**
 * @author dzc
 * @date 2024/7/29 13:10
 */

@Slf4j
@Component
public class SendAwardCustomer {
    @Resource
    private IAwardService awardService;


    @KafkaListener(topics = "${kafka.topic.send_award}", groupId = "${kafka.topic.group}", concurrency = "1")
    public void listener(ConsumerRecord<?, ?> record, Acknowledgment ack, @Header(KafkaHeaders.RECEIVED_TOPIC) String topic){
        Optional<?> message = Optional.ofNullable(record.value());
        if (message.isPresent()) {
            Object msg = message.get();
            try {
                log.info("监听用户奖品发送消息 topic: {} message: {}", topic, msg);
                BaseEvent.EventMessage<SendAwardMessageEvent.SendAwardMessage> eventMessage = JSON.parseObject(String.valueOf(msg), new TypeReference<BaseEvent.EventMessage<SendAwardMessageEvent.SendAwardMessage>>() {
                }.getType());
                SendAwardMessageEvent.SendAwardMessage sendAwardMessage = eventMessage.getData();

                // 发放奖品
                DistributeAwardEntity distributeAwardEntity = new DistributeAwardEntity();
                distributeAwardEntity.setUserId(sendAwardMessage.getUserId());
                distributeAwardEntity.setOrderId(sendAwardMessage.getOrderId());
                distributeAwardEntity.setAwardId(sendAwardMessage.getAwardId());
                distributeAwardEntity.setAwardConfig(sendAwardMessage.getAwardConfig());
                awardService.distributeAward(distributeAwardEntity);

            } catch (Exception e) {
                log.error("监听用户奖品发送消息，消费失败 topic: {} message: {}", topic, msg);
                throw e;
            }
        }
    }
}
