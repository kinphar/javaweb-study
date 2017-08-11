<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>盐巴</title>
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/task.css" />

<script type="application/javascript" src="/js/jquery.min.js"></script>
<script type="application/javascript" src="/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/css/bootstrap-datetimepicker.min.css" />
<script type="application/javascript"
	src="/js/bootstrap-datetimepicker.min.js"></script>
<script type="application/javascript"
	src="/js/bootstrap-datetimepicker.zh-CN.js"></script>

<link rel="stylesheet" href="/take/icheck/skins/square/blue.css" />
<script type="application/javascript" src="/take/icheck/icheck.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('input').iCheck({
			checkboxClass : 'icheckbox_square-blue',
			radioClass : 'iradio_square-blue',
			increaseArea : '20%' // optional
		});
		$('input').on('ifChecked', function(event) {
			var s = event.target.value;
			queryFormSubmitWithStatus(s);
		});

		$(".form_datetime").datetimepicker({
			format : "yyyy-mm-dd",
			autoclose : true,
			todayBtn : true,
			todayHighlight : true,
			showMeridian : true,
			pickerPosition : "bottom-right",
			language : 'zh-CN',//中文，需要引用zh-CN.js包
			startView : 2,//月视图
			minView : 2
		//日期时间选择器所能够提供的最精确的时间选择视图
		});
	});

	function queryFormSubmit() {
		document.getElementById("statusFilter").value = "10002";
		var form = document.getElementById("filterForm");
		form.submit();
	}
	function queryFormSubmitWithStatus(s) {
		console.log("queryFormSubmitWithStatus:" + s);
		document.getElementById("statusFilter").value = s;
		var form = document.getElementById("filterForm");
		form.submit();
	}

	function newTaskFormSubmit() {
		var list = document.getElementById("taskCheckList")
				.getElementsByTagName("input");
		for (i = 0; i < list.length; i++) {
			if (list[i].type == "checkbox") {
				if (!list[i].checked) {
					list[i].checked = true;
					list[i].value = "0";
				} else {
					list[i].value = "1";
				}
			}
		}

		var progress = document.getElementById("progressCheckList");
		document.getElementById("editTaskProgress").value = progress.style.width;

		var form = document.getElementById("newTaskForm");
		form.submit();
	}

	function delTask(id) {
		$('#taskId').val(id); //给会话中的隐藏属性URL赋值  
		$('#delcfmModel').modal(); //显示对话框
	}

	function doDel() {
		var id = document.getElementById('taskId').value;
		$.ajax({
			type : "POST",
			url : "${ctx}/task/task_delete",
			data : {
				taskid : id
			},
			success : function(data) {
				console.log("doDel:" + data.id + ";" + data.status + ";"
						+ data.statusNum);

				$("#panel_" + data.id).remove();
				$("#status_" + data.status).html(data.statusNum)
			},
			error : function(xhr) {
			}
		});
	}

	function fillTaskForm(id) {
		$.ajax({
			type : "GET",
			url : "${ctx}/task/task_get",
			data : {
				taskid : id
			},
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				$('#editTaskId').val(data.id);
				$('#editTaskTitle').val(data.title);
				$('#editTaskDescription').val(data.description);
				$('#editTaskProjectName').val(data.projectName);
				$('#editTaskAssignTo').val(data.assignTo);
				$('#editTaskStatus').val(data.status);
				$('#editTaskExpectFinishDate').val(data.expectFinishDate);

				//finish information
				$('#editTaskRealFinishDate').val(data.realFinishDate);
				$('#editFinishInfo').val(data.finishInfo);
				$('#editFinishLink').val(data.finishLink);
			},
			error : function(xhr) {
			}
		});

		$.ajax({
			type : "GET",
			url : "${ctx}/task/task_get_checklist",
			data : {
				taskid : id
			},
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				console.log("checklist:" + data.length);
				for (var i = 0; i < data.length; i++) {
					addCheckList(data[i].status, data[i].description);
				}
				calculateCheckListProgress();
			},
			error : function(xhr) {
			}
		});
	}

	function doCheck() {
		calculateCheckListProgress();
	}

	function delEmpty(index) {
		var id = 'checkList[' + index + '].description';
		var e = document.getElementById(id);
		if (e.value == "") {
			var top = document.getElementById("taskCheckList");
			var li = top.getElementsByTagName("li");
			li[index].remove();
		}
	}

	function addCheckList(checked, desc) {
		var top = document.getElementById("taskCheckList");
		var num = top.getElementsByTagName("li").length;
		var li = document.createElement("li");
		var checkedFlag = (checked == '1') ? 'checked="checked"' : '';
		li.innerHTML = '<input type="checkbox" onClick="doCheck()" name=checkList['
				+ num
				+ '].status '
				+ checkedFlag
				+ '>'
				+ '<input type="text" onchange="delEmpty('
				+ num
				+ ')" style="background-color: #F8F6F2; border-width: 0px; width:90%"'
				+ 'name="checkList['
				+ num
				+ '].description" id="checkList['
				+ num + '].description" value=' + desc + '>';
		console.log(li.innerHTML);
		top.appendChild(li);
		calculateCheckListProgress();
	}

	function calculateCheckListProgress() {
		var liList = document.getElementById("taskCheckList")
				.getElementsByTagName("li");
		var inputList = document.getElementById("taskCheckList")
				.getElementsByTagName("input");
		var inputNum = inputList.length;
		var checkedNum = 0;
		var checkboxTotal = 0;
		for (i = 0; i < inputNum; i++) {
			if (inputList[i].type == "checkbox") {
				if (inputList[i].checked) {
					inputList[i + 1].style.textDecoration = "line-through";
					checkedNum++;
				} else {
					inputList[i + 1].style.textDecoration = "none";
				}
				checkboxTotal++;
			}
		}

		console.log("checkbox:" + checkedNum + "/" + checkboxTotal);
		var p = 0;
		if (checkboxTotal != 0) {
			p = checkedNum * 100 / checkboxTotal;
		}
		var progress = document.getElementById("progressCheckList");
		progress.style.width = p + "%";
	}

	function checkListReset() {
		var list = document.getElementById("taskCheckList")
				.getElementsByTagName("li");
		var len = list.length;
		for (i = 0; i < len; i++) {
			list[0].remove();
		}

		calculateCheckListProgress();
		checkListToIdleMode();
	}

	function enableFieldSet(bool, fieldSet) {
		var x = document.getElementById(fieldSet);
		x.disabled = !bool;
	}

	function editTask(id) {
		document.getElementById("newTaskForm").reset();
		checkListReset();
		if (id == null) {
			$('#myModalLabel').html("新建任务");
		} else {
			fillTaskForm(id);
			$('#myModalLabel').html("任务详情");
		}

		$('#taskModal').modal();
	}

	function taskStatusChange() {
		var status = $("#editTaskStatus").val();
		if (status == "10003") {
			enableFieldSet(true, "taskFinishFieldSet");
		} else {
			if (status == "10002") {
				//切换到正在处理状态设置进度条为5%
				var progress = document.getElementById("progressCheckList");
				console.log("progress:" + progress.style.width);
				if (progress.style.width == "0%") {
					progress.style.width = "5%";
				}
			}
			enableFieldSet(false, "taskFinishFieldSet");
		}
	}

	function showObjectById(id) {
		var ui = document.getElementById(id);
		ui.style.display = "inline";
	}

	function hideObjectById(id) {
		var ui = document.getElementById(id);
		ui.style.display = "none";
	}

	function checkListToInputMode() {
		document.getElementById("inputContent").value = "";
		showObjectById("inputCheckList");
		hideObjectById("addCheckList");
	}

	function checkListToIdleMode() {
		showObjectById("addCheckList");
		hideObjectById("inputCheckList");
	}

	function createNewCheckList() {
		var content = $("#inputContent").val();
		if (content != null && content != "") {
			addCheckList('0', $("#inputContent").val());
		}
		checkListToIdleMode();
	}

	function exportExcel() {
		var id = $("#editTaskId").val();
		console.log("exportExcel:" + id);
		var url = "task_export" + "/" + id;
		window.open(url);
	}

	function doLinkCopy() {
		var link = document.getElementById("editFinishLink");
		link.select();
		document.execCommand("Copy");
	}

	function doTaskUpdate(param) {
		var result = "fail";
		$.ajax({
			type : "POST",
			url : "${ctx}/task/update",
			data : param,
			datatype : "json",
			async : false,
			success : function(data) {
				result = "success";
			},
			error : function(xhr) {
				result = "fail";
			}
		});
		return result;
	}

	function taskTitleChange(id) {
		var title = $("#title_" + id).val();
		var task = {};
		task.id = id;
		task.title = title;

		if (doTaskUpdate(task) == "success") {
			document.getElementById('item_title_' + id).innerHTML = title;
		} else {
			alert("修改未生效！");
		}
	}

	function taskDescChange(id) {
		var desc = $("#desc_input_" + id).val();
		var task = {};
		task.id = id;
		task.description = desc;

		if (doTaskUpdate(task) == "success") {
		} else {
			alert("修改未生效！");
		}
	}

	// textarea 换行 \n，html换行<br /> 
	function taskDescEditMode(id) {
		showObjectById('desc_input_' + id);
		hideObjectById('desc_disp_' + id);

		var desc = document.getElementById("desc_disp_" + id).innerHTML;
		desc = desc.replace(/<br>/g, "\n");
		document.getElementById("desc_input_" + id).value = desc;
		document.getElementById('desc_input_' + id).focus();
	}

	function taskDescDispMode(id) {
		showObjectById('desc_disp_' + id);
		hideObjectById('desc_input_' + id);

		var desc = $("#desc_input_" + id).val();
		desc = desc.replace(/\n/g, "<br />")
		document.getElementById("desc_input_" + id).value = desc;
		document.getElementById("desc_disp_" + id).innerHTML = desc;

		taskDescChange(id);
	}

	function taskDeadlineChange(id) {
		var dateTime = $("#input_deadline_" + id).val();
		var task = {};
		task.id = id;
		task.expectFinishDate = dateTime;

		if (doTaskUpdate(task) == "success") {
		} else {
			alert("修改未生效！");
		}
	}
	
	function taskStatusChange(id) {
		var status = $("#sel_status_" + id).val();
		var task = {};
		task.id = id;
		task.status = status;

		if (doTaskUpdate(task) == "success") {
		} else {
			alert("修改未生效！");
		}
		
		window.location.reload();
	}
	
	function taskProjectChange(id) {
		var project = $("#sel_project_" + id).val();
		var task = {};
		task.id = id;
		task.projectName = project;

		if (doTaskUpdate(task) == "success") {
		} else {
			alert("修改未生效！");
		}
	}

	function newComment() {
	}
</script>
</head>

<body>
	<%@ include file="common/top_navbar.jsp"%>

	<div class="container theme-showcase" role="main">
		<div class="page-header">
			<h3>任务管理</h3>
		</div>

		<form:form id="filterForm" commandName="taskQuery"
			action="${ctx}/task/task_list" method="post" class="form-inline">
			<div class="row breadcrumb" style="margin: 5px 0px; padding: 8px 2px">
				<div class="col-sm-12">
					<label class="radio-inline"> <input
						<c:if test="${statusFilter=='10002'}">checked="checked"</c:if>
						type="radio" value="10002"> 正在处理 <span
						class="badge badge-num" id="status_10002">${number[2]}</span>
					</label> <label class="radio-inline"> <input
						<c:if test="${statusFilter=='10006'}">checked="checked"</c:if>
						type="radio" value="10006"> 暂停 <span
						class="badge badge-num" id="status_10006">${number[4]}</span>
					</label> <label class="radio-inline"> <input
						<c:if test="${statusFilter=='10003'}">checked="checked"</c:if>
						type="radio" value="10003"> 完成 <span
						class="badge badge-num" id="status_10003">${number[3]}</span>
					</label> <label class="radio-inline"> <input
						<c:if test="${statusFilter=='10001'}">checked="checked"</c:if>
						type="radio" value="10001"> 初稿 <span
						class="badge badge-num" id="status_10001">${number[1]}</span>
					</label>

					<div class="form-group" style="margin-left: 50px">
						<form:select onchange="queryFormSubmit();" class="form-control"
							path="queryTask.projectName" id="queryTask.projectName">
							<form:option value="all" label="所有项目" />
							<form:options items="${taskQuery.selectProjects}"
								itemLabel="name" itemValue="name" />
						</form:select>
					</div>

					<div class="form-group">
						<form:select onchange="queryFormSubmit();" class="form-control"
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
								href="#" class="text-center" onclick="editTask();">新建任务</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#" class="text-center">新建项目</a></li>
						</ul>
					</div>
				</div>
			</div>

			<form:hidden path="queryTask.status" id="statusFilter"
				name="statusFilter" />
		</form:form>

		<div class="row">
			<div class="col-sm-12">
				<div id="accordion" class="accordion-style1 panel-group">
					<c:forEach items="${tasks}" var="task" varStatus="states">
						<div class="panel panel-default" id="panel_${task.id}"
							<c:if test="${task.id=='T00000000000000'}">style="display:none"</c:if>>

							<div class="panel-heading">
								<h4 class="panel-title">
									<a class="accordion-toggle collapsed" data-toggle="collapse"
										data-parent="#accordion" href="#collapse_${task.id}">
										&nbsp; <label id="item_title_${task.id}" class="label-title">${task.title}</label>
										<label class="label-project"><span
											class="glyphicon glyphicon-stop glyphicon-project"></span>
											${task.projectName}</label> <label class="label-name"><span
											class="label label-span-name">李</span></label> <label
										class="label-percent"><span
											class="label label-span-percent">${task.progress}</span></label> <label
										class="label-deadline"><span
											class="glyphicon glyphicon-time"></span>
											${task.expectFinishDate}</label>
									</a>
								</h4>
							</div>

							<div class="panel-collapse collapse" id="collapse_${task.id}">
								<div class="panel-body" style="padding: 10px 50px 30px">
									<div class="col-sm-12">
										<div class="col-sm-6">
											<input class="form-control form-control-title"
												id="title_input_${task.id}" type="text"
												onchange="taskTitleChange('${task.id}')"
												value="${task.title}">
										</div>
										<div class="col-sm-1 pull-right">
											<a onclick="delTask('${task.id}');" class="btn btn-delete">X</a>
										</div>
									</div>

									<div class="col-sm-12">
										<hr />
									</div>

									<div class="col-sm-12">
										<div class="col-sm-6">
											<div class="task-desc">
												<a id="desc_disp_${task.id}"
													style="text-decoration: none; font-size: 14px; color: black"
													href="#" onclick="taskDescEditMode('${task.id}')"> <c:if
														test="${empty task.description}">添加需求描述</c:if>${task.description}</a>
												<textarea id="desc_input_${task.id}"
													class="form-control form-control-content"
													onblur="taskDescDispMode('${task.id}')" rows="10">${task.description}</textarea>
											</div>

											<div class="task-assign">
												<ul class="list-inline">
													<li><h5 style="color: #A4A3A2">分配给：</h5></li>
													<li><label class="label-name"><span
															class="label label-span-name">李</span></label></li>
													<li><label class="label-name"><span
															class="label label-span-name">丁</span></label></li>
													<li><label class="label-name"><span
															class="label label-span-name"> + </span></label></li>
												</ul>
											</div>
											<div class="task-follower">
												<ul class="list-inline">
													<li><h5 style="color: #A4A3A2">关注人：</h5></li>
													<li><label class="label-name"><span
															class="label label-span-name">李</span></label></li>
													<li><label class="label-name"><span
															class="label label-span-name">丁</span></label></li>
													<li><label class="label-name"><span
															class="label label-span-name">吴</span></label></li>
													<li><label class="label-name"><span
															class="label label-span-name">陈</span></label></li>
													<li><label class="label-name"><span
															class="label label-span-name"> + </span></label></li>
												</ul>
											</div>
											<div class="task-deadline">
												<div style="float: left">
													<h5 style="color: #A4A3A2">截止日期：</h5>
												</div>
												<input class="form_datetime form-control input-deadline"
													type="text" id="input_deadline_${task.id}"
													onchange="taskDeadlineChange('${task.id}')"
													value="${task.expectFinishDate}">
											</div>
											<div class="task-status">
												<div style="float: left">
													<h5 style="color: #A4A3A2">任务状态：</h5>
												</div>
												<select class="form-control select-status"
													id="sel_status_${task.id}"
													onchange="taskStatusChange('${task.id}')">
													<c:forEach items="${statuses}" var="status">
														<option value="${status.id}"
															<c:if test="${task.status == status.id}">														
																selected="selected"
															</c:if>>${status.name}
														</option>
													</c:forEach>
												</select>
											</div>
											<div class="task-project">
												<div style="float: left">
													<h5 style="color: #A4A3A2">所属项目：</h5>
												</div>
												<select class="form-control select-project"
													id="sel_project_${task.id}"
													onchange="taskProjectChange('${task.id}')">
													<c:forEach items="${projects}" var="project">
														<option value="${project.name}"
															<c:if test="${task.projectName == project.name}">														
																selected="selected"
															</c:if>>${project.name}
														</option>
													</c:forEach>
												</select>
												
											</div>
											<div class="task-file">
												<h5 style="color: #A4A3A2">
													关联附件：<a href=#>+添加</a>
												</h5>
											</div>
										</div>

										<div class="col-sm-6">
											<div class="well"
												style="background-color: #F8F6F2; border-width: 0px; padding: 10px 10px; margin-top: 6px">
												<h5 style="color: #A4A3A2">
													<span class="glyphicon glyphicon-th-list"></span> 分解任务：
												</h5>
												<div class="progress">
													<div class="progress-bar progress-bar-success"
														id="progressCheckList" role="progressbar"
														aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"
														style="width: 0%;"></div>
												</div>

												<ul id="taskCheckList" class="list-unstyled checkbox"
													style="margin-left: 24px">
												</ul>

												<a id="addCheckList" href="#"
													onclick="checkListToInputMode();">+新增检查项</a>

												<div id="inputCheckList" style="display: none">
													<input type="text" class="form-control"
														style="margin: 5px 0px" id="inputContent"
														placeholder="请输入内容">
													<button type="button" onclick="checkListToIdleMode();"
														class="btn btn-default">取消</button>
													<button type="button" onclick="createNewCheckList();"
														class="btn btn-newtask">确认</button>
												</div>
											</div>
										</div>
									</div>

									<div class="col-sm-12 task-comment-head">
										<h5>
											日志与交流：<span
												style="font-size: 8px; color: #e4e3e2; margin-bottom: 0px">在此记录一段有意义的回忆</span>
										</h5>
									</div>
									<div class="col-sm-12">
										<hr />
									</div>

									<div class="col-sm-12 task-comment-item">
										<ul class="list-inline" style="margin-bottom: 2px">
											<li><img class="img-rounded" alt="Brand"
												src="/images/justgun.gif"
												style="height: 35px; width: 35px; margin-top: 10px"></li>
											<li>丁庆发</li>
											<li><p style="color: #A4A3A2">2017-08-09 09:35</p></li>
											<li><span style="margin-left: 40px; color: #A4A3A2">X</span></li>
										</ul>
										<label style="margin-left: 50px">有意义的回忆。</label>

										<textarea class="form-control form-control-comment"
											placeholder="新内容..."></textarea>
										<button type="button" onclick="newComment();"
											style="margin-top: 3px; margin-left: 5px"
											class="btn btn-newtask">发表</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- /span -->
		</div>

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
						<input type="hidden" id="taskId" />
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<a onclick="doDel()" class="btn btn-newtask" data-dismiss="modal">确定</a>
					</div>
				</div>
			</div>
		</div>

		<!-- 新建任务，模态框（Modal） -->
		<form:form id="newTaskForm" commandName="newTaskInfo"
			action="${ctx}/task/task_save" method="post">
			<div class="modal fade" id="taskModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-task">
					<div class="modal-content"
						style="padding: 2px 20px; padding-left: 30px">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel"
								style="font-weight: bold">新建任务</h4>
						</div>
						<div class="modal-body">
							<form role="form" class="form-inline">
								<form:input type="hidden" path="task.id" id="editTaskId" />
								<fieldset id="taskInfoFieldSet">
									<table class="table table-bordered table-condensed">
										<tbody>
											<tr>
												<td class="width-s active" style="vertical-align: middle"><label
													class="pull-right">标题：</label></td>
												<td class="width-l" colspan="3"><form:input
														class="form-control" path="task.title" id="editTaskTitle"
														required="true" /></td>
												<td class="width-l" rowspan="6"><label><span
														class="glyphicon glyphicon-th-list"></span> 分解任务：</label>
													<div class="well"
														style="background-color: #F8F6F2; border-width: 0px; padding: 10px 20px;">
														<form:input type="hidden" path="task.progress"
															id="editTaskProgress" />
														<div class="progress">
															<div class="progress-bar progress-bar-success"
																id="progressCheckList" role="progressbar"
																aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"
																style="width: 0%;"></div>
														</div>

														<ul id="taskCheckList" class="list-unstyled checkbox"
															style="margin-left: 24px">
														</ul>

														<a id="addCheckList" href="#"
															onclick="checkListToInputMode();">+新增检查项</a>

														<div id="inputCheckList" style="display: none">
															<input type="text" class="form-control"
																style="margin: 5px 0px" id="inputContent"
																placeholder="请输入内容">
															<button type="button" onclick="checkListToIdleMode();"
																class="btn btn-default">取消</button>
															<button type="button" onclick="createNewCheckList();"
																class="btn btn-newtask">确认</button>
														</div>
													</div></td>
											</tr>
											<tr>
												<td class="width-s active" style="vertical-align: middle"><label
													class="pull-right">内容：</label></td>
												<td class="width-l" colspan="3"><form:textarea
														class="form-control" path="task.description"
														id="editTaskDescription" rows="5" placeholder="描述需求详情。" />
												</td>
											</tr>
											<tr>
												<td class="width-s active" style="vertical-align: middle"><label
													class="pull-right">所属项目：</label></td>
												<td class="width-m"><form:select class="form-control"
														path="task.projectName" id="editTaskProjectName"
														required="true">
														<form:option value="" label="" />
														<form:options items="${projects}" itemLabel="name"
															itemValue="name" />
													</form:select></td>
												<td class="width-s active" style="vertical-align: middle"><label
													class="pull-right">分配给：</label></td>
												<td class="width-m"><form:select class="form-control"
														path="task.assignTo" id="editTaskAssignTo" required="true">
														<form:option value="" label="" />
														<form:options items="${users}" itemLabel="name"
															itemValue="name" />
													</form:select></td>
											</tr>
											<tr>
												<td class="width-s active" style="vertical-align: middle"><label
													class="pull-right">状态：</label></td>
												<td class="width-m"><form:select class="form-control"
														onchange="taskStatusChange()" path="task.status"
														id="editTaskStatus" required="true">
														<form:option value="" label="" />
														<form:options items="${statuses}" itemLabel="name"
															itemValue="id" />
													</form:select></td>
												<td class="width-s active" style="vertical-align: middle"><label
													class="pull-right">期限：</label></td>
												<td class="width-m"><form:input class="form-control"
														type="date" path="task.expectFinishDate"
														id="editTaskExpectFinishDate" required="true" /></td>
											</tr>
											<tr>
												<td class="width-s active" style="vertical-align: middle"><label
													class="pull-right">附件(3)：</label></td>
												<td class="width-l" colspan="3"><p>test.txt</p></td>
											</tr>
										</tbody>
									</table>
								</fieldset>

								<fieldset id="taskFinishFieldSet">
									<table class="table table-bordered table-condensed"
										id="taskFinishTable">
										<tbody>
											<tr>
												<td class="width-s active" style="vertical-align: middle"><label
													class="pull-right">完成时间：</label></td>
												<td style="width: 60%"><form:input class="form-control"
														type="date" path="task.realFinishDate"
														id="editTaskRealFinishDate" /></td>
												<td
													style="width: 20%; text-align: center; vertical-align: middle;"
													rowspan="4"><img class="img-rounded" alt="Brand"
													src="/images/qrcode.jpg"
													style="height: 160px; width: 160px;"></td>
											</tr>
											<tr>
												<td class="width-s active" style="vertical-align: middle"><label
													class="pull-right">处理说明：</label></td>
												<td style="width: 70%"><form:textarea
														class="form-control" path="task.finishInfo"
														id="editFinishInfo" rows="4" placeholder="说明处理方法和结果" /></td>
											</tr>
											<tr>
												<td class="width-s active" style="vertical-align: middle"><label
													class="pull-right">软件链接：</label></td>
												<td style="width: 70%">
													<div class="input-group">
														<input type="text" name="task.finishLink"
															id="editFinishLink" class="form-control"> <span
															class="input-group-btn">
															<button class="btn btn-default" type="button"
																onClick="doLinkCopy()">
																<span class="glyphicon glyphicon-duplicate"></span>
															</button>
														</span>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</fieldset>
							</form>

							<fieldset id="taskOptFieldSet">
								<table class="table table-bordered table-condensed">
									<tbody>
										<tr>
											<td class="width-s active" style="vertical-align: middle"><label
												class="pull-right">操作：</label></td>
											<td style="width: 90%"><a
												class="btn btn-default btn-opt" onClick="exportExcel()">
													<span class="glyphicon glyphicon-export glyphicon-opt"></span>导出到EXCEL
											</a></td>
										</tr>
									</tbody>
								</table>
							</fieldset>

							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button id="saveTaskButton" type="button"
									onclick="newTaskFormSubmit();" class="btn btn-newtask">保存</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>

	</div>


</body>
</html>
