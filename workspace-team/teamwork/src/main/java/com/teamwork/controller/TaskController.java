package com.teamwork.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamwork.pojo.Project;
import com.teamwork.pojo.Task;
import com.teamwork.service.ProjectService;

@Controller
@RequestMapping("/task")
public class TaskController {
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("/task_list")
	public String listTasks(Model model) {
		System.out.println("task_list");
		
		List<Project> projects = projectService.getAllProject();
		for (Project project : projects) {
			System.out.println(project.getId() + ";" + project.getName() + ";" + project.getDescription());
		}
		
		model.addAttribute("task", new Task());
		return "TaskList";		
	}
	
	@RequestMapping("/task_save") 
	public String saveTask(@ModelAttribute Task task) {
		
		System.out.println(task.getDescription() + ";" + task.getProjectId() + ";" 
				+ task.getCreateBy() + ";" + task.getExceptFinishDate());
		return "";
	}
	


}
