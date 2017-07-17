<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>盐巴</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/task.css" />
		<script type="application/javascript" src="js/bootstrap.min.js"></script>
		<script type="application/javascript" src="js/jquery.min.js"></script>
		<script type="application/javascript" src="js/bootstrap.min.js"></script>		
	</head>
	
	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top">
	      <div class="container">
	        <div class="navbar-header">
	          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	          <a class="navbar-brand" href="#">Prison Break</a>
	          <form class="navbar-form navbar-right">
	            <input type="text" class="form-control" placeholder="Search...">
	          </form>
	        </div>
	        <div id="navbar" class="navbar-collapse collapse">
	          <ul class="nav navbar-nav navbar-right">
	          	<li><a href="${pageContext.request.contextPath}/task/task_list">任务</a></li>
	            <li><a href="${pageContext.request.contextPath}/knowledge">知识</a></li>
	            <li><a href="${pageContext.request.contextPath}/information">资料</a></li>
	            <li><a href="${pageContext.request.contextPath}/activity">活动</a></li>
	            <li><a href="${pageContext.request.contextPath}/tool">工具</a></li>
	          </ul>
	        </div><!--/.navbar-collapse -->
	      </div>
	    </nav>
   	
    	<div class="container theme-showcase" role="main">
    		<div class="page-header">
		        <h3>团队活动</h3>
		    </div>
		    <img src="/images/pingtan.JPG" class="img-responsive" class="img-rounded">
	   </div>
	   
	   
	   
	</body>
</html>
	