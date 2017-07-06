package com.teamwork.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {
	
	@RequestMapping("/hello")
	public ModelAndView hello() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("spring", "spring mvc");
		mv.setViewName("hello");
		return mv;
	}
	
	@RequestMapping("/blog")
	public ModelAndView blog() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("spring", "spring mvc");
		mv.setViewName("blog_index");
		return mv;
	}
	
	@RequestMapping("/test")
	public ModelAndView test() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("test");
		return mv;
	}
	
	@RequestMapping("/task")
	public ModelAndView task() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("task");
		return mv;
	}
	
	@RequestMapping("/activity")
	public ModelAndView activity() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("activity");
		return mv;
	}
	
	@RequestMapping("/knowledge")
	public ModelAndView knowledge() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("knowledge");
		return mv;
	}
	
	@RequestMapping("/information")
	public ModelAndView information() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("information");
		return mv;
	}
	
	@RequestMapping("/tool")
	public ModelAndView tool() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("tool");
		return mv;
	}

}
