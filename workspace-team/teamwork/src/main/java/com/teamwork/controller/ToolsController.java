package com.teamwork.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamwork.common.utils.TimeUtils;

@Controller
@RequestMapping("/tools")
public class ToolsController {
	
	@RequestMapping("/init")
	public String init(Model mode, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userInfo = (String) session.getAttribute("useremail");
		mode.addAttribute("userInfo", userInfo);
		
		long currentTimeStamp = System.currentTimeMillis() / 1000;
		String currentDate = TimeUtils.timeStamp2Date(currentTimeStamp + "", "yyyy/MM/dd HH:mm:ss");
		mode.addAttribute("currentTimeStamp", currentTimeStamp);
		mode.addAttribute("currentDate", currentDate);
		
		return "tools/tools_home";
	}
	
	@RequestMapping("/timestamp_convert")
	@ResponseBody
	public Map<String,Object> timeConvert(@RequestParam("timeStamp") String timeStamp) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("result", TimeUtils.timeStamp2Date(timeStamp, "yyyy/MM/dd HH:mm:ss"));
		return map;
	}	

}
