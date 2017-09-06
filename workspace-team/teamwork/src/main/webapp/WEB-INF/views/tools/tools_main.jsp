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
<script type="application/javascript" src="/js/jquery.min.js"></script>
<script type="application/javascript" src="/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function timeStampConvert() {
		var ts = $('#inputTimeStamp').val();
		if (ts.length != 10) {
			alert("Unix时间戳长度必须为 10.");
		} else {
			$.ajax({
				type : "GET",
				url : "${ctx}/tools/timestamp_convert",
				data : {
					timeStamp : ts
				},
				dataType : 'json',
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					$('#inputDate').val(data.result);
				},
				error : function(xhr) {
				}
			});
		}
	}	
	
	function rabbitMqSendMessage() {
		var msg = $('#rabbitMqMsgContent').val();
		if (msg.length <= 0) {
			alert("没有消息需要发送！");
		} else {
			$.ajax({
				type : "GET",
				url : "${ctx}/tools/send_message",
				data : {
					message : msg
				},
				dataType : 'json',
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					console.log("rabbitMqSendMessage:success.");
				},
				error : function(xhr) {
				}
			});
		}
	}	

</script>
</head>

<body>
	<%@ include file="../common/top_navbar.jsp"%>

	<div class="container theme-showcase" role="main">
		<div class="page-header">
			<h3>工具</h3>
		</div>

		<div style="margin-bottom: 20px">
		<h4>时间格式转换</h4>		
		<ul class="list-inline" style="background-color:#fafafa; text-align:center; padding:10px 10px">
			<li>Unix时间戳（秒）：</li>
			<li><input type="text" class="form-control" 
				id="inputTimeStamp" value="${currentTimeStamp}"></li>
			<li style="margin: 0px 30px;">
				<button
					type="button" onclick="timeStampConvert()" 
					class="btn btn-success btn-block">==转换=>
				</button></li>
			<li>北京时间：</li>
			<li><input type="text" class="form-control" id="inputDate" value="${currentDate}"></li>
		</ul>		
		</div>
		
		<div style="margin-bottom: 20px">
		<h4>RabbitMq 测试</h4>		
		<ul class="list-inline" style="background-color:#fafafa; padding:10px 10px">
			<li><input type="text" class="form-control" 
				id="rabbitMqMsgContent" placeholder="消息内容..."></li>
			<li style="margin: 0px 30px;">
				<button type="button" onclick="rabbitMqSendMessage()" 
					class="btn btn-success btn-block">Send
				</button></li>
		</ul>
		</div>

	</div>

</body>
</html>
