package com.teamwork.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.common.utils.IDUtils;
import com.teamwork.mapper.ArticleMapper;
import com.teamwork.pojo.Article;
import com.teamwork.pojo.ArticleExample;
import com.teamwork.pojo.ArticleExample.Criteria;
import com.teamwork.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
	private ArticleMapper articleMapper;

	@Override
	public FriendlyResult createArticle(Article article) {
		Date date = new Date();
		article.setId(IDUtils.genIdStartWith("A"));
		article.setCreateDate(date);
		article.setUpdateDate(date);
		article.setViewTime(0);
		article.setThumbUpTime(0);
		article.setDelFlag("0");
		article.setBrief(getAbstract(article.getDetail(), 300));
		articleMapper.insertSelective(article);
		return FriendlyResult.ok();
	}

	@Override
	public FriendlyResult updateArticle(Article article) {
		Date date = new Date();
		article.setUpdateDate(date);
		articleMapper.updateByPrimaryKeySelective(article);
		return FriendlyResult.ok();
	}
			
	@Override
	public FriendlyResult deleteArticleById(String id) {
		//logic delete.
		ArticleExample example = new ArticleExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andIdEqualTo(id);		
		Article article = new Article();
		article.setDelFlag("1");		
		articleMapper.updateByExampleSelective(article, example);
		return FriendlyResult.ok();
	}

	@Override
	public List<Article> getArticleListWithFilter(String author, String category, String status) {
		ArticleExample example = new ArticleExample();
		Criteria createCriteria = example.createCriteria();
		if (!author.equals("allauthor")) {
			createCriteria.andCreateByEqualTo(author);
		}
		if (!category.equals("allcate")) {
			createCriteria.andCategoryLike("%" + category + "%");
		}
		createCriteria.andStatusEqualTo(status);
		return (List<Article>) articleMapper.selectByExampleWithBLOBs(example);
	}
	
	/*
	 * 获取文章摘要，任意html，残缺不全也可以
     * <.*?>为正则表达式，其中的.表示任意字符，*?表示出现0次或0次以上，此方法可以去掉双头标签(双头针对于残缺的标签)
     * "<.*?"表示<尖括号后的所有字符，此方法可以去掉残缺的标签，及后面的内容
     * " "，若有多种此种字符，可用同一方法去除
     */
    private String getAbstract(String html, int length) {
        String brief = "";
        html = html.replaceAll("<.*?>", "  ").replaceAll(" ", " ");
        html = html.replaceAll("<.*?", "");
        if (html.length() > length) {
        	brief = html.substring(0, length);
        }        
        System.out.println("getAbstract:" + html.length() + " -> " + brief.length());
        return (brief + "...");
    }

	@Override
	public Article getArticleById(String id) {
		return articleMapper.selectByPrimaryKey(id);
	}

	@Override
	public int getArticleNumByCategory(String cate) {
		ArticleExample example = new ArticleExample();
		example.createCriteria().andCategoryLike("%" + cate + "%")
		.andStatusEqualTo("publish").andDelFlagNotEqualTo("1");
		return articleMapper.countByExample(example);
	}

	@Override
	public int getUserArticleNumByStatus(String user, String status) {
		ArticleExample example = new ArticleExample();
		example.createCriteria().andCreateByEqualTo(user).andStatusEqualTo(status)
			.andDelFlagNotEqualTo("1");;
		return articleMapper.countByExample(example);
	}

	@Override
	public FriendlyResult increaseArticleViewTime(String id) {
		Article article = articleMapper.selectByPrimaryKey(id);
		int viewTime = article.getViewTime();
		
		Article articleNew = new Article();
		articleNew.setId(id);
		articleNew.setViewTime(viewTime + 1);		
		articleMapper.updateByPrimaryKeySelective(articleNew);
		return FriendlyResult.ok();
	}

	@Override
	public FriendlyResult increaseArticleThumbUpTime(String id) {
		Article article = articleMapper.selectByPrimaryKey(id);
		int thumbUpTime = article.getThumbUpTime();
		
		Article articleNew = new Article();
		articleNew.setId(id);
		articleNew.setThumbUpTime(thumbUpTime + 1);		
		articleMapper.updateByPrimaryKeySelective(articleNew);
		return FriendlyResult.ok(thumbUpTime + 1);
	}
}
