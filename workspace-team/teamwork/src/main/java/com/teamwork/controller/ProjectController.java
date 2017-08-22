package com.teamwork.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamwork.pojo.Project;
import com.teamwork.service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {
	@Autowired ProjectService projectService;
	
	@RequestMapping("/new")
	public String newTask(@ModelAttribute Project newProject, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("useremail");
		newProject.setCreateBy(userId);
		newProject.setUpdateBy(userId);
		projectService.createProject(newProject);
		return "redirect:/task/list";
	}
}
