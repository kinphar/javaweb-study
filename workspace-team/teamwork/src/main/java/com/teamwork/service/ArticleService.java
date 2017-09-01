package com.teamwork.service;

import java.util.List;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.pojo.Article;

public interface ArticleService {	
	FriendlyResult createArticle(Article article);
	FriendlyResult updateArticle(Article article);
	FriendlyResult deleteArticle(Article article);
	List<Article> getArticleListWithFilter(String author, String category, String status);
	Article getArticleById(String id);
	int getArticleNumByCategory(String cate);
	int getUserArticleNumByStatus(String user, String status);
	FriendlyResult increaseArticleViewTime(String id);
	FriendlyResult increaseArticleThumbUpTime(String id);
}
