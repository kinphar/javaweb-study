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

<script type="text/javascript" src="/static/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/static/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="/static/ueditor/lang/zh-cn/zh-cn.js"></script>

<link rel="stylesheet" href="/static/icheck/skins/square/green.css" />
<script type="application/javascript" src="/static/icheck/icheck.min.js"></script>

<script type="text/javascript">
	var basePath = "<%=basePath%>";

	$(document).ready(function() {
		//icheck 
		$('input').iCheck({
			checkboxClass : 'icheckbox_square-green',
			radioClass : 'iradio_square-green',
			increaseArea : '20%' // optional
		});
		
		var item = {
			toolbars : [
					[
							'fullscreen',
							'source',
							'|',
							'undo',
							'redo',
							'|',
							'bold',
							'italic',
							'underline',
							'fontborder',
							'strikethrough',
							'superscript',
							'subscript',
							'removeformat                     ',
							'simpleupload', 'insertimage',
							'emotion', 'insertvideo',
							'attachment', 'insertcode',
							'lineheight', 'inserttable', '|',
							'justifyleft', 'justifycenter',
							'justifyright', 'justifyjustify' ],
					[ 'formatmatch', 'autotypeset',
							'blockquote', 'pasteplain', '|',
							'forecolor', 'backcolor',
							'insertorderedlist',
							'insertunorderedlist', 'selectall',
							'cleardoc', 'fontfamily',
							'fontsize', 'preview' ] ],

			autoHeightEnabled : false, //是否自动长高，默认true
			initialFrameHeight : 700, //初始化编辑器高度,默认320
			autoFloatEnabled : false, //是否保持toolbar的位置不动，默认true
			wordCount : true, //是否开启字数统计 默认true
			maximumWords : 100000, //允许的最大字符数 默认值：10000
			wordOverFlowMsg : "<span style='color:red'>超出范围了！！！！！！！！</span>", //超出字数限制提示
			elementPathEnabled : false, //是否启用元素路径
			padding : 0,
			saveInterval : 5000000, // 将其设置大点，模拟去掉自动保存功能
			allowDivTransToP : false
		};

		//传参生成实例
		UE.getEditor('myEditor', item);
		UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
		UE.Editor.prototype.getActionUrl = function(action) {
			console.log("action:" + action);
			if (action == '/resource/upload/images') {
				return basePath + 'resource/upload/images';
			} else {
				return this._bkGetActionUrl.call(this, action);
			}
		}
	});
	
	function checkNewArticleFrom(f) {
		if (!UE.getEditor('myEditor').hasContents()){ 
			alert('请先填写内容!'); 
		}

		return true;
	}
	
	function newArticleFormSubmit(status) {
		var f = document.getElementById("newArticleForm");
		console.log("status:" + status);
		if (checkNewArticleFrom(f) == true) {
			f.status.value = status;
			f.detail.value = UE.getEditor('myEditor').getContent();
			f.submit();
		}
	}
</script>


</head>

<body>
	<div class="container">
		<form:form id="newArticleForm" commandName="article" 
			action="${ctx}/article/save" method="post">			
		<input type="hidden" name="id" />
		<input type="hidden" name="status" />
		<input type="hidden" name="detail" />
		<table class="table table-condensed table-bordered" style="background-color:#fff">
			<tbody>
				<tr>
					<td class="td-center active"><label>标题：</label></td>
					<td><input type="text" class="form-control" name="title" style="width:60%"/></td>
				</tr>
				<tr>
					<td class="td-center active"><label>分类：</label></td>
					<td class="article-category">
						<div class="checkbox">
							<ul class="list-unstyled">
								<li><label><input type="checkbox" name="category" value="DS3000"> DS3000
								</label><label><input type="checkbox" name="category" value="DS2000"> DS2000
								</label><label><input type="checkbox" name="category" value="DS2600"> DS2600
								</label><label><input type="checkbox" name="category" value="MCU"> MCU
								</label></li>
								
								<li><label><input type="checkbox" name="category" value="Java"> Java
								</label><label><input type="checkbox" name="category" value="C/C++"> C/C++
								</label><label><input type="checkbox" name="category" value="Python"> Python
								</label><label><input type="checkbox" name="category" value="javaScript"> javaScript
								</label></li>
								
								<li><label><input type="checkbox" name="category" value="Android"> Android
								</label><label><input type="checkbox" name="category" value="Linux"> Linux
								</label><label><input type="checkbox" name="category" value="IOS"> IOS
								</label><label><input type="checkbox" name="category" value="单片机"> 单片机
								</label></li>
							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<td class="td-center active"><label>权限：</label></td>
					<td class="article-publish"><div class="radio">
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
