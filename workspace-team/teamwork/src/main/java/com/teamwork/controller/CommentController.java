package com.teamwork.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamwork.pojo.Comment;
import com.teamwork.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService commentService;

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	@ResponseBody
	public Comment createComment(Comment comment, HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("useremail");
		comment.setCreateBy(userId);
		comment.setUpdateBy(userId);
		Comment newComment = commentService.createComment(comment);
		return newComment;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteComment(@RequestParam("commentid") Long id, HttpServletRequest request) {
		System.out.println("deleteComment:" + id);
		commentService.deleteCommentById(id);		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "ok");
		return map;
	}
	
	@RequestMapping("/get")
	@ResponseBody
	public List<Comment> getComments(@RequestParam("taskid") String taskId) {
		List<Comment> comments = commentService.getCommentByParentId(taskId);
		return comments;
	}

}
