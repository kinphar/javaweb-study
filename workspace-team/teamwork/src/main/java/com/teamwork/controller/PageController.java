package com.teamwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	
	@RequestMapping("/index.html")
	public String toHomePage() {
		return "redirect:task/task_list";
	}
	

}
