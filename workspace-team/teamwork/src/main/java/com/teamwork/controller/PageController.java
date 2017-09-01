package com.teamwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	
	@RequestMapping("/index.html")
	public String indexToDefaultPage() {
		return "redirect:/task/list";
	}
	
	@RequestMapping("/")
	public String rootToDefaultPage() {
		return "redirect:/task/list";
	}

}
