package com.teamwork.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamwork.common.pojo.EmailContent;
import com.teamwork.common.pojo.TaskQuery;
import com.teamwork.common.utils.ExcelUtil;
import com.teamwork.pojo.Comment;
import com.teamwork.pojo.Project;
import com.teamwork.pojo.Subtask;
import com.teamwork.pojo.SysDict;
import com.teamwork.pojo.Task;
import com.teamwork.pojo.User;
import com.teamwork.service.CommentService;
import com.teamwork.service.EmailService;
import com.teamwork.service.MiscService;
import com.teamwork.service.ProjectService;
import com.teamwork.service.SubtaskService;
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
	private SubtaskService subtaskService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private CommentService commentService;
	
	@RequestMapping("/list")
	public String listTasks(Model model, @ModelAttribute TaskQuery taskQuery, HttpServletRequest request) {
		List<Project> projects = projectService.getAllProject();
		List<User> users = userService.getAllUser();
		List<SysDict> dicts = miscService.getTaskStatusDict();				
							
		taskQuery.setSelectProjects(projects);
		taskQuery.setSelectUsers(users);
								
		model.addAttribute("users", users);	
		model.addAttribute("statuses", dicts);	
		model.addAttribute("projects", projects);						
		model.addAttribute("taskQuery", taskQuery);		
		
		if (taskQuery.getQueryTask() == null) {
			Task task = new Task();
			task.setStatus("10002");			
			taskQuery.setQueryTask(task);
		}
		List<Task> tasks = taskService.getTaskByFilter(taskQuery);		
		model.addAttribute("tasks", tasks);
		
		//new task form
		Task newTask = new Task();
		model.addAttribute("newTask", newTask);
		
		//new project form
		Project newProject = new Project();
		model.addAttribute("newProject", newProject);
		
		//返回任务状态，用于高亮对应的状态tab
		String statusFilter = taskQuery.getQueryTask().getStatus();
		model.addAttribute("statusFilter", statusFilter);		

		//任务数量
		model.addAttribute("number", taskService.getTaskNumByFilter(taskQuery));  
		
		//从session中读取账户信息
		HttpSession session = request.getSession();
		String userInfo = (String) session.getAttribute("useremail");
		model.addAttribute("userInfo", userInfo);
		
		//导航分类
		model.addAttribute("cate", "task");
						
		return "TaskList";		
	}
	
	@RequestMapping("/new") 
	public String newTask(@ModelAttribute Task newTask, HttpServletRequest request) {
		taskService.createTask(newTask);
		newTaskEmail(newTask);
		addNewTaskComment(newTask, request);		
		
		return "redirect:list";
	}
	
	private void addNewTaskComment(Task task, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userLogin = (String) session.getAttribute("useremail");
		Date dateNow = new Date();
		
		Comment comment = new Comment();			
		comment.setParentId(task.getId());
		comment.setCreateBy(userLogin);
		comment.setUpdateBy(userLogin);
		comment.setUpdateDate(dateNow);
		comment.setCreateDate(dateNow);
		comment.setCategory("task");
		comment.setDescription("创建了这个任务。" + " --automatic generation--");
		commentService.createComment(comment);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String,Object> deleteTask(@RequestParam("taskid") String taskid) {
		taskService.deleteTaskById(taskid);
		subtaskService.deleteSubtaskByParentId(taskid);
		
		String status = taskService.getTaskStatusById(taskid);
		int num = taskService.getTaskNumByStatus(status);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", taskid);
		map.put("status", status);
		map.put("statusNum", num);
		return map;
	}
	
	@RequestMapping("/get")
	@ResponseBody
	public Task getTask(@RequestParam("taskid") String taskid) {
		Task task = taskService.getTaskById(taskid);
		return task;
	}
	
	@RequestMapping("/get_subtask")
	@ResponseBody
	public List<Subtask> getSubtask(@RequestParam("taskid") String taskid) {
		List<Subtask> list = subtaskService.getSubtaskByParentId(taskid);
		System.out.println("checklist.num=" + list.size());
		return list;
	}
		
	@RequestMapping("/export/{taskId}")
    public String exportTask(@PathVariable String taskId, HttpServletRequest request,HttpServletResponse response) throws IOException{
        String fileName = taskId + "-任务数据";
        
        //填充projects数据
        List<Map<String,Object>> mapList = createExcelRecord(taskId);
        String columnNames[] = {"任务ID", "标题", "内容", "所属项目", "处理人", "期望完成时间", "实际完成时间", "处理说明", "软件链接"};//列名
        String keys[] = {"id", "title", "description", "projectName", "assignTo", "expectFinishDate", "realFinishDate", "finishInfo", "finishLink"};//map中的key
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        try {
            ExcelUtil.createTaskBook(mapList, keys,columnNames).write(os);
        } catch (IOException e) {
            e.printStackTrace();
        }
        byte[] content = os.toByteArray();
        InputStream is = new ByteArrayInputStream(content);
        
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="+ new String((fileName + ".xls").getBytes(), "iso-8859-1"));
        ServletOutputStream out = response.getOutputStream();
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            // Simple read/write loop.
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (final IOException e) {
            throw e;
        } finally {
            if (bis != null)
                bis.close();
            if (bos != null)
                bos.close();
        }
        return null;
    }
	
    private List<Map<String, Object>> createExcelRecord(String taskId) {    	
        List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
        
        //sheet name;
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("sheetName", "sheet1");
        listmap.add(map);
        
        //sheet data;
        Task task = taskService.getTaskById(taskId);
        Map<String, Object> mapValue = new HashMap<String, Object>();
        mapValue.put("id", task.getId());
        mapValue.put("title", task.getTitle());
        mapValue.put("description", task.getDescription());
        mapValue.put("projectName", task.getProjectName());
        mapValue.put("assignTo", task.getAssignTo());
        mapValue.put("expectFinishDate", task.getExpectFinishDate());
        mapValue.put("realFinishDate", task.getRealFinishDate());
        mapValue.put("finishInfo", task.getFinishInfo());
        mapValue.put("finishLink", task.getFinishLink());
        listmap.add(mapValue);

        return listmap;
    }
    
    private boolean newTaskEmail(Task task) {    	
    	EmailContent mail = new EmailContent();
    	
    	//title
    	mail.setSubject("收到一项新任务！"); 
    	
    	//receiver
    	String emailAddress = task.getAssignTo();
    	mail.setToEmails(emailAddress);
    	
    	//content
    	StringBuilder builder = new StringBuilder();
        builder.append("<html><body>" + "您好！任务详情如下：<br /><br />");
        builder.append("&nbsp&nbsp&nbsp&nbsp任务标题：" + task.getTitle() +"<br />");
        String desc = task.getDescription();
        System.out.println(desc);
        desc = desc.replace("<br />", "");
        System.out.println(desc);
        builder.append("&nbsp&nbsp&nbsp&nbsp任务内容：" + desc + "<br /><br />");
        builder.append("&nbsp&nbsp&nbsp&nbsp 您可以<a href=" + "http://localhost:8684/task/list" + ">进入 Zoo Party 查看详情</a>（登录账号：邮箱地址，初始密码：工号）<br /><br />");
        builder.append("</body></html>");
        String content = builder.toString();        
        mail.setContent(content);
                
        //do send
        emailService.sendEmail(mail);
    	return true;
    }
    
    @RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> UpdateTask(Task task) {
    	taskService.updateTask(task);	
    	
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("result", "ok");
		return map;
	}	

    @RequestMapping(value = "/updateSubTask", method = RequestMethod.POST)
	@ResponseBody
	public Subtask subTaskUpdate(Subtask subTask) {    	
    	System.out.println("updateSubTask:" + subTask.getParentId() 
    		+ ";" + subTask.getId() + ";status=" + subTask.getStatus() 
    		+ ";" + subTask.getDescription());    	
    	
    	Subtask subtask = subtaskService.updateSubtask(subTask);    	
		return subtask;
	}	
    
    @RequestMapping(value = "/deleteSubTask", method = RequestMethod.POST)
  	@ResponseBody
  	public Map<String,Object> subTaskDelete(Subtask subTask) {
      	subtaskService.deleteSubtaskById(subTask.getId());    	
      	System.out.println("checkListDelete:" + subTask.getId());
      	
  		Map<String,Object> map = new HashMap<String,Object>();
  		map.put("result", "ok");
  		return map;
  	}	
}





