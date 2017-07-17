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
		document.getElementById("statusFilter").value = "all";
		var form = document.getElementById("filterForm");
		form.submit();
	}
	function submitFormWithStatus(s) {
		document.getElementById("statusFilter").value = s;
		var form = document.getElementById("filterForm");
		form.submit();
	}

	function delcfm(url) {
		$('#url').val(url);//给会话中的隐藏属性URL赋值  
		$('#delcfmModel').modal();
	}
	function urlSubmit() {
		var url = $.trim($("#url").val());//获取会话中的隐藏属性URL  
		window.location.href = url;
	}
	

	function addCheckList() {
		var oCheckbox=document.createElement("input");
		var myText=document.createTextNode("蚂蚁部落");
		oCheckbox.setAttribute("type","checkbox");
		oCheckbox.setAttribute("id","mayi");
				
		var mydiv=document.getElementById("taskCheckList");
		mydiv.appendChild(oCheckbox);
		mydiv.appendChild(myText);
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
							path="queryTask.projectName" id="queryTask.projectName">
							<form:option value="all" label="所有项目" />
							<form:options items="${taskQuery.selectProjects}"
								itemLabel="name" itemValue="name" />
						</form:select>
					</div>

					<div class="form-group">
						负责人：
						<form:select onchange="submitForm();" class="form-control"
							path="queryTask.assignTo" id="queryTask.assignTo">
							<form:option value="all" label="所有人" />
							<form:options items="${taskQuery.selectUsers}" itemLabel="name"
								itemValue="name" />
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
								href="#" class="text-center">新建项目</a></li>
						</ul>
					</div>
				</div>
			</div>

			<ul class="nav nav-tabs" role="tablist">
				<li <c:if test="${statusFilter=='all'}">class="active"</c:if>
					onclick="submitFormWithStatus('all');"><a href="#">全部</a></li>
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
				<col style="width: 40%">
				<col style="">
				<col style="">
				<col style="width: 8%">
				<col style="">
			</colgroup>
			<thead>
				<tr>
					<th>所属项目</th>
					<th>标题</th>
					<th style='text-align: center;'>负责人</th>
					<th style='text-align: center;'>到期时间</th>
					<th style='text-align: center;'>进度</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${tasks}" var="task">
					<tr>
						<td>${task.projectName}</td>
						<td>${task.title}</td>
						<td style='text-align: center;'>${task.assignTo}</td>
						<td style='text-align: center;'>${task.expectFinishDate}</td>
						<td>
							<div class="progress">
								<div class="progress-bar progress-bar-info" role="progressbar"
									aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"
									style="width: ${task.progress}%;"></div>
							</div>
						</td>
						<td><a class="btn btn-default btn-opt" role="menuitem"
							data-toggle="modal" data-target="#myModal"> <span
								class="glyphicon glyphicon-screenshot glyphicon-opt"></span>打开
						</a> <a class="btn btn-default btn-opt"
							onClick="delcfm('${ctx}/task/task_delete?taskid=${task.id}')">
								<span class="glyphicon glyphicon-trash glyphicon-opt"></span>删除
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 删除确认 -->
		<div class="modal modal-small fade" id="delcfmModel">
			<div class="modal-dialog">
				<div class="modal-content message_align">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title">提示信息</h4>
					</div>
					<div class="modal-body">
						<label class="text-center">您确认要删除吗？</label>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="url" />
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<a onclick="urlSubmit()" class="btn btn-primary"
							data-dismiss="modal">确定</a>
					</div>
				</div>
			</div>
		</div>

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
									<label for="name">标题：</label>
									<form:input class="form-control" path="title" required="true" />
								</div>

								<div class="form-group">
									<label for="name">内容：</label>
									<form:textarea class="form-control" path="description"
										style="max-width:500px;" rows="5" placeholder="可选，主要描述需求详情。" />
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>所属项目：</label>
											<form:select class="form-control" path="projectName"
												id="projectName" required="true">
												<form:option value="" label="" />
												<form:options items="${projects}" itemLabel="name"
													itemValue="name" />
											</form:select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>分配给：</label>
											<form:select class="form-control" path="assignTo"
												id="assignTo" required="true">
												<form:option value="" label="" />
												<form:options items="${users}" itemLabel="name"
													itemValue="name" />
											</form:select>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>状态：</label>
											<form:select class="form-control" path="status" id="status"
												required="true">
												<form:option value="" label="" />
												<form:options items="${statuses}" itemLabel="name"
													itemValue="id" />
											</form:select>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group">
											<label>DeadLine：</label>
											<form:input class="form-control" type="date"
												path="expectFinishDate" id="expectFinishDate"
												required="true" />
										</div>
									</div>
								</div>

								<hr />

								<div class="row">
									<div class="col-md-3">
										<label for="name"><span
											class="glyphicon glyphicon-th-list"></span> 检查项：</label>
									</div>
									<div class="well col-md-8"
										style="background-color: #F8F6F2; border-width: 0px; padding: 10px 20px;">
										<div class="progress">
											<div class="progress-bar progress-bar-success"
												role="progressbar" aria-valuenow="10" aria-valuemin="0"
												aria-valuemax="100" style="width: 50%;"></div>
										</div>

										<ul id="taskCheckList" class="list-unstyled checkbox">
											<li><label> <input type="checkbox">请打勾1
											</label></li>
											<li><label> <input type="checkbox">请打勾2
											</label></li>
											<li><label> <input type="checkbox">请打勾3
											</label></li>
											<li><label> <input type="checkbox">请打勾4
											</label></li>
											<li style="margin-top:10px" onclick="addCheckList()"><a href="#">+新增检查项</a></li>
										</ul>
									</div>
								</div>
							</form>

							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="submit" id="submit" class="btn btn-primary">提交任务</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>


		<!-- <s:include value="footer.jsp"></s:include> -->

	</div>

</body>
</html>
