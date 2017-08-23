package com.teamwork.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/information")
public class InformationController {
	@RequestMapping("/main")
	public String init(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userInfo = (String) session.getAttribute("useremail");
		model.addAttribute("userInfo", userInfo);
		
		//导航分类
		model.addAttribute("cate", "information");
		
		return "information/information_main";
	}
}
