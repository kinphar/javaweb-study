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
	$(document).ready(function() {
		$(".thump-up").click(function() {
			var id = $(this).data("articleid");
			var totalTime = 0;
			$(this).text("abcd");
			$.ajax({
				type : "POST",
				url : "${ctx}/article/thumbup",
				data : {
					articleid : id
				},
				async : false,
				success : function(data) {					
					totalTime = data.time;
				},
				error : function(xhr) {
				}
			});
			console.log("totalTime:" + totalTime);
			$(this).text("赞(" + totalTime + ")");
		});
	});
	
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
								<a href="javascript:void(0)" class="btn btn-success" 
									onclick="newArticle()"><span
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
							<ul class="articles-list">
								<c:forEach items="${articles}" var="article" varStatus="states">
									<li class="article-item">
										<div class="article-title">
											<h3>
												<span class="label label-success">原创</span>${article.title}
												<c:if test="${article.createBy == userLogin.email}">
													<div class="article-opt pull-right">
														<a class="btn btn-default btn-edit-article" 
															href="${ctx}/article/edit/${article.id}">
															<span class="glyphicon glyphicon-pencil"></span>
														</a>
														<a class="btn btn-default btn-delete-article" 
															href="${ctx}/article/delete/${article.id}">
															<span class="glyphicon glyphicon-remove"></span>
														</a>
													</div>
												</c:if>
											</h3>
										</div>
										<div class="article-content">
											<p>${article.brief}<a href="${ctx}/article/view/${article.id}" 
												class="article-brief"> 看个究竟</a>
											</p>
										</div>
										<div class="article-info">
											<p class="category">
												<c:forEach items="${article.category}" var="cate"
													varStatus="states">
													<span>${cate}</span>
												</c:forEach>
											</p>
											<p class="info">
												<span>${article.authorName}</span> <span><fmt:formatDate
														value="${article.createDate}" type="both" /></span> 
												<span>阅读(${article.viewTime})</span>
												<span><a href="javascript:void(0)" class="thump-up" 
													data-articleid="${article.id}">赞(${article.thumbUpTime})</a></span>
											</p>
										</div></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


</body>
</html>
