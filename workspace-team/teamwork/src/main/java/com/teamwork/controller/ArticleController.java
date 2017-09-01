package com.teamwork.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamwork.common.pojo.EmailContent;
import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.common.utils.StringUtils;
import com.teamwork.pojo.Article;
import com.teamwork.pojo.SysDict;
import com.teamwork.pojo.User;
import com.teamwork.service.ArticleService;
import com.teamwork.service.EmailService;
import com.teamwork.service.SysDictService;
import com.teamwork.service.UserService;

@Controller
@RequestMapping("/article")
public class ArticleController {
	
	@Autowired 
	private UserService userService;	
	@Autowired
	private ArticleService articleService;	
	@Autowired
	private SysDictService sysDictService;  
	@Autowired
	private EmailService emailService;
	
	@RequestMapping("/list")
	public String listRedirect() {
		return "redirect:/article/allauthor/allcate/publish";
	}
	
	@RequestMapping("/{author}/{category}/{status}")
	public String list(Model model, HttpServletRequest request, 
			@PathVariable String author, @PathVariable String category, @PathVariable String status) {
		HttpSession session = request.getSession();
		String useremail = (String) session.getAttribute("useremail");
		model.addAttribute("userInfo", useremail);				
		
		//user login.
		User user = userService.getUserByEmail(useremail);
		model.addAttribute("userLogin", user);
		
		//nav bar, function category.
		model.addAttribute("cate", "article");
		
		//article category
		Map<String,Object> categoryMap = getArticleCategory("article_category_" + "%");
		model.addAttribute("categoryMap", categoryMap);
		
		//user article.
		int publishNum = articleService.getUserArticleNumByStatus(useremail, "publish");
		model.addAttribute("publishNum", publishNum);
		int draftNum = articleService.getUserArticleNumByStatus(useremail, "draft");
		model.addAttribute("draftNum", draftNum);		
		
		//get article list.
		List<Article> articles = articleService.getArticleListWithFilter(author, category, status);
		Collections.reverse(articles);
		model.addAttribute("articles", articles);
		
		return "article/article-list";
	}
	
	@RequestMapping("/edit/{articleid}") 
	public String editArticle(Model model, @PathVariable String articleid) {		
		
		Article article = null;
		if (articleid.equals("new")) {
			article = new Article();
			article.setAccess("private");
		} else {
			article = articleService.getArticleById(articleid);
		}
		model.addAttribute("article", article);
		
		//种类
		List<SysDict> category_platform = 
				sysDictService.getDictLikeSort("article_category_platform");
		model.addAttribute("category_platform", category_platform);		
		List<SysDict> category_language = 
				sysDictService.getDictLikeSort("article_category_language");
		model.addAttribute("category_language", category_language);
		List<SysDict> category_system = 
				sysDictService.getDictLikeSort("article_category_system");
		model.addAttribute("category_system", category_system);
		
		return "article/article-edit";
	}
	
	@RequestMapping("/view/{articleId}")
	public String viewArticle(Model model, @PathVariable String articleId, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String useremail = (String) session.getAttribute("useremail");
		model.addAttribute("userInfo", useremail);				
		
		//user login.
		User user = userService.getUserByEmail(useremail);
		model.addAttribute("userLogin", user);
		
		//article category
		Map<String,Object> categoryMap = getArticleCategory("article_category_" + "%");
		model.addAttribute("categoryMap", categoryMap);
		
		//get article.
		Article article = articleService.getArticleById(articleId);
		model.addAttribute("article", article);
		
		//user article.
		int publishNum = articleService.getUserArticleNumByStatus(useremail, "publish");
		model.addAttribute("publishNum", publishNum);
		int draftNum = articleService.getUserArticleNumByStatus(useremail, "draft");
		model.addAttribute("draftNum", draftNum);	
		
		//increase view time.
		articleService.increaseArticleViewTime(articleId);
		return "article/article-view";
	}
	
	@RequestMapping("/save") 
	public String newArticle(@ModelAttribute Article article, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userLogin = (String) session.getAttribute("useremail");
		
		
		System.out.println("id:" + article.getId());
		
		if (StringUtils.isEmpty(article.getId())) {	
			User user = userService.getUserByEmail(userLogin);			
			article.setAuthorName(user.getName());
			article.setCreateBy(userLogin);
			article.setUpdateBy(userLogin);
			articleService.createArticle(article);
			
			String articleUrl = getArticleUrl(request, article.getId());
			newArticleEmail(article, articleUrl);
		} else {
			article.setUpdateBy(userLogin);
			articleService.updateArticle(article);
		}
		return "redirect:allauthor/allcate/publish";
	}
	
	@RequestMapping("/delete/{articleId}")
	public String deleteArticle(Model model, @PathVariable String articleId, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String useremail = (String) session.getAttribute("useremail");
		
		Article articleDel = new Article();
		articleDel.setId(articleId);
		articleDel.setUpdateBy(useremail);
		articleService.deleteArticle(articleDel);

		return "redirect:/article/allauthor/allcate/publish";
	}
	
	private Map<String,Object> getArticleCategory(String sort) {
		List<SysDict> categories = sysDictService.getDictLikeSort(sort);
		Map<String,Object> map =  new LinkedHashMap<String,Object>();
		for (SysDict dict : categories) {
			int count = articleService.getArticleNumByCategory(dict.getName());
			map.put(dict.getName(), count);
		}
		return map;
	}
	
	@RequestMapping("/thumbup")
	@ResponseBody
	public Map<String,Object> thumbUp(@RequestParam("articleid") String articleId) {
		FriendlyResult result = articleService.increaseArticleThumbUpTime(articleId);
		String time = result.getData().toString();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("time", time);
		return map;
	}
	
	private boolean newArticleEmail(Article article, String url) {    	
    	EmailContent mail = new EmailContent();
    	
    	//title
    	mail.setSubject(article.getAuthorName() + " 撰文一篇！"); 
    	
    	//receiver
    	String emailAddress = "dingqingfa@star-net.cn;253876774@qq.com";
    	mail.setToEmails(emailAddress);
    	
    	//content
    	StringBuilder builder = new StringBuilder();
        builder.append("<html><body>" + "Hi!<br /><br />");
        builder.append("&nbsp&nbsp&nbsp&nbsp" + article.getAuthorName() + " 分享了一篇名为<strong>《" + article.getTitle() + "》</strong>的文章。<br />");
        builder.append("&nbsp&nbsp&nbsp&nbsp 你可以<a href=" + url + "> 点这里去看看写了什么， </a>（登录账号：办公邮箱，初始密码：工号）<br /><br />");
        builder.append("</body></html>");
        String content = builder.toString();        
        mail.setContent(content);
                
        //do send
        emailService.sendEmail(mail);
    	return true;
    }
	
	private String getArticleUrl(HttpServletRequest request, String id) {
		String url = "http://" + request.getServerName() + ":" + request.getServerPort() 
			+ "/article/view/" + id;
		return url;
	}
 
}
