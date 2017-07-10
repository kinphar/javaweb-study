package com.teamwork.test.mybatis;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.teamwork.mapper.ProjectMapper;
import com.teamwork.mapper.TaskMapper;
import com.teamwork.mapper.UserMapper;
import com.teamwork.pojo.Project;
import com.teamwork.pojo.Task;
import com.teamwork.pojo.TaskExample;
import com.teamwork.pojo.User;

public class TestMybatis {
	
	@Test	
	public void testCreateTask() {
		//创建一个 spring 容器
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
		//从spring容器中获得 mapper 的代理对象
		TaskMapper mapper = applicationContext.getBean(TaskMapper.class);
				
		Task task = new Task();
		task.setId("10086");
		task.setCreateBy("dqf");
		task.setCreateDate(new Date());
		task.setDescription("test task.");
		mapper.insert(task);
	}
	
	@Test	
	public void testCreateProject() {
		//创建一个 spring 容器
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
		//从spring容器中获得 mapper 的代理对象
		ProjectMapper mapper = applicationContext.getBean(ProjectMapper.class);
				
		Project project = new Project();
		project.setId("100");
		project.setName("T91R");
		project.setCreateBy("dqf");
		project.setCreateDate(new Date());
		project.setDescription("first project");
		mapper.insert(project);

	}
	
	@Test	
	public void testCreateUser() {
		//创建一个 spring 容器
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
		//从spring容器中获得 mapper 的代理对象
		UserMapper mapper = applicationContext.getBean(UserMapper.class);
		
		User user = new User();
		int id = 1000;
		
		user.setId(id++ + "");
		user.setName("丁庆发");
		user.setEmail("dingqingfa@star-net.cn");
		user.setPassword("dingqingfa");
		user.setNo("T10316");
		mapper.insert(user);
	}
	
	@Test	
	public void testPageHelper() {
		//创建一个 spring 容器
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
		//从spring容器中获得 mapper 的代理对象
		TaskMapper mapper = applicationContext.getBean(TaskMapper.class);
		//执行查询，并分页。
		TaskExample example = new TaskExample();
		//分页处理
		PageHelper.startPage(2,  30);
		
		List<Task> list = mapper.selectByExample(example);
		for (Task task : list) {
			System.out.println(task.getDescription());
		}
		
		//取分页信息
		PageInfo<Task> pageInfo = new PageInfo<>(list);
		long total = pageInfo.getTotal();
		System.out.println("共有商品：" + total);
		
	}

}
