package com.teamwork.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.pojo.Comment;
import com.teamwork.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired 
	private CommentService commentService;
	
	@RequestMapping(value = "/new", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createComment(Comment comment, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("useremail");
		comment.setCreateBy(userId);
		comment.setUpdateBy(userId);
		FriendlyResult result = commentService.createComment(comment);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("result", "ok");
		map.put("id", result.getData());
		return map;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteComment(@RequestParam("commentid") Long id, HttpServletRequest request) {
		commentService.deleteCommentById(id);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("result", "ok");
		return map;
	}

}


