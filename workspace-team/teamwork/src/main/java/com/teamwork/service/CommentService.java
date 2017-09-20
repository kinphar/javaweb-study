package com.teamwork.service;

import java.util.List;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.pojo.Comment;

public interface CommentService {
	FriendlyResult deleteCommentById(Long id, String userOpt);
	Comment createComment(Comment comment);
	List<Comment> getCommentByParentId(String id);
	Comment getCommentById(Long id);
}
