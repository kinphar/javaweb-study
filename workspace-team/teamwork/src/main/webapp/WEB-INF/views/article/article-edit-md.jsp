<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>撰写文章</title>
<link rel="shortcut icon" href="/images/monkey.jpg">

<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/article-edit.css" />

<script type="application/javascript" src="/js/jquery.min.js"></script>
<script type="application/javascript" src="/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/static/icheck/skins/square/green.css" />
<script type="application/javascript" src="/static/icheck/icheck.min.js"></script>

<link rel="stylesheet" href="/static/editormd/css/editormd.min.css" />
<script type="application/javascript" src="/static/editormd/editormd.min.js"></script>

<script type="text/javascript">
	var basePath = "<%=basePath%>";
	
	$(function() {
	      editormd("my-editormd", {
	          width   : "100%",
	          height  : 640,
	          syncScrolling : "single",
	          path    : "/static/editormd/lib/",
	          saveHTMLToTextarea : true
	      });
	  });

	$(document).ready(function() {
		//icheck 
		$('input').iCheck({
			checkboxClass : 'icheckbox_square-green',
			radioClass : 'iradio_square-green',
			increaseArea : '20%' // optional
		});
		
		$(function() {
			boxes = $('.category-group').find('input[type="checkbox"]');
			console.log("abcd - " + boxes.length);
			boxes.each(function() {
				var categories = '${article.category}';
				var val = $(this).val();
				if (categories.indexOf(val) >= 0) {
					$(this).iCheck('check');
				}
			});
		});
		
		$(function() {
			boxes = $('.article-access').find('input[type="radio"]');
			boxes.each(function() {
				var access = '${article.access}';
				var val = $(this).val();
				if (access == val) {
					$(this).iCheck('check');
				}
			});
		});		
	});
	
	function checkNewArticleFrom(f) {
		/* if (!UE.getEditor('myEditor').hasContents()){ 
			alert('请先填写内容!'); 
		} */

		return true;
	}
	
	function newArticleFormSubmit(status) {
		var f = document.getElementById("newArticleForm");
		console.log("status:" + status);
		
		console.log("markdown:" + $("#my-editormd-markdown-doc").val());
		//if (checkNewArticleFrom(f) == true) {
			f.status.value = status;
			f.detail.value = $("#my-editormd-markdown-doc").val();
			f.submit();
		//}
	}
</script>

</head>

<body>
	<div class="container">
		<form:form id="newArticleForm" commandName="article" 
			action="${ctx}/article/save" method="post">			
		<input type="hidden" name="id" value="${article.id}"/>
		<input type="hidden" name="format" value="markdown"/>
		<input type="hidden" name="status" />
		<input type="hidden" name="detail" />
		<table class="table table-condensed table-bordered" style="background-color:#fff">
			<tbody>
				<tr>
					<td class="td-center active"><label>标题：</label></td>
					<td><input type="text" class="form-control" name="title" style="width:60%" value="${article.title}"/></td>
				</tr>
				<tr>
					<td class="td-center active"><label>分类：</label></td>
					<td class="article-category">
						<div class="checkbox">
							<ul class="list-unstyled category-group">
								<li>
								<c:forEach items="${category_platform}" var="category" varStatus="states">
									<label><input type="checkbox" name="category" value="${category.name}"> ${category.name}</label>
								</c:forEach>
								</li>
								<li>
								<c:forEach items="${category_language}" var="category" varStatus="states">
									<label><input type="checkbox" name="category" value="${category.name}"> ${category.name}</label>
								</c:forEach>
								</li>
								<li>
								<c:forEach items="${category_system}" var="category" varStatus="states">
									<label><input type="checkbox" name="category" value="${category.name}"> ${category.name}</label>
								</c:forEach>
								</li>
							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<td class="td-center active"><label>权限：</label></td>
					<td class="article-access"><div class="radio">
						<label> 
							<input type="radio" name="access" value="public"> 外网可见
						</label> 
						<label> 
							<input type="radio" name="access" value="private"> 内部传阅
						</label>
					</div></td>
				</tr>
				<tr>
					<td colspan="2">
						<script type="text/plain" id="myEditor">		
    					</script>
    					<div id="my-editormd" >
							<textarea id="my-editormd-markdown-doc" name="my-editormd-markdown-doc" style="display:none;"></textarea>
						</div>
    				</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="pull-right">
							<button type="button" class="btn btn-default" 
								onclick="newArticleFormSubmit('draft')">保存草稿</button>
							<button type="button" class="btn btn-success" 
								onclick="newArticleFormSubmit('publish')">发布文章</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		</form:form>

		<!-- <div id="myEditor"></div> -->
	</div>

</body>
</html>
