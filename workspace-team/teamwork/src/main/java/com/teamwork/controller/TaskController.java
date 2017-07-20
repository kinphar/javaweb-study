package com.teamwork.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamwork.common.pojo.NewTaskInfo;
import com.teamwork.common.pojo.TaskQuery;
import com.teamwork.pojo.Project;
import com.teamwork.pojo.SysDict;
import com.teamwork.pojo.Task;
import com.teamwork.pojo.TaskCheckList;
import com.teamwork.pojo.User;
import com.teamwork.service.MiscService;
import com.teamwork.service.ProjectService;
import com.teamwork.service.TaskCheckListService;
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
	@Autowired
	private TaskCheckListService taskCheckListService;
	
	@RequestMapping("/task_list")
	public String listTasks(Model model, @ModelAttribute TaskQuery taskQuery) {
		System.out.println("---Request--- : task_list");
		
		List<Project> projects = projectService.getAllProject();
		List<User> users = userService.getAllUser();
		List<SysDict> dicts = miscService.getTaskStatusDict();				
							
		taskQuery.setSelectProjects(projects);
		taskQuery.setSelectUsers(users);
								
		model.addAttribute("users", users);	
		model.addAttribute("statuses", dicts);	
		model.addAttribute("projects", projects);						
		model.addAttribute("taskQuery", taskQuery);		
		
		List<Task> tasks = taskService.getTaskByFilter(taskQuery);
		model.addAttribute("tasks", tasks);
		
		NewTaskInfo newTaskInfo = new NewTaskInfo();
		newTaskInfo.setTask(tasks.get(1));		
		model.addAttribute("newTaskInfo", newTaskInfo);
		
		//任务检查项
		List<TaskCheckList> taskCheckList = taskCheckListService.getCheckListByTasks(tasks);
		model.addAttribute("taskCheckList", taskCheckList);	
		model.addAttribute("taskCheckListSize", taskCheckList.size());	
		
		//返回任务状态，用于显示对于的状态tab
		String statusFilter = null;
		if (taskQuery.getQueryTask() == null) {
			statusFilter = "all";
		} else {
			statusFilter = taskQuery.getQueryTask().getStatus();
		}
		model.addAttribute("statusFilter", statusFilter);
				
		return "TaskList";		
	}
	
	@RequestMapping("/task_save") 
	public String saveTask(@ModelAttribute NewTaskInfo newTaskInfo) {
		taskService.createTask(newTaskInfo);
		return "redirect:task_list";
	}
	
	@RequestMapping("/task_delete")
	@ResponseBody
	public String deleteTask(@RequestParam("taskid") String taskid) {
		taskService.deleteTask(taskid);
		return taskid;
	}
	
	@RequestMapping("/task_edit")
	public String editTask(Model model) {
		return "taskForm";
	}
	
	@RequestMapping("/task_update")
	public void updateTask(HttpServletRequest request) {
		System.out.println(request.getParameter("content"));
	}
}
