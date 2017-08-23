<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Zoo Party</title>
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

</script>
</head>

<body>
	<%@ include file="../common/top_navbar.jsp"%>

	<div class="container theme-showcase" role="main">
		<div class="page-header">
			<h3>工具</h3>
		</div>

		<div class="page-header">
			<h4>1. 时间格式转换</h4>
		</div>		
		
		<ul class="list-inline" style="background-color:#f5f5f5; text-align:center; padding:10px 10px">
			<li>Unix时间戳（秒）：</li>
			<li><input type="text" class="form-control" 
				id="inputTimeStamp" value="${currentTimeStamp}"></li>
			<li style="margin: 0px 30px;"><button id="saveTaskButton"
					type="button" onclick="timeStampConvert()" class="btn btn-success btn-block">==转换=></button></li>
			<li>北京时间：</li>
			<li><input type="text" class="form-control" id="inputDate" value="${currentDate}"></li>
		</ul>

	</div>


</body>
</html>
