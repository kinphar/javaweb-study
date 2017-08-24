<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Zootopia</title>
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/knowledge.css" />
<script type="application/javascript" src="/js/jquery.min.js"></script>
<script type="application/javascript" src="/js/bootstrap.min.js"></script>

<script type="text/javascript">

function newArticle() {
	var url = "new";
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
							<div style="text-align: center">
								<p>
									<span style="color: gray">撰文：</span>3篇
								</p>
								<p>
									<span style="color: gray">草稿：</span>1篇
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
								<li><a href="javascript:void(0)"><span>DS2600</span>(10)</a></li>
								<li><a href="javascript:void(0)"><span>DS3000</span>(2)</a></li>
								<li><a href="javascript:void(0)"><span>DS2000</span>(2)</a></li>
								<li><a href="javascript:void(0)"><span>Linux</span>(10)</a></li>
								<li><a href="javascript:void(0)"><span>Android</span>(5)</a></li>
								<li><a href="javascript:void(0)"><span>JavaWeb</span>(5)</a></li>
								<li><a href="javascript:void(0)"><span>C/C++</span>(40)</a></li>
								<li><a href="javascript:void(0)"><span>Java</span>(30)</a></li>
								<li><a href="javascript:void(0)"><span>python</span>(10)</a></li>
								<li><a href="javascript:void(0)"><span>shell</span>(6)</a></li>
								<li><a href="javascript:void(0)"><span>bat</span>(1)</a></li>
							</ul>
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-10">
					<div class="widget-box">
						<div class="widget-content">
							<ul class="articles-list">
								<li class="article-item">
									<div class="article-title">
										<h4>
											<span class="label label-success">原创</span>十年之后
										</h4>
									</div>
									<div class="article-content">
										<p>
											<a href="javascript:void(0)" class="article-brief">说在前面本文绝大部分参考《JAVA高并发程序设计》，类似读书笔记和扩展。走入并行世界概念同步（synchronous）与异步（asynchronous）同步和异步通常来形容一次方法调用。说在前面本文绝大部分参考《JAVA高并发程序设计》，类似读书笔记和扩展。走入并行世界概念同步（synchronous）与异步（asynchronous）同步和异步通常来形容一次方法调用。同步方法调用一旦开始，调用者必须等到方法调用返回后，才能继续执行任务。</a>
										</p>
									</div>
									<div class="article-info">
										<p class="category">
											<span>linux</span>
											<span>DS2600</span>
										</p>
										<p class="info">
											<span>王锦乐</span> 
											<span>2017-08-23 17:07</span> 
											<span>阅读(100)</span> 
											<span>评论(0)</span>
										</p>
									</div>
								</li>
								<li class="article-item">
									<div class="article-title">
										<h4>
											<span class="label label-default" style="font-size:12px">转载</span>沉默的等奇迹
										</h4>
									</div>
									<div class="article-content">
										<p>
											<a href="javascript:void(0)" class="article-brief">说在前面本文绝大部分参考《JAVA高并发程序设计》，类似读书笔记和扩展。走入并行世界概念同步（synchronous）与异步（asynchronous）同步和异步通常来形容一次方法调用。说在前面本文绝大部分参考《JAVA高并发程序设计》，类似读书笔记和扩展。走入并行世界概念同步（synchronous）与异步（asynchronous）同步和异步通常来形容一次方法调用。同步方法调用一旦开始，调用者必须等到方法调用返回后，才能继续执行任务。</a>
										</p>
									</div>
									<div class="article-info">
										<p class="category">
											<span>linux</span>
											<span>DS2600</span>
										</p>
										<p class="info">
											<span>丁庆发</span> 
											<span>2017-08-23 17:07</span> 
											<span>阅读(100)</span> 
											<span>评论(0)</span>
										</p>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>


</body>
</html>
