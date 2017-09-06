package com.teamwork.service;

public interface RabbitMqService {

	public void sendQueue(String exchange_key, String queue_key, Object object);
}
