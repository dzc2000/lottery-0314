package com.dzc.trigger.listener;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.dzc.domain.activity.service.ISkuStock;
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
 * @date 2024/7/24 15:33
 */

@Slf4j
@Component
public class ActivitySkuStockZeroCustomer {

    @Resource
    private ISkuStock skuStock;

    @KafkaListener(topics = "${kafka.topic.user}", groupId = "${kafka.topic.group}", concurrency = "1")
    public void listener(ConsumerRecord<?, ?> record, Acknowledgment ack, @Header(KafkaHeaders.RECEIVED_TOPIC) String topic) {
        Optional<?> message = Optional.ofNullable(record.value());
        if (message.isPresent()) {
            Object msg = message.get();
            try {
                log.info("监听活动sku库存消耗为0消息 topic: {} message: {}", topic, msg);
                BaseEvent.EventMessage<Long> eventMessage = JSON.parseObject(String.valueOf(msg), new TypeReference<BaseEvent.EventMessage<Long>>() {
                }.getType());
                Long sku = eventMessage.getData();
                // 更新库存
                skuStock.clearActivitySkuStock(sku);
                // 清空队列 「此时就不需要延迟更新数据库记录了」
                skuStock.clearQueueValue();
                ack.acknowledge();
            } catch (Exception e) {
                log.error("监听活动sku库存消耗为0消息，消费失败 topic: {} message: {}", topic, msg);
                throw e;
            }
        }
    }


}
