package com.teamwork.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamwork.common.pojo.TaskQuery;
import com.teamwork.pojo.Project;
import com.teamwork.pojo.SysDict;
import com.teamwork.pojo.Task;
import com.teamwork.pojo.User;
import com.teamwork.service.MiscService;
import com.teamwork.service.ProjectService;
import com.teamwork.service.TaskService;
import com.teamwork.service.UserService;

@Controller
@RequestMapping("/task")
public class TaskController {
	
	@Autowired
	private ProjectService projectService;
	@Autowired
	private UserService userService;
	@Autowired
	private MiscService miscService;
	@Autowired
	private TaskService taskService;
	
	@RequestMapping("/task_list")
	public String listTasks(Model model, @ModelAttribute TaskQuery taskQuery) {
		System.out.println("---Request--- : task_list");
		
		List<Project> projects = projectService.getAllProject();
		List<User> users = userService.getAllUser();
		List<SysDict> dicts = miscService.getTaskStatusDict();
		List<Task> tasks = taskService.getAllTask();		
			
		// query part start.
		if (taskQuery.getQueryProject() != null && taskQuery.getQueryTask() != null) {
			System.out.print("条件：项目-" + taskQuery.getQueryProject().getName() 
					+ ";处理人-" + taskQuery.getQueryTask().getAssignTo());
		}
				
		taskQuery.setSelectProjects(projects);
		Project allProject = new Project();
		allProject.setId("10000");
		allProject.setName("所有项目");
		allProject.setCreateBy("admin");		
		taskQuery.getSelectProjects().add(0, allProject);
		
		taskQuery.setSelectUsers(users);
		User allUser = new User();
		allUser.setId("10000");
		allUser.setName("所有人");
		allUser.setCreateBy("admin");
		taskQuery.getSelectUsers().add(0, allUser);		
		// query part end.
				
				
		model.addAttribute("users", users);	
		model.addAttribute("statuses", dicts);	
		model.addAttribute("projects", projects);		
		model.addAttribute("tasks", tasks);
		model.addAttribute("task", new Task());
		model.addAttribute("taskQuery", taskQuery);		
		
		return "TaskList";		
	}
	
	@RequestMapping("/task_save") 
	public String saveTask(@ModelAttribute Task task) {
		System.out.println("---Request--- : task_save");
		System.out.println("描述：" + task.getDescription() 
				+ "; 项目id：" + task.getProjectName()
				+ "; 分配给：" + task.getAssignTo() 
				+ "; 状态：" + task.getStatus() 
				+ "; 到期时间：" + task.getExpectFinishDate());
		
		taskService.createTask(task);
		return "redirect:task_list";
	}
}
