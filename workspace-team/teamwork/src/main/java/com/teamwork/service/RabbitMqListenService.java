package com.teamwork.service;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;

public class RabbitMqListenService implements MessageListener {
    public void onMessage(Message message) {
        System.out.println("消息消费者 = " + message.toString());
    }

}
