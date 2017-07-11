<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
				<a class="navbar-brand" href="#">Prison Break</a>
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

		<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<form class="form-inline" role="form">
					<div class="form-group">
						<label for="projectname">项目名称：</label> <select
							class="form-control">
							<option>所有项目</option>
							<option>T91R</option>
							<option>板卡定制</option>
							<option>主线V5.0.2</option>
							<option>I66</option>
							<option>X66L</option>
						</select>
					</div>
					<div class="form-group">
						<label for="">负责人：</label> <select class="form-control">
							<option>所有人</option>
							<option>我自己</option>
						</select>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="查找任务...">
					</div>
					<div class="form-group" style="float: right">
						<div class="dropdown">
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
				</form>
			</div>
		</nav>

		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#">ALL</a></li>
			<li role="presentation"><a href="#">未开始</a></li>
			<li role="presentation"><a href="#">正在处理</a></li>
			<li role="presentation"><a href="#">已完成</a></li>
		</ul>

		<table class="table table-striped table-bordered table-hover">
			<colgroup>
				<col style="">
				<col style="">
				<col style="width: 40%">
				<col style="">
				<col style="">
				<col style="width: 8%">
				<col style="">
			</colgroup>
			<thead>
				<tr>
					<th>编号</th>
					<th>所属项目</th>
					<th>描述</th>
					<th>到期时间</th>
					<th>处理人</th>
					<th>进度</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${tasks}" var="task">
					<tr>
						<td>${task.id}</td>
						<td>${task.projectName}</td>
						<td>${task.description}</td>
						<td>${task.expectFinishDate}</td>
						<td>${task.assignTo}</td>
						<td>
							<div class="progress">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="60" aria-valuemin="0"
									aria-valuemax="100" style="width: 100%;"></div>
							</div>
						</td>
						<td>
							<button class="btn btn-primary btn-opt" type="submit">
								<span class="glyphicon glyphicon-zoom-in glyphicon-opt"></span>详情
							</button>
							<button class="btn btn-success btn-opt" type="submit">
								<span class="glyphicon glyphicon-pencil glyphicon-opt"></span>编辑
							</button>
							<button class="btn btn-warning btn-opt" type="submit">
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

							<fieldset>
								<form role="form">
									<div class="form-group">
										<label for="name">任务描述：</label>
										<form:textarea class="form-control" path="description"
											style="max-width:500px;" rows="5" />
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>所属项目：</label>
												<form:select class="form-control" path="projectName"
													id="projectName" items="${projects}" itemLabel="name"
													itemValue="name">
												</form:select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>分配给：</label>
												<form:select class="form-control" path="assignTo"
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
												<form:select class="form-control" path="status" id="status"
													items="${statuses}" itemLabel="name" itemValue="name">
												</form:select>
											</div>
										</div>

										<div class="col-md-6">
											<div class="form-group">
												<label>DeadLine：</label>
												<form:input class="form-control" type="date"
													path="expectFinishDate" id="expectFinishDate" />
											</div>
										</div>
									</div>
								</form>
							</fieldset>

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
