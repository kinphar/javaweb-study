package com.teamwork.service;

import java.util.List;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.pojo.Article;

public interface ArticleService {
	
	FriendlyResult createArticle(Article article);
	FriendlyResult updateArticle(Article article);
	FriendlyResult deleteArticleById(String id);
	List<Article> getArticleItemList();
	Article getArticleById(String id);

}
