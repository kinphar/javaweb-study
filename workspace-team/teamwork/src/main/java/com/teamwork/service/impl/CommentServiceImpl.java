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
	public FriendlyResult deleteCommentById(Long id, String userOpt) {
		//logic delete.
		CommentExample example = new CommentExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andIdEqualTo(id);		
		
		Comment comment = new Comment();
		comment.setDelFlag("1");		
		comment.setUpdateBy(userOpt);
		comment.setUpdateDate(new Date());
		commentMapper.updateByExampleSelective(comment, example);
		
		deleteRelatedComment(id, userOpt);
		return FriendlyResult.ok();
	}
	
	//递归删除所有关联评论。
	private void deleteRelatedComment(Long previousId, String user) {
		CommentExample example = new CommentExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andPreviousIdEqualTo(previousId);		
		List<Comment> comments = commentMapper.selectByExample(example);		
		
		for (Comment comment : comments) {			
			comment.setDelFlag("1");
			comment.setUpdateBy(user);
			comment.setUpdateDate(new Date());
			commentMapper.updateByPrimaryKeySelective(comment);
			
			deleteRelatedComment(comment.getId(), user);
		}
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

	@Override
	public Comment getCommentById(Long id) {
		return commentMapper.selectByPrimaryKey(id);
	}

}
