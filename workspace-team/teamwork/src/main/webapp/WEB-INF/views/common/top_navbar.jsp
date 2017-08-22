<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Zoo Party</a> <img id="Brand"
				class="img-rounded" alt="Brand" src="/images/bug.gif"
				style="height: 35px; width: 35px; margin-top: 8px">
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search...">
			</form>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${ctx}/task/task_list">任务</a></li>
				<li><a href="${ctx}/knowledge">知识</a></li>
				<li><a href="${ctx}/information">资料</a></li>
				<li><a href="${ctx}/tools/init">工具</a></li>
				<li><a href="${ctx}/activity">活动</a></li>				
				<li><a href="${ctx}/account/dologout">[${userInfo}]退出</a></li>
			</ul>
		</div>
		<!--/.navbar-collapse -->
	</div>
</nav>