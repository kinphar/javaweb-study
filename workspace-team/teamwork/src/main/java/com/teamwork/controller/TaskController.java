package com.teamwork.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
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
		model.addAttribute("newTaskInfo", newTaskInfo);
		
		//返回任务状态，用于高亮对应的状态tab
		String statusFilter = null;
		if (taskQuery.getQueryTask() == null) {
			statusFilter = "all";
		} else {
			statusFilter = taskQuery.getQueryTask().getStatus();
		}
		model.addAttribute("statusFilter", statusFilter);		

		//任务数量
		model.addAttribute("number", taskService.getTaskNumByFilter(taskQuery));  
				
		return "TaskList";		
	}
	
	@RequestMapping("/task_save") 
	public String saveTask(@ModelAttribute NewTaskInfo newTaskInfo) {
		Task task = newTaskInfo.getTask();
		String taskId = task.getId();
		if (StringUtils.isBlank(taskId)) {
			taskService.createTask(task);
		} else {
			taskService.updateTask(task);			
		}
		
		List<TaskCheckList> list = newTaskInfo.getCheckList();
		if (list != null && list.size() > 0) {
			taskCheckListService.updateCheckLists(list, task.getId());
		}
		
		return "redirect:task_list";
	}
	
	@RequestMapping("/task_delete")
	@ResponseBody
	public Map<String,Object> deleteTask(@RequestParam("taskid") String taskid) {
		taskService.deleteTaskById(taskid);
		taskCheckListService.deleteCheckListByParentId(taskid);
		
		String status = taskService.getTaskStatusById(taskid);
		int numCur = taskService.getTaskNumByStatus(status);
		int numAll = taskService.getTaskNumByStatus("all");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", taskid);
		map.put("statusCur", status);
		map.put("numCur", numCur);
		map.put("numAll", numAll);
		return map;
	}
	
	@RequestMapping("/task_get")
	@ResponseBody
	public Task getTask(@RequestParam("taskid") String taskid) {
		Task task = taskService.getTaskById(taskid);
		return task;
	}
	
	@RequestMapping("/task_get_checklist")
	@ResponseBody
	public List<TaskCheckList> getTaskCheckList(@RequestParam("taskid") String taskid) {
		List<TaskCheckList> list = taskCheckListService.getCheckListByParentId(taskid);
		System.out.println("checklist.num=" + list.size());
		return list;
	}
	
}
