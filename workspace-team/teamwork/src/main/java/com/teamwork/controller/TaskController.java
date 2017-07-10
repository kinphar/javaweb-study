package com.teamwork.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamwork.pojo.Project;
import com.teamwork.pojo.Task;
import com.teamwork.pojo.User;
import com.teamwork.service.ProjectService;
import com.teamwork.service.UserService;

@Controller
@RequestMapping("/task")
public class TaskController {
	
	@Autowired
	private ProjectService projectService;
	@Autowired
	private UserService userService;
	
	@RequestMapping("/task_list")
	public String listTasks(Model model) {
		System.out.println("task_list");
		
		List<Project> projects = projectService.getAllProject();
		for (Project project : projects) {
			System.out.println(project.getId() + ";" + project.getName() + ";" + project.getDescription());
		}
		
		List<User> users = userService.getAllUser();
		for (User user : users) {
			System.out.println("user name : " + user.getName());
		}
		
		model.addAttribute("projects", projects);		
		model.addAttribute("users", users);	
		model.addAttribute("task", new Task());
		return "TaskList";		
	}
	
	@RequestMapping("/task_save") 
	public String saveTask(@ModelAttribute Task task) {
		
		System.out.println(task.getDescription() + ";" + task.getProjectId() + ";" 
				+ task.getAssignTo() + ";" + task.getStatus() + ";" + task.getExceptFinishDate() + ";");
		return "";
	}
	


}
