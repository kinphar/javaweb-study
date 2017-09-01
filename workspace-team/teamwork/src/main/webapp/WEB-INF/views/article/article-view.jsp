<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Zootopia</title>
<link rel="shortcut icon" href="/images/monkey.jpg">

<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/article.css" />
<script type="application/javascript" src="/js/jquery.min.js"></script>
<script type="application/javascript" src="/js/bootstrap.min.js"></script>

<script type="text/javascript">

function newArticle() {
	var url = "${ctx}/article/edit/new";
	window.open(url);
}	

</script>

</head>

<body>
	<%@ include file="../common/top_navbar.jsp"%>

	<div class="container theme-showcase" role="main">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="col-sm-2">
					<div class="widget-box">
						<div class="widget-title">
							<h5>Who</h5>
						</div>
						<div class="widget-content">
							<div style="text-align: center">
								<img class="img-round user-photo" src="${userLogin.photo}">
								<label>${userLogin.name}</label>
							</div>
							<hr />
							<div style="text-align: left; padding-left: 15px">
								<p>
									<span style="color: gray">撰文：</span>
									<a href="${ctx}/article/${userLogin.email}/allcate/publish">${publishNum}篇</a>
								</p>
								<p>
									<span style="color: gray">草稿：</span>
									<a href="${ctx}/article/${userLogin.email}/allcate/draft">${draftNum}篇</a>
								</p>
								<p>
									<span style="color: gray">等级：</span>白银
								</p>
							</div>
							<hr />
							<div style="text-align: center">
								<a href="#" class="btn btn-success" onclick="newArticle()"><span
									class="glyphicon glyphicon-pencil"></span> 写文章</a>
							</div>
						</div>
					</div>
					<div class="widget-box">
						<div class="widget-title">
							<h5>Search</h5>
						</div>
						<div class="widget-content">
							<div class="input-group">
								<input type="text" class="form-control"> <span
									class="input-group-btn">
									<button class="btn btn-default" type="button">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
					</div>

					<div class="widget-box">
						<div class="widget-title">
							<h5>Categories</h5>
						</div>
						<div class="widget-content">
							<div class="articles-category">
							<ul class="list-unstyled">
								<c:forEach items="${categoryMap}" var="category" varStatus="states">
									<li><a href="${ctx}/article/allauthor/${category.key}/publish">
										<span>${category.key}</span>(${category.value})</a></li>
								</c:forEach>
							</ul>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-10">
					<div class="widget-box">
						<div class="widget-content">
							<div class="article-title full-article-title">
								<h3>
									<span class="label label-success">原创</span>${article.title}
								</h3>
							</div>
							<div class="article-info full-article-info">
								<p class="category">
									<c:forEach items="${article.category}" var="cate"
										varStatus="states">
										<span>${cate}</span>
									</c:forEach>
								</p>
								<p class="info">
									<span>${article.authorName}</span> 
									<span><fmt:formatDate
											value="${article.createDate}" type="both" /></span> 
									<span>阅读(${article.viewTime})</span>
									<span>赞(${article.thumbUpTime})</span>
								</p>
							</div>				
							<hr/>
							<div class="full-article-content">
								${article.detail}
							</div>

						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>


</body>
</html>
