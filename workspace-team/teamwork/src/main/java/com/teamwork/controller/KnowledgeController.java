package com.teamwork.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamwork.pojo.User;
import com.teamwork.service.UserService;

@Controller
@RequestMapping("/knowledge")
public class KnowledgeController {
	
	@Autowired UserService userService;

	@RequestMapping("/main")
	public String init(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String useremail = (String) session.getAttribute("useremail");
		model.addAttribute("userInfo", useremail);				
		
		//user login.
		User user = userService.getUserByEmail(useremail);
		model.addAttribute("userLogin", user);
		
		//nav bar, function category.
		model.addAttribute("cate", "knowledge");
		
		return "knowledge/knowledge_main";
	}
	
	@RequestMapping("/new") 
	public String newArticle(Model model) {
		System.out.println("newArticle");
		return "knowledge/writeArticle";
	}
 
}
