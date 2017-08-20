package com.teamwork.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.common.utils.IDUtils;
import com.teamwork.mapper.CommentMapper;
import com.teamwork.pojo.Comment;
import com.teamwork.pojo.CommentExample;
import com.teamwork.pojo.CommentExample.Criteria;
import com.teamwork.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentMapper commentMapper;

	@Override
	public FriendlyResult deleteCommentById(Long id) {
		//logic delete.
		CommentExample example = new CommentExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andIdEqualTo(id);		
		Comment comment = new Comment();
		comment.setDelFlag("1");		
		commentMapper.updateByExampleSelective(comment, example);
		return FriendlyResult.ok();
	}
	
	@Override
	public Comment createComment(Comment comment) {
		Long id = IDUtils.getIdByTimeStamp();
		comment.setId(id);
		Date date = new Date();
		comment.setCreateDate(date);
		comment.setUpdateDate(date);
		comment.setDelFlag("0");
		commentMapper.insert(comment);
		
		return comment;
	}

	@Override
	public List<Comment> getCommentByParentId(String id) {
		CommentExample example = new CommentExample();
		example.createCriteria().andParentIdEqualTo(id).andDelFlagEqualTo("0");
		return commentMapper.selectByExample(example);
	}

}
