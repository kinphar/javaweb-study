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

import com.teamwork.common.pojo.EmailContent;
import com.teamwork.pojo.Article;
import com.teamwork.pojo.Comment;
import com.teamwork.pojo.User;
import com.teamwork.service.ArticleService;
import com.teamwork.service.CommentService;
import com.teamwork.service.EmailService;
import com.teamwork.service.UserService;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService commentService;	
	@Autowired
	private UserService userService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private ArticleService articleService;

	@RequestMapping(value = "/new", method = RequestMethod.POST)
	@ResponseBody
	public Comment createComment(Comment comment, HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		String userEmail = (String) session.getAttribute("useremail");
		User user = userService.getUserByEmail(userEmail);
		
		comment.setAuthorName(user.getName());
		comment.setAuthorPhoto(user.getPhoto());
		comment.setCreateBy(userEmail);
		comment.setUpdateBy(userEmail);
		Comment newComment = commentService.createComment(comment);
		
		if (newComment.getCategory().equals("article")) {
			String articleUrl = getArticleUrlByComment(newComment, request);			
			if (newComment.getPreviousId() != null) {
				replayCommentSendEmail(newComment, articleUrl);
			}
			
			newCommentSendEmail(newComment, articleUrl);
		}
		return newComment;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteComment(@RequestParam("commentid") Long id, HttpServletRequest request) {
		System.out.println("deleteComment:" + id);
		HttpSession session = request.getSession();
		String userLogin = (String) session.getAttribute("useremail");
		commentService.deleteCommentById(id, userLogin);		
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
	
	private boolean newCommentSendEmail(Comment newComment, String articleUrl) {    		
		// article author.
    	Article article = articleService.getArticleById(newComment.getParentId());
    	String articleAuthor = article.getCreateBy();
    	
    	// give up send email if article author is comment author.
    	if (article.getCreateBy().equals(newComment.getCreateBy())) {
    		return false;
    	}
    	
    	// only send reply email if article author is bereplied comment author.
    	if (newComment.getPreviousId() != null) {
	    	Comment beReplyComment = commentService.getCommentById(newComment.getPreviousId());
	    	String beReplayAuthor = beReplyComment.getCreateBy();
	    	if (articleAuthor.equals(beReplayAuthor)) {
	    		return false;
	    	}
    	}
    	    	
    	EmailContent mail = new EmailContent();
    	
    	//title.
    	mail.setSubject(newComment.getAuthorName() + " 评论了你的文章！"); 
    	    	
    	//receiver.
    	String emailAddress = articleAuthor;
    	mail.setToEmails(emailAddress);
    	System.out.println("newCommentSendEmail:" + emailAddress);
    	
    	//content
    	StringBuilder builder = new StringBuilder();
        builder.append("<html><body>" + "Hi!<br /><br />");
        builder.append("&nbsp&nbsp&nbsp&nbsp" + newComment.getAuthorName() + " 在你的文章<strong>《" + article.getTitle() + "》</strong>中发表了评论。<br />");
        builder.append("&nbsp&nbsp&nbsp&nbsp 你可以<a href=" + articleUrl + "> 点这里去看看写了什么， </a>（登录账号：办公邮箱，初始密码：工号）<br /><br />");
        builder.append("</body></html>");
        String content = builder.toString();        
        mail.setContent(content);
                
        //do send
        emailService.sendEmail(mail);
    	return true;
    }
	
	private boolean replayCommentSendEmail(Comment replyComment, String articleUrl) {    	
    	EmailContent mail = new EmailContent();
    	
    	//title
    	mail.setSubject(replyComment.getAuthorName() + " 回复了你的评论！"); 
    	
    	//article author.
    	Article article = articleService.getArticleById(replyComment.getParentId());
    	    	
    	//receiver
    	Comment beReplyComment = commentService.getCommentById(replyComment.getPreviousId());
    	String emailAddress = beReplyComment.getCreateBy();
    	mail.setToEmails(emailAddress);
    	System.out.println("replayCommentSendEmail:" + emailAddress);
    	
    	//content
    	StringBuilder builder = new StringBuilder();
        builder.append("<html><body>" + "Hi!<br /><br />");
        builder.append("&nbsp&nbsp&nbsp&nbsp" + article.getAuthorName() + " 在文章<strong>《" + article.getTitle() + "》</strong>中回复了你的评论。<br />");
        builder.append("&nbsp&nbsp&nbsp&nbsp 你可以<a href=" + articleUrl + "> 点这里去看看写了什么， </a>（登录账号：办公邮箱，初始密码：工号）<br /><br />");
        builder.append("</body></html>");
        String content = builder.toString();        
        mail.setContent(content);
                
        //do send
        emailService.sendEmail(mail);
    	return true;
    }
	
	private String getArticleUrlByComment(Comment comment, HttpServletRequest request) {
		String url = "http://" + request.getServerName() + ":" + request.getServerPort() 
			+ "/article/view/" + comment.getParentId();  
		
		return url;
	}

}
