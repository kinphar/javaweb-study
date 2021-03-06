package com.teamwork.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamwork.pojo.User;
import com.teamwork.service.UserService;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(Model model, String redirect) throws Exception{
		System.out.println("redirect:" + redirect);
		model.addAttribute("redirectUrl", redirect);
		return "account/login";
	}
	
	@RequestMapping("/dologin")
	public String doLogin(String email, String password, String redirectUrl,
			HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		List<User> users = userService.getUserByEmailAndPassword(email, password);
		if (users != null && users.size() == 1) {
			session.setAttribute("useremail", email);
			if (!StringUtils.isBlank(redirectUrl)) {
				return "redirect:" + redirectUrl;
			} else {
				return "redirect:/task/list";
			}			
		} else {
			return "redirect:/account/login";
		}		
	}
	
	@RequestMapping("/dologout")
	public String doLogout(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		session.removeAttribute("useremail");
		return "redirect:/account/login";
	}

}
