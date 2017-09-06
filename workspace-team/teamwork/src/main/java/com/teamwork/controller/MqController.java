package com.teamwork.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamwork.service.RabbitMqService;

@Controller
public class MqController {
	@Autowired
	private RabbitMqService mqService;
	@Value("${mq.queue}")
    private String queueId;
	
	@RequestMapping("/mqtest") 
	@ResponseBody
	public String test() {
		try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("data", "hello rabbitmq");
            mqService.sendQueue(queueId + "_exchange", queueId + "_patt", map);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "send ok!";
	}
	

}
