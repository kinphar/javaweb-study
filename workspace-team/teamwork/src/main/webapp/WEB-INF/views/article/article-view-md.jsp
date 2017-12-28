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

<link rel="stylesheet" href="/static/editormd/css/editormd.min.css" />
<link rel="stylesheet" href="/static/editormd/css/editormd.logo.min.css" />
<link rel="stylesheet" href="/static/editormd/css/editormd.preview.min.css" />
<script src="/static/editormd/lib/marked.min.js"></script>
<script src="/static/editormd/lib/prettify.min.js"></script>
<script src="/static/editormd/lib/raphael.min.js"></script>
<script src="/static/editormd/lib/underscore.min.js"></script>
<script src="/static/editormd/lib/sequence-diagram.min.js"></script>
<script src="/static/editormd/lib/flowchart.min.js"></script>
<script src="/static/editormd/lib/jquery.flowchart.min.js"></script>
<script src="/static/editormd/editormd.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	console.log("dispplay page : article-view-md.")
	
	$("#comment-save").click(function() {
		var content = $("#new-comment-input").val();
		$("#comment-save").text("Saying...");
		
		if (content != "") {
			var index = content.indexOf("【回复 ");
			var isReply = index == 0 ? true : false;
			
			var comment = {};
			comment.parentId = "${article.id}";
			if (isReply) {
				comment.previousId = $("#replied-id").val();
			}
			comment.description = content;
			comment.category = "article";

			$.ajax({
				type : "POST",
				url : "${ctx}/comment/new",
				data : comment,
				datatype : "json",
				async : false,
				success : function(data) {
					window.location.reload();
				},
				error : function(xhr) {
				}
			});
		}
	});
});

window.onbeforeunload = function () {
    var scrollPos;
    if (typeof window.pageYOffset != 'undefined') {
        scrollPos = window.pageYOffset;
    }
    else if (typeof document.compatMode != 'undefined' && document.compatMode != 'BackCompat') {
        scrollPos = document.documentElement.scrollTop;
    }
    else if (typeof document.body != 'undefined') {
        scrollPos = document.body.scrollTop;
    }
    document.cookie = "scrollTop=" + scrollPos; //存储滚动条位置到cookies中
}

window.onload = function () {
    if (document.cookie.match(/scrollTop=([^;]+)(;|$)/) != null) {
        var arr = document.cookie.match(/scrollTop=([^;]+)(;|$)/); //cookies中不为空，则读取滚动条位置
        document.documentElement.scrollTop = parseInt(arr[1]);
        document.body.scrollTop = parseInt(arr[1]);
    }
}


function setReply(id, name) {
	$("#new-comment-input").val("【回复 " + name + "】： ");
	$("#new-comment-input").focus();
	
	$("#replied-id").val(id);
}

function deleteComment(id) {
	console.log("deleteComment:" + id);
	$.ajax({
		type : "POST",
		url : "${ctx}/comment/delete",
		data : {
			commentid : id
		},
		datatype : "json",
		async : false,
		success : function(data) {
			console.log("delete comment ok；" + id);
			window.location.reload();
		},
		error : function(xhr) {
		}
	});
}

var testEditor;
$(function () {
    testEditor = editormd.markdownToHTML("doc-content", {
        htmlDecode: "style,script,iframe",
        emoji: true,
        taskList: true,
        tex: true, 
        flowChart: true, 
        sequenceDiagram: true, 
        codeFold: true,
});});

</script>

</head>

<body>
	<%@ include file="../common/top_navbar.jsp"%>

	<div class="container theme-showcase" role="main">
		<div class="container-fluid">
			<div class="row-fluid">
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
							<div id="doc-content" class="full-article-content">
								<textarea style="display:none;">${article.detail}</textarea>								
							</div>
							
							<div class="comment-head">
								<h5><strong>七嘴八舌：</strong></h5>	
								<hr/>
							</div>
							<div class="article-comment-area">								
								<ul class="list-unstyled article-comments">
									<c:forEach items="${comments}" var="comment">
										<li class="comment-item">
											<div class="user-thumb">
												<img class="img-circle img-thumb" alt="User" src="${comment.authorPhoto}">
											</div>
											<div class="comment-info">
												<span class="user-info">User: ${comment.authorName} on 	
												<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${comment.createDate}" /></span>
												<p>
													<a class="comment-content">${comment.description}</a>
												</p>											
											</div>
											<div class="user-opt pull-right">												
												<a class="btn btn-default btn-reply-comment" 
													onclick="setReply('${comment.id}', '${comment.authorName}')">
													<span class="glyphicon glyphicon-bullhorn glyphicon-opt"></span>
												</a>					
												<c:if test="${comment.createBy == userLogin.email}">
													<a class="btn btn-default btn-delete-comment" 
														onclick="deleteComment('${comment.id}')">
														<span class="glyphicon glyphicon-remove glyphicon-opt"></span>
													</a>
												</c:if>							
											</div>
										</li>
									</c:forEach>
								</ul>
								<div class="input-group comment-input-group">
									<input id="replied-id" type="hidden" value="">
				                    <input id="new-comment-input" type="text" class="form-control">
				                    <span class="input-group-btn">
				                        <button class="btn btn-default btn-success" id="comment-save" type="button">Say it!</button>
				                    </span>
				                </div>
							</div>							
						</div>
					</div>
			</div>
		</div>
	</div>

</body>
</html>
