<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>盐巴</title>
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/task.css" />
<script type="application/javascript" src="/js/jquery.min.js"></script>
<script type="application/javascript" src="/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function submitForm() {
		document.getElementById("statusFilter").value = "10000";
		var form = document.getElementById("filterForm");
		form.submit();
	}
	function submitFormWithStatus(s) {
		document.getElementById("statusFilter").value = s;
		var form = document.getElementById("filterForm");
		form.submit();
	}
</script>
</head>

<body>
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
				<a class="navbar-brand" href="#">Prison Break</a> <img id="Brand"
					class="img-rounded" alt="Brand" src="/images/bug.gif"
					style="height: 35px; width: 35px; margin-top: 8px">
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${ctx}/task">任务</a></li>
					<li><a href="${ctx}/knowledge">知识</a></li>
					<li><a href="${ctx}/information">资料</a></li>
					<li><a href="${ctx}/activity">活动</a></li>
					<li><a href="${ctx}/tool">工具</a></li>
				</ul>
			</div>
			<!--/.navbar-collapse -->
		</div>
	</nav>

	<div class="container theme-showcase" role="main">
		<div class="page-header">
			<h3>任务管理</h3>
		</div>

		<form:form id="filterForm" commandName="taskQuery"
			action="${ctx}/task/task_list" method="post" class="form-inline">
			<div class="row breadcrumb"
				style="margin: 10px 0px; padding: 8px 2px">
				<div class="col-sm-12">
					<div class="form-group">
						所属项目：
						<form:select onchange="submitForm();" class="form-control"
							path="queryTask.projectName" id="queryTask.projectName"
							items="${taskQuery.selectProjects}" itemLabel="name"
							itemValue="name">
						</form:select>
					</div>

					<div class="form-group">
						负责人：
						<form:select onchange="submitForm();" class="form-control"
							path="queryTask.assignTo" id="queryTask.assignTo"
							items="${taskQuery.selectUsers}" itemLabel="name"
							itemValue="name">
						</form:select>
					</div>

					<div class="dropdown" style="float: right">
						<button type="button" class="btn dropdown-toggle btn-newtask"
							id="dropdownMenu1" data-toggle="dropdown">
							<span class="glyphicon glyphicon-plus-sign"></span> 新建 <span
								class="caret"></span>
						</button>
						<ul class="dropdown-menu pull-right" role="menu"
							aria-labelledby="dropdownMenu1">
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#" class="text-center" data-toggle="modal"
								data-target="#myModal">添加任务</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#" class="text-center" data-toggle="modal"
								data-target="#myModal">新建项目</a></li>
						</ul>
					</div>
				</div>
			</div>

			<ul class="nav nav-tabs" role="tablist">
				<li <c:if test="${statusFilter=='10000'}">class="active"</c:if>
					onclick="submitFormWithStatus(10000);"><a href="#">全部状态</a></li>
				<li <c:if test="${statusFilter=='10001'}">class="active"</c:if>
					onclick="submitFormWithStatus(10001);"><a href="#">未开始</a></li>
				<li <c:if test="${statusFilter=='10002'}">class="active"</c:if>
					onclick="submitFormWithStatus(10002);"><a href="#">正在处理</a></li>
				<li <c:if test="${statusFilter=='10003'}">class="active"</c:if>
					onclick="submitFormWithStatus(10003);"><a href="#">已完成</a></li>
				<li <c:if test="${statusFilter=='10004'}">class="active"</c:if>
					onclick="submitFormWithStatus(10004);"><a href="#">已归档</a></li>
			</ul>

			<form:hidden path="queryTask.status" id="statusFilter"
				name="statusFilter" />

		</form:form>

		<table class="table table-striped table-bordered table-hover">
			<colgroup>
				<col style="">
				<col style="width: 50%">
				<col style="">
				<col style="">
				<col style="width: 8%">
				<col style="">
			</colgroup>
			<thead>
				<tr>
					<th>所属项目</th>
					<th>任务内容</th>
					<th>负责人</th>
					<th>到期时间</th>
					<th>进度</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${tasks}" var="task">
					<tr>
						<td>${task.projectName}</td>
						<td>${task.description}</td>
						<td>${task.assignTo}</td>
						<td>${task.expectFinishDate}</td>
						<td>
							<div class="progress">
								<div class="progress-bar progress-bar-info" role="progressbar"
									aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"
									style="width: ${task.progress}%;"></div>
							</div>
						</td>
						<td>
							<button class="btn btn-default btn-opt" type="submit">
								<span class="glyphicon glyphicon-zoom-in glyphicon-opt"></span>详情
							</button>
							<button class="btn btn-default btn-opt" type="submit">
								<span class="glyphicon glyphicon-pencil glyphicon-opt"></span>编辑
							</button>
							<button class="btn btn-default btn-opt" type="submit">
								<span class="glyphicon glyphicon-check glyphicon-opt"></span>进度
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 新建任务，模态框（Modal） -->
		<form:form commandName="task" action="${ctx}/task/task_save"
			method="post">
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content"
						style="padding: 2px 20px; padding-left: 30px">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">新建任务</h4>
						</div>
						<div class="modal-body">
							<form role="form">
								<div class="form-group">
									<label for="name">任务描述：</label>
									<form:textarea class="form-control required" path="description"
										style="max-width:500px;" rows="5" />
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>所属项目：</label>
											<form:select class="form-control required" path="projectName"
												id="projectName" items="${projects}" itemLabel="name"
												itemValue="name">
											</form:select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>分配给：</label>
											<form:select class="form-control required" path="assignTo"
												id="assignTo" items="${users}" itemLabel="name"
												itemValue="name">
											</form:select>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>状态：</label>
											<form:select class="form-control required" path="status"
												id="status" items="${statuses}" itemLabel="name"
												itemValue="id">
											</form:select>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label>DeadLine：</label>
											<form:input class="form-control required" type="date"
												path="expectFinishDate" id="expectFinishDate" />
										</div>
									</div>
								</div>
							</form>

							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="submit" id="submit" class="btn btn-primary">提交任务</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal -->
				</div>
			</div>
		</form:form>


		<div class="row-fluid">
			<div id="footer" class="span12">
				2017 - 2018 &copy; Brought to you by <a href="#">kinphar.</a>
			</div>
		</div>

	</div>



</body>
</html>
