package com.teamwork.service;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.pojo.Comment;

public interface CommentService {
	FriendlyResult deleteCommentById(Long id);
	FriendlyResult createComment(Comment comment);
}
