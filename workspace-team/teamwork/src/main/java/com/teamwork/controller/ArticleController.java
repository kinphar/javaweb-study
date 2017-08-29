package com.teamwork.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamwork.common.utils.StringUtils;
import com.teamwork.pojo.Article;
import com.teamwork.pojo.User;
import com.teamwork.service.ArticleService;
import com.teamwork.service.UserService;

@Controller
@RequestMapping("/article")
public class ArticleController {
	
	@Autowired 
	private UserService userService;
	
	@Autowired
	private ArticleService articleService;
	

	@RequestMapping("/main")
	public String init(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String useremail = (String) session.getAttribute("useremail");
		model.addAttribute("userInfo", useremail);				
		
		//user login.
		User user = userService.getUserByEmail(useremail);
		model.addAttribute("userLogin", user);
		
		//nav bar, function category.
		model.addAttribute("cate", "article");
		
		//get article list.
		List<Article> articles = articleService.getArticleItemList();
		model.addAttribute("articles", articles);
		
		return "article/article_main";
	}
	
	@RequestMapping("/edit") 
	public String editArticle(Model model) {
		System.out.println("editArticle");
		Article article = new Article();
		model.addAttribute("article", article);
		return "article/editArticle";
	}
	
	@RequestMapping("/view/{articleId}")
	public String viewArticle(Model model, @PathVariable String articleId, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String useremail = (String) session.getAttribute("useremail");
		model.addAttribute("userInfo", useremail);				
		
		//user login.
		User user = userService.getUserByEmail(useremail);
		model.addAttribute("userLogin", user);
		
		//get article.
		Article article = articleService.getArticleById(articleId);
		model.addAttribute("article", article);
		return "article/viewArticle";
	}
	
	@RequestMapping("/save") 
	public String newArticle(@ModelAttribute Article article, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userLogin = (String) session.getAttribute("useremail");
		
		if (StringUtils.isEmpty(article.getId())) {	
			User user = userService.getUserByEmail(userLogin);			
			article.setAuthorName(user.getName());
			article.setCreateBy(userLogin);
			article.setUpdateBy(userLogin);
			articleService.createArticle(article);
		} else {
			article.setUpdateBy(userLogin);
			articleService.updateArticle(article);
		}
		return "redirect:main";
	}
 
}
