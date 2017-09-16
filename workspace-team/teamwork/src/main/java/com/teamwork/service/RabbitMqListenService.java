package com.teamwork.service;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;

public class RabbitMqListenService implements MessageListener {
    public void onMessage(Message message) {
    	String newMsg = new String(message.getBody());    
        System.out.println("new message : " + newMsg);
    }

}
