package com.dzc.trigger.listener;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.dzc.domain.activity.model.entity.SkuRechargeEntity;
import com.dzc.domain.activity.service.IRaffleActivityAccountQuotaService;
import com.dzc.domain.rebate.event.SendRebateMessageEvent;
import com.dzc.domain.rebate.model.valobj.RebateTypeVO;
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
 * @date 2024/8/1 22:07
 */

@Slf4j
@Component
public class RebateMessageCustomer {
    @Resource
    private IRaffleActivityAccountQuotaService raffleActivityAccountQuotaService;

    @KafkaListener(topics = "${kafka.topic.send_rebate}", groupId = "${kafka.topic.group}", concurrency = "1")
    public void listener(ConsumerRecord<?, ?> record, Acknowledgment ack, @Header(KafkaHeaders.RECEIVED_TOPIC) String topic){
        Optional<?> message = Optional.ofNullable(record.value());
        if (message.isPresent()) {
            Object msg = message.get();
            try {
                log.info("监听用户奖品发送消息 topic: {} message: {}", topic, msg);
                BaseEvent.EventMessage<SendRebateMessageEvent.RebateMessage> eventMessage = JSON.parseObject(String.valueOf(msg), new TypeReference<BaseEvent.EventMessage<SendRebateMessageEvent.RebateMessage>>() {
                }.getType());
                SendRebateMessageEvent.RebateMessage rebateMessage = eventMessage.getData();
                if (!RebateTypeVO.SKU.getCode().equals(rebateMessage.getRebateType())) {
                    log.info("监听用户行为返利消息 - 非sku奖励暂时不处理 topic: {} message: {}", topic, message);
                    return;
                }
                // 2. 入账奖励
                SkuRechargeEntity skuRechargeEntity = new SkuRechargeEntity();
                skuRechargeEntity.setUserId(rebateMessage.getUserId());
                skuRechargeEntity.setSku(Long.valueOf(rebateMessage.getRebateConfig()));
                skuRechargeEntity.setOutBusinessNo(rebateMessage.getBizId());
                raffleActivityAccountQuotaService.createOrder(skuRechargeEntity);

            } catch (Exception e) {
                log.error("监听用户奖品发送消息，消费失败 topic: {} message: {}", topic, msg);
                throw e;
            }
        }
    }
}
