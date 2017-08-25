<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="#">
<title>撰写文章</title>

<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/common.css" />

<script type="application/javascript" src="/js/jquery.min.js"></script>
<script type="application/javascript" src="/js/bootstrap.min.js"></script>
 
<script type="text/javascript" src="/static/ueditor/ueditor.config.js"></script>  
<script type="text/javascript" src="/static/ueditor/ueditor.all.js"></script>  
<script type="text/javascript" src="/static/ueditor/lang/zh-cn/zh-cn.js"></script>  


<script type="text/javascript">
	var basePath = "<%=basePath%>";
	
	$(document).ready(function() {
		var item = {
			toolbars : [
					[ 'fullscreen', 'source', '|', 'undo', 'redo', '|', 'bold', 'italic', 'underline',
							'fontborder', 'strikethrough', 'superscript',
							'subscript', 'removeformat                     ',
							'simpleupload', 'insertimage', 'emotion', 'insertvideo', 'attachment', 'insertcode', 'lineheight',
							'inserttable', '|', 'justifyleft', 'justifycenter',
							'justifyright', 'justifyjustify' ],
					[ 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain',
							'|', 'forecolor', 'backcolor', 'insertorderedlist',
							'insertunorderedlist', 'selectall', 'cleardoc',
							'fontfamily', 'fontsize', 'preview' ] ],
						
			autoHeightEnabled : false, 			//是否自动长高，默认true
			initialFrameHeight: 640,			//初始化编辑器高度,默认320
			autoFloatEnabled : false, 			//是否保持toolbar的位置不动，默认true
			wordCount : true, 					//是否开启字数统计 默认true
			maximumWords : 100000, 				//允许的最大字符数 默认值：10000
			wordOverFlowMsg : "<span style='color:red'>超出范围了！！！！！！！！</span>", //超出字数限制提示
			elementPathEnabled : false, 		//是否启用元素路径
			padding : 0,
			saveInterval : 5000000, 			// 将其设置大点，模拟去掉自动保存功能
			allowDivTransToP : false
		};		
		
		//传参生成实例
		UE.getEditor('myEditor', item); 		
		UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;		
		UE.Editor.prototype.getActionUrl = function(action){
			console.log("action:" + action);
			if(action == '/resource/upload/images'){
				return basePath + 'resource/upload/images';
			}else{
				return this._bkGetActionUrl.call(this, action);
			}
		}
				
	});
</script>


</head>

<body>
	<div class="container">

		<p>在这里写文章</p>
		<form action="new" method="post">
    		<script type="text/plain" id="myEditor">		
    		</script>
    		<input type="submit" name="submit" value="提交">
		</form>

		<!-- <div id="myEditor"></div> -->
	</div>
	<!-- /container -->

</body>
</html>
