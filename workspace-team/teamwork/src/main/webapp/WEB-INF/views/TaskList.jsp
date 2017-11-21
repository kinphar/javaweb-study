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
<title>Zootopia</title>
<link rel="shortcut icon" href="/images/monkey.jpg">

<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/task.css" />

<script type="application/javascript" src="/js/jquery.min.js"></script>
<script type="application/javascript" src="/js/bootstrap.min.js"></script>
<script type="application/javascript" src="/js/common.js"></script>

<link rel="stylesheet" href="/css/bootstrap-datetimepicker.min.css" />
<script type="application/javascript"
	src="/js/bootstrap-datetimepicker.min.js"></script>
<script type="application/javascript"
	src="/js/bootstrap-datetimepicker.zh-CN.js"></script>

<link rel="stylesheet" href="/static/icheck/skins/square/green.css" />
<script type="application/javascript" src="/static/icheck/icheck.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		iCheckInit();

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
		});

		$(function() {
			$('.panel-collapse').on('show.bs.collapse', function() {
				var taskId = this.dataset.taskid;
				var className = $(this).attr('class');

				if (className.indexOf("in") >= 0) {
					/* deadline setting; */
				} else {
					updateTaskFromRemote(taskId);
					taskDataDelayLoad(taskId);
				}
			})
		});

		$(".checklist-item-input").blur(function() {
			var subTask = $(this).parent();
			var taskId = subTask.data("taskid");
			var val = $(this).val();
			if (val == "") {
				var itemId = subTask.data("itemid");
				if (itemId != "") {
					deleteSubTask(taskId, subTask); //delete data and ui;
				} else {
					subTask.remove(); //only delete ui;
				}
			}
		});

		$(".checklist-item-input").change(function() {
			var subTask = $(this).parent();
			var content = $(this).val();
			if (content != "") {
				saveSubTask(subTask);
			}
		});

		$("a[class*='btn-delete-comment']").click(function() {
			var commentNode = $(this).parent().parent();
			commentId = commentNode.data("commentid");

			$.ajax({
				type : "POST",
				url : "${ctx}/comment/delete",
				data : {
					commentid : commentId
				},
				datatype : "json",
				async : false,
				success : function(data) {
					console.log("delete comment ok；" + commentId);
					commentNode.remove();
				},
				error : function(xhr) {
				}
			});
		});
	});

	function iCheckInit() {
		$('input').iCheck({
			checkboxClass : 'icheckbox_square-green',
			radioClass : 'iradio_square-green',
			increaseArea : '20%' // optional
		});

		$('input[type="radio"][class="task-select"]').on('ifChecked',
				function(event) {
					var s = event.target.value;
					queryFormSubmitWithStatus(s);
				});

		$('input[type="radio"][class="priority-setting"]').on('ifChecked',
				function(event) {
					var val = event.target.value;
					var taskId = event.target.dataset.taskid;
					var pri = (val == "urgent") ? "1" : "0";

					taskPriorityChange(taskId, pri);
				});

		$('input[type="checkbox"][class="select-all"]').on(
				'ifChecked ifUnchecked',
				function(event) {
					var taskId = event.target.dataset.taskid;
					var prefixId = event.target.dataset.prefixid;
					$boxes = $("#" + prefixId + taskId).find(
							"[type='checkbox']");
					if (event.type == 'ifChecked') {
						$boxes.iCheck('check');
					} else {
						$boxes.iCheck('uncheck');
					}
				});

		$('input[type="checkbox"][class="subtask-finish"]').on(
				'ifChecked ifUnchecked', function(event) {
					var subTaskNode = $(this).parent().parent();
					saveSubTask(subTaskNode);
				});
	}

	function taskDataDelayLoad(id) {
		uiProgressValueSet(id, "0");
		removeOldSubTask(id);
		setTimeout(function() {
			updateSubTaskFromRemote(id)
		}, 200);

		removeAllOldComment(id);
		setTimeout(function() {
			updateCommentFromRemote(id)
		}, 500);
	}

	function iCheckBoxUnbindEvent(id) {
		$('input[type="checkbox"][class="subtask-finish"]').unbind(
				'ifChecked ifUnchecked');
	}

	function saveSubTask(subTaskView) {
		var subTaskData = {};
		subTaskData.id = subTaskView.data("itemid");
		subTaskData.parentId = subTaskView.data("taskid");
		subTaskData.description = subTaskView.find("input[type='text']").get(0).value;
		var check = subTaskView.find("input[type='checkbox']").get(0).checked;
		subTaskData.status = (check == true) ? 1 : 0;

		$.ajax({
			type : "POST",
			url : "${ctx}/task/updateSubTask",
			data : subTaskData,
			datatype : "json",
			async : false,
			success : function(data) {
				console.log("saveSubTask:id=" + data.id);
				subTaskView.data("itemid", data.id);
				taskProgressChange(data.parentId)
			},
			error : function(xhr) {
			}
		});
	}

	function deleteSubTask(taskId, subTaskView) {
		var subTaskData = {};
		subTaskData.id = subTaskView.data("itemid");

		$.ajax({
			type : "POST",
			url : "${ctx}/task/deleteSubTask",
			data : subTaskData,
			datatype : "json",
			async : false,
			success : function(data) {
				console.log("deleteSubTask:" + subTaskData.id + ";"
						+ data.result);
				subTaskView.remove();
				taskProgressChange(taskId);
			},
			error : function(xhr) {
				alert("删除未生效！");
			}
		});
	}

	function updateSubTaskFromRemote(id) {
		$.ajax({
			type : "GET",
			url : "${ctx}/task/get_subtask",
			data : {
				taskid : id
			},
			async : true,
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				console.log("subTask:len=" + data.length);
				var len = data.length;
				if (len > 0) {
					iCheckBoxUnbindEvent();
					for (var i = 0; i < data.length; i++) {
						restoreSubTask(data[i].id, data[i].parentId,
								data[i].status, data[i].description);
					}
					iCheckInit();
					updateTaskProgress(id);
				}
			},
			error : function(xhr) {
			}
		});
	}

	function updateCommentFromRemote(id) {
		$.ajax({
			type : "GET",
			url : "${ctx}/comment/get",
			data : {
				taskid : id
			},
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				console.log("comment:len=" + data.length);
				var len = data.length;
				if (len > 0) {
					for (var i = 0; i < len; i++) {
						uiCommentInsertNew(data[i]);
					}
				}
			},
			error : function(xhr) {
			}
		});
	}

	function saveSelectUsers(nodePrefix, taskId) {
		var userSelected = "";
		$("#" + nodePrefix + taskId).find("[type='checkbox']").each(
				function() {
					if ($(this).is(':checked')
							&& $(this).attr('class') != "select-all") {
						if (userSelected != "") {
							userSelected += ";";
						}
						userSelected += $(this).val();
					}
				})

		//do save.
		var task = {};
		task.id = taskId;
		if (nodePrefix.indexOf("processor") >= 0) {
			task.assignTo = userSelected;
		} else if (nodePrefix.indexOf("follower") >= 0) {
			task.follower = userSelected;
		}

		if (doTaskUpdate(task) == "success") {
			updateUserGroup(nodePrefix + taskId, userSelected);
			if (nodePrefix.indexOf("processor") >= 0) {
				updatePanelheadProcessor(taskId, userSelected);
			}
		} else {
			alert("修改未生效！");
		}
	}

	function updatePanelheadProcessor(taskId, userActived) {
		$("#panel-head-processor_" + taskId).find("img").each(function() {
			$(this).remove();
		})

		var parent = document.getElementById("panel-head-processor_" + taskId);
		var userArray = userActived.split(";");
		for (var i = 0; i < userArray.length; i++) {
			if (userArray[i] != "") {
				var userChild = document.createElement("img");
				userChild.setAttribute('class', 'img-circle photo-small');
				var photo = getPhotoByEmail(userArray[i]);
				userChild.setAttribute('src', photo);
				parent.appendChild(userChild);
			}
		}
	}

	function dispSelectUsers(nodePrefix, taskId) {
		var activeUsers = "";
		$("#" + nodePrefix + taskId).find("img").each(function() {
			activeUsers += $(this).attr("value") + ";";
		})

		$("#" + nodePrefix + taskId).find("[type='checkbox']").each(function() {
			var userName = $(this).val();
			if (activeUsers.indexOf(userName) >= 0) {
				$(this).iCheck('check');
			} else {
				$(this).iCheck('uncheck');
			}
		})
	}

	function removeAlluser(parent) {
		var children = parent.childNodes;

		for (var i = children.length - 1; i >= 0; i--) {
			if (children[i].className == "user") {
				parent.removeChild(children[i]);
			}
		}
	}

	function findAddUserNode(parent) {
		var children = parent.childNodes;
		for (var i = children.length - 1; i >= 0; i--) {
			var className = children[i].className + "";
			if (className.indexOf("edit-user-btn") >= 0) {
				return children[i];
			}
		}
		return null;
	}

	function updateUserGroup(id, userInfo) {
		var parent = document.getElementById(id);
		removeAlluser(parent);

		var addUserBtnChild = findAddUserNode(parent);
		var userArray = userInfo.split(";");

		for (var i = 0; i < userArray.length; i++) {
			var userChild = document.createElement("li");
			userChild.setAttribute('class', 'user');
			if (userArray[i] != "") {
				var photo = getPhotoByEmail(userArray[i]);
				userChild.innerHTML = '<img class="img-circle photo-medium" value="'
					+ userArray[i]
					+ '" src="'
				 	+ photo 
				 	+ '">'
				parent.insertBefore(userChild, addUserBtnChild);
			}
		}
	}

	function getValidNodes(parentNode) {
		var sub_child = parentNode.childNodes;
		//文本节点并且是空的文本节点时，将空文本节点删除
		for (var i = 0; i < sub_child.length; i++) {
			if (sub_child[i].nodeType == '3'
					&& sub_child[i].nodeName == '#text'
					&& !/\S/.test(sub_child[i].nodeValue)) {
				parentNode.removeChild(sub_child[i]);
			}
		}
		return parentNode.childNodes;
	}

	function getPhotoByEmail(email) {
		var photo = null;
		<c:forEach items="${users}" var="user">
		if (email == "${user.email}") {
			return "${user.photo}"
		}
		</c:forEach>
		return null;
	}

	function getRealNameByEmail(email) {
		var name = null;
		<c:forEach items="${users}" var="user">
		if (email == "${user.email}") {
			return "${user.name}"
		}
		</c:forEach>
		return null;
	}

	function queryFormSubmit() {
		document.getElementById("statusFilter").value = "10002";
		var form = document.getElementById("filterForm");
		form.submit();
	}
	function queryFormSubmitWithStatus(s) {
		document.getElementById("statusFilter").value = s;
		var form = document.getElementById("filterForm");
		form.submit();
	}

	function delTask(id) {
		$('#taskIdDeleting').val(id); //给会话中的隐藏属性URL赋值  
		$('#delcfmModel').modal(); //显示对话框
	}

	function newCommentShow(id) {
		$('#newCommentModel').data("taskid", id);
		$('#newCommentModel').find("textarea:first").val("");
		$('#newCommentModel').modal(); //显示对话框
		$('#newCommentModel').data("taskid", id);
	}

	function add0(val) {
		return (val < 10) ? '0' + val : val;
	}

	function timeStamp2Date(timeStamp) {
		var date = new Date(timeStamp);
		var y = date.getFullYear();
		var m = date.getMonth() + 1;
		var d = date.getDate();
		var h = date.getHours();
		var mm = date.getMinutes();
		var s = date.getSeconds();
		var time = y + '-' + add0(m) + '-' + add0(d) + ' ' + add0(h) + ':'
				+ add0(mm) + ':' + add0(s);
		return time;
	}

	function newCommentSave() {
		var id = $('#newCommentModel').data("taskid");
		var content = $('#newCommentModel').find("textarea").first().val();
		content = content.replace(/\n/g, "<br />");
		console.log("newCommentSave:" + id + "; " + content);

		var comment = {};
		comment.parentId = id;
		comment.description = content;
		comment.category = "task";

		$.ajax({
			type : "POST",
			url : "${ctx}/comment/new",
			data : comment,
			datatype : "json",
			async : false,
			success : function(data) {
				uiCommentInsertNew(data);
			},
			error : function(xhr) {
			}
		});
	}

	function removeAllOldComment(id) {
		$("#list-comment_" + id).children("li").each(function() {
			if ($(this).css("display") != "none") {
				$(this).remove();
			}
		});
	}

	function uiCommentInsertNew(comment) {
		var parent = $("#list-comment_" + comment.parentId);
		var newComment = parent.children(".comment-seed").clone(true);
		var userPhoto = getPhotoByEmail(comment.createBy)
		var userName = getRealNameByEmail(comment.createBy);
		var date = timeStamp2Date(comment.createDate);

		newComment.attr("class", "comment-item")
		newComment.data("commentid", comment.id);
		newComment.find("img").attr("src", userPhoto);
		newComment.find(".user-info").html('User: ' + userName + ' on ' + date);
		newComment.find(".comment-content").html(comment.description);
		newComment.css("display", "block");

		var topComment = parent.children("li:first");
		$(newComment).insertBefore(topComment);
	}

	function doDelTask() {
		var id = document.getElementById('taskIdDeleting').value;
		$.ajax({
			type : "POST",
			url : "${ctx}/task/delete",
			data : {
				taskid : id
			},
			success : function(data) {
				$("#panel_" + data.id).remove();
				$("#status_" + data.status).html(data.statusNum)
			},
			error : function(xhr) {
			}
		});
	}

	function updateTaskFromRemote(id) {
		$.ajax({
			type : "GET",
			url : "${ctx}/task/get",
			data : {
				taskid : id
			},
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				updateUserGroup("list-processor_" + id, data.assignTo);
				updateUserGroup("list-follower_" + id, data.follower);
				updateTaskPriority("priority-setting_" + id, data.priority);
			},
			error : function(xhr) {
			}
		});
	}

	function updateTaskPriority(id, pri) {
		var radios = $("#" + id).find("input[type='radio']");
		if (pri == "1") {
			radios.last().iCheck('check');
		} else {
			radios.first().iCheck('check');
		}
	}

	function createNewTask() {
		$('#taskModal').modal();
	}

	function createNewProject() {
		$('#projectModal').modal();
	}

	function newTaskFormSubmit() {
		var f = document.getElementById("newTaskForm");
		if (checkNewTaskFrom(f) == true) {
			var desc = f.description.value;
			desc = desc.replace(/\n/g, "<br />");
			f.description.value = desc;
			f.submit();
		}
	}

	function newProjectFormSubmit() {
		var f = document.getElementById("newProjectForm");
		if (checkNewProjectFrom(f) == true) {
			f.submit();
		}
	}

	function checkNewProjectFrom(form) {
		if (form.title.value == '') {
			form.title.focus();
			return false;
		}
		if (form.projectManager.value == '') {
			form.projectManager.focus();
			return false;
		}
		return true;
	}

	function checkNewTaskFrom(form) {
		if (form.title.value == '') {
			form.title.focus();
			return false;
		}
		if (form.projectName.value == '') {
			form.projectName.focus();
			return false;
		}
		if (form.assignTo.value == '') {
			form.assignTo.focus();
			return false;
		}
		if (form.status.value == '') {
			form.status.focus();
			return false;
		}
		if (form.expectFinishDate.value == '') {
			form.expectFinishDate.focus();
			return false;
		}
		return true;
	}

	function showObjectById(id) {
		var ui = document.getElementById(id);
		ui.style.display = "inline";
	}

	function hideObjectById(id) {
		var ui = document.getElementById(id);
		ui.style.display = "none";
	}

	function removeOldSubTask(id) {
		$("#taskCheckList_" + id).children("li").each(function() {
			if ($(this).css("display") != "none") {
				$(this).remove();
			}
		});
	}

	function restoreSubTask(id, taskId, status, content) {
		var parentId = 'taskCheckList_' + taskId;
		var cloneItem = $("ul[id=" + parentId + "] li:first").clone(true);
		cloneItem.css('display', 'block');
		cloneItem.data('itemid', id);
		cloneItem.find('input[type="text"]').first().val(content);
		cloneItem.find('input[type="checkbox"]').first().iCheck(
				status == 1 ? 'check' : 'uncheck');
		$("#" + parentId).append(cloneItem);

		console.log("restoreSubTask:" + id);
	}

	function createSubTask(id) {
		var parentId = 'taskCheckList_' + id;
		var cloneItem = $("ul[id=" + parentId + "] li:first").clone(true);
		cloneItem.css('display', 'block');
		$("#" + parentId).append(cloneItem);
		iCheckInit();

		cloneItem.children(".checklist-item-input").focus();
	}

	function calcTaskProgressByCheck(id) {
		var checkedNum = 0;
		var totalNum = 0;
		$("#taskCheckList_" + id).find("li").each(
				function() {
					var display = $(this).css("display");
					if (display == "block") {
						var checked = $(this).find("input[type='checkbox']")
								.get(0).checked;
						if (checked == true) {
							checkedNum++;
						}
						totalNum++;
					}
				});

		var p = 0;
		if (totalNum != 0) {
			p = parseInt(checkedNum * 100 / totalNum);
		}
		console.log("progress:" + checkedNum + "/" + totalNum + ";" + p + "%");

		return p;
	}

	function taskProgressChange(id) {
		var p = calcTaskProgressByCheck(id);
		var task = {};
		task.id = id;
		task.progress = p + "%";

		if (doTaskUpdate(task) == "success") {
			uiProgressValueSet(id, p);
		} else {
			alert("修改未生效！");
		}
	}

	function updateTaskProgress(id) {
		var p = calcTaskProgressByCheck(id);
		uiProgressValueSet(id, p);
	}

	function uiProgressValueSet(taskId, p) {
		var pStr = p + "%";
		$("#sub-task-progress_" + taskId).css("width", pStr);
		$("#panel-head-progress_" + taskId).html(
				'<span	class="label label-span-percent">' + pStr + '</span>');
	}

	function exportExcel(id) {
		var url = "export" + "/" + id;
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
		var title = $("#title_input_" + id).val();
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
	function taskDescEditMode(id, content) {
		showObjectById('desc_input_' + id);
		hideObjectById('desc_disp_' + id);

		console.log("content:" + content);
		if (content != "") {
			var desc = document.getElementById("desc_disp_" + id).innerHTML;
			desc = desc.replace(/<br>/g, "\n");
			document.getElementById("desc_input_" + id).value = desc;
		} 
		document.getElementById('desc_input_' + id).focus();
	}

	function taskDescDispMode(id) {
		showObjectById('desc_disp_' + id);
		hideObjectById('desc_input_' + id);

		var desc = $("#desc_input_" + id).val();
		if (desc == "") {
			desc = "添加需求描述";
			document.getElementById("desc_disp_" + id).innerHTML = desc;
		} else {
			desc = desc.replace(/\n/g, "<br />");
			document.getElementById("desc_input_" + id).value = desc;
			document.getElementById("desc_disp_" + id).innerHTML = desc;
		}

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

	function taskPriorityChange(id, pri) {
		var dateTime = $("#input_deadline_" + id).val();
		var task = {};
		task.id = id;
		task.priority = pri;

		if (doTaskUpdate(task) == "success") {
			var display = (pri == "1") ? "inline" : "none";
			$("#item_title_" + id).find("span").css("display", display);
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
		
		window.location.reload();
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
			action="${ctx}/task/list" method="post" class="form-inline">
			<div class="row breadcrumb" style="margin: 5px 0px; padding: 8px 2px">
				<div class="col-sm-12">
					<label class="radio-inline"> <input
						<c:if test="${statusFilter=='10002'}">checked="checked"</c:if>
						class="task-select" type="radio" value="10002"> 正在处理 <span
						class="badge badge-num" id="status_10002">${number[2]}</span>
					</label> <label class="radio-inline"> <input
						<c:if test="${statusFilter=='10006'}">checked="checked"</c:if>
						class="task-select" type="radio" value="10006"> 暂停 <span
						class="badge badge-num" id="status_10006">${number[4]}</span>
					</label> <label class="radio-inline"> <input
						<c:if test="${statusFilter=='10003'}">checked="checked"</c:if>
						class="task-select" type="radio" value="10003"> 完成 <span
						class="badge badge-num" id="status_10003">${number[3]}</span>
					</label> <label class="radio-inline"> <input
						<c:if test="${statusFilter=='10001'}">checked="checked"</c:if>
						class="task-select" type="radio" value="10001"> 初稿 <span
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
								itemValue="email" />
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
								href="#" class="text-center" onclick="createNewTask();">新建任务</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1"
								href="#" class="text-center" onclick="createNewProject();">新建项目</a></li>
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
						<div class="panel panel-default" id="panel_${task.id}">

							<div class="panel-heading">
								<h4 class="panel-title">
									<a class="accordion-toggle collapsed" data-toggle="collapse"
										data-parent="#accordion" href="#collapse_${task.id}">&nbsp;
										<label id="item_title_${task.id}" class="label-title">${task.title}
											<span class="glyphicon glyphicon-fire glyphicon-fire-title"
											<c:if test="${task.priority == '1'}">style="display:inline"</c:if>>
										</span>
									</label> <label class="label-project"><span
											class="glyphicon glyphicon-stop glyphicon-project"></span>
											${task.projectName} </label> <label class="label-name"
										id="panel-head-processor_${task.id}"> <c:forEach
												items="${users}" var="user" varStatus="status">
												<c:if
													test="${fn:contains(task.assignTo, user.email)}">
													<img class="img-circle photo-small" src="${user.photo}">
												</c:if>
											</c:forEach>
									</label> <label class="label-percent"
										id="panel-head-progress_${task.id}"> <span
											class="label label-span-percent">${task.progress} </span>
									</label> <label class="label-deadline"> <span
											class="glyphicon glyphicon-time"></span>
											${task.expectFinishDate}
									</label>
									</a>
								</h4>
							</div>

							<div class="panel-collapse collapse" id="collapse_${task.id}"
								data-taskid="${task.id}">
								<div class="panel-body" style="padding: 10px 50px 30px">
									<div class="col-sm-12">
										<div class="col-sm-6">
											<input class="form-control form-control-title"
												id="title_input_${task.id}" type="text"
												onchange="taskTitleChange('${task.id}')"
												value="${task.title}">
										</div>
										<div class="col-sm-1 pull-right">
											<button type="button" class="close"
												onclick="delTask('${task.id}');" aria-hidden="true">×</button>
										</div>
									</div>

									<div class="col-sm-12">
										<hr />
									</div>

									<div class="col-sm-12">
										<div class="col-sm-6">
											<div class="task-desc">
												<a id="desc_disp_${task.id}"
													style="text-decoration: none; font-size: 14px; color: #0E76BD;"
													href="javascript:void(0)" onclick="taskDescEditMode('${task.id}', '${task.description}')"> <c:if
														test="${empty task.description}">添加需求描述</c:if>${task.description}</a>
												<textarea id="desc_input_${task.id}"
													class="form-control form-control-content"
													onblur="taskDescDispMode('${task.id}')" rows="10">${task.description}</textarea>
											</div>

											<div class="task-assign">
												<ul class="list-inline" id="list-processor_${task.id}">
													<li class="title"><h5 style="color: #A4A3A2">分配给：</h5></li>
													<li class="dropdown circle edit-user-btn"><a href="#"
														class="dropdown-toggle circle-text" data-toggle="dropdown"
														onclick="dispSelectUsers('list-processor_', '${task.id}');">
															<span class="glyphicon glyphicon-pencil"></span>
													</a>
														<ul class="dropdown-menu" style="padding: 8px 0px">
															<li style="margin-left: 10px"><input type="checkbox"
																class="select-all" data-taskid="${task.id}"
																data-prefixid="list-processor_"> 全有/全无</li>
															<li class="divider divider-related-user"></li>
															<c:forEach items="${users}" var="user">
																<li style="margin: 5px 10px"><input type="checkbox"
																	value="${user.email}"
																	<c:if test="${fn:contains(task.assignTo, user.email)}">checked="checked"</c:if>>
																	${user.name}</li>
															</c:forEach>
															<li class="divider divider-related-user"></li>
															<li style="text-align: center"><button type="button"
																	onclick="saveSelectUsers('list-processor_', '${task.id}');"
																	class="btn btn-saveUsers">保存</button></li>
														</ul></li>
												</ul>
											</div>

											<div class="task-follower">
												<ul class="list-inline" id="list-follower_${task.id}">
													<li><h5 style="color: #A4A3A2">关注人：</h5></li>
													<li class="dropdown circle edit-user-btn"><a href="#"
														class="dropdown-toggle circle-text" data-toggle="dropdown"
														onclick="dispSelectUsers('list-follower_', '${task.id}');">
															<span class="glyphicon glyphicon-pencil"></span>
													</a>
														<ul class="dropdown-menu" style="padding: 8px 0px">
															<li style="margin-left: 10px"><input type="checkbox"
																class="select-all" data-taskid="${task.id}"
																data-prefixid="list-follower_"> 全有/全无</li>
															<li class="divider divider-related-user"></li>
															<c:forEach items="${users}" var="user">
																<li style="margin: 5px 10px"><input type="checkbox"
																	value="${user.email}"
																	<c:if test="${fn:contains(task.follower, user.email)}">checked="checked"</c:if>>
																	${user.name}</li>
															</c:forEach>
															<li class="divider divider-related-user"></li>
															<li style="text-align: center"><button type="button"
																	onclick="saveSelectUsers('list-follower_', '${task.id}');"
																	class="btn btn-saveUsers">保存</button></li>
														</ul></li>
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
											<div class="task-priority">
												<div style="float: left">
													<h5 style="color: #A4A3A2">紧急程度：</h5>
												</div>
												<div style="padding-top: 6px"
													id="priority-setting_${task.id}">
													<label class="radio-inline"> <input type="radio"
														class="priority-setting" name="prioritySetting"
														value="normal" data-taskid="${task.id}"> 正常
													</label> <label class="radio-inline"> <input type="radio"
														class="priority-setting" name="prioritySetting"
														value="urgent" data-taskid="${task.id}"> 紧急
													</label>
												</div>
											</div>

											<div class="task-file">
												<h5 style="color: #A4A3A2">
													关联附件： <span class="label label-default">hello.txt</span>
												</h5>
											</div>

											<div class="task-operation">
												<h5 style="color: #A4A3A2">
													可用操作： <a class="btn btn-default btn-opt"
														onClick="exportExcel('${task.id}')"> <span
														class="glyphicon glyphicon-export glyphicon-opt"></span>导出Excel
													</a> <a class="btn btn-default btn-opt"
														onClick="addAttachment('${task.id}')"> <span
														class="glyphicon glyphicon-paperclip glyphicon-opt"></span>添加文件
													</a>
												</h5>
											</div>
										</div>

										<div class="col-sm-6">
											<div class="task-split-title">
												<h5 style="color: #A4A3A2">
													<span class="glyphicon glyphicon-th-list"></span> 分解任务：
												</h5>
											</div>

											<div class="well well-checklist">
												<div class="progress">
													<div class="progress-bar progress-bar-success"
														id="sub-task-progress_${task.id}" role="progressbar"
														aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"
														style="width: 0%;"></div>
												</div>

												<div class="subtask-list">
													<ul id="taskCheckList_${task.id}" class="list-unstyled">
														<li class="checklist-item" data-taskid="${task.id}"
															data-itemid=""><input type="checkbox"
															class="subtask-finish"> <input type="text"
															class="checklist-item-input" value=""></li>
													</ul>
												</div>

												<div style="margin-left: 10px">
													<a id="addCheckList_${task.id}" href="javascript:void(0)"
														onclick="createSubTask('${task.id}')">+Add+</a>
												</div>
											</div>
										</div>
									</div>

									<div class="col-sm-12 task-comment-head">
										<div style="float: left">
											<h5>
												日志与交流：<span
													style="font-size: 8px; color: #e4e3e2; margin-bottom: 0px">在此记录一段有意义的回忆</span>
											</h5>
										</div>
										<div class="pull-right"
											style="margin-top: 5px; margin-right: 40px">
											<a class="btn btn-default btn-opt"
												onclick="newCommentShow('${task.id}')"><span
												class="glyphicon glyphicon-bullhorn glyphicon-opt"></span>+
											</a>
										</div>
									</div>
									<div class="col-sm-12">
										<hr />
									</div>

									<div class="col-sm-12 task-comment-item">
										<ul class="recent-comments" id="list-comment_${task.id}">
											<li class="comment-seed" style="display: none">
												<div class="user-thumb">
													<img class="img-circle img-thumb" alt="User" src="">
												</div>
												<div class="comments">
													<span class="user-info"></span>
													<p>
														<a class="comment-content"></a>
													</p>
													<a class="btn btn-default btn-opt btn-delete-comment">
														<span class="glyphicon glyphicon-remove glyphicon-opt"></span>Delete
													</a>
												</div>
											</li>
										</ul>
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
						<label class="text-center">确定删除该任务吗？</label>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="taskIdDeleting" />
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<a onclick="doDelTask()" class="btn btn-newtask"
							data-dismiss="modal">确定</a>
					</div>
				</div>
			</div>
		</div>

		<!-- 新建任务，模态框（Modal） -->
		<form:form id="newTaskForm" commandName="newTask"
			action="${ctx}/task/new" method="post">
			<div class="modal modal-task fade" id="taskModal" tabindex="-1"
				role="dialog" aria-labelledby="taskModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-task">
					<div class="modal-content" style="padding: 0px 10px">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="taskModalLabel"
								style="font-weight: bold">新建任务</h4>
						</div>
						<div class="modal-body">
							<form role="form" class="form-inline">
								<table class="table table-condensed">
									<tbody>
										<tr>
											<td class="new-task-subject"><p class="pull-right">标题：</p></td>
											<td class="new-task-content"><form:input
													class="form-control" path="title" style="width:90%"
													required="true" /></td>
										</tr>
										<tr>
											<td class="new-task-subject"><p class="pull-right">内容：</p></td>
											<td class="new-task-content"><form:textarea
													class="form-control" path="description" style="width:90%"
													rows="6" placeholder="描述需求详情。" /></td>
										</tr>
										<tr>
											<td class="new-task-subject"><p class="pull-right">所属项目：</p></td>
											<td class="new-task-content"><form:select
													class="form-control" path="projectName" style="width:36%"
													required="true">
													<form:option value="" label="" />
													<form:options items="${projects}" itemLabel="name"
														itemValue="name" />
												</form:select></td>
										</tr>
										<tr>
											<td class="new-task-subject"><p class="pull-right">分配给：</p></td>
											<td class="new-task-content"><form:select
													class="form-control" path="assignTo" style="width:36%"
													required="true">
													<form:option value="" label="" />
													<form:options items="${users}" itemLabel="name"
														itemValue="email" />
												</form:select></td>
										</tr>
										<tr>
											<td class="new-task-subject"><p class="pull-right">状态：</p></td>
											<td class="new-task-content"><form:select
													class="form-control" path="status" style="width:36%"
													required="true">
													<form:options items="${statuses}" itemLabel="name"
														itemValue="id" />
												</form:select></td>
										<tr>
											<td class="new-task-subject"><p class="pull-right">Deadline：</p></td>
											<td class="new-task-content"><form:input
													class="form-control" type="date" path="expectFinishDate"
													style="width:36%" required="true" /></td>
										</tr>
										<tr>
											<td class="new-task-subject"><p class="pull-right">附件：</p></td>
											<td class="new-task-content"><p>test.txt</p></td>
										</tr>
									</tbody>
								</table>
							</form>

							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-newtask"
									onclick="newTaskFormSubmit();">提交</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>

		<!-- 新建项目，模态框（Modal） -->
		<form:form id="newProjectForm" commandName="newProject"
			action="${ctx}/project/new" method="post">
			<div class="modal modal-project fade" id="projectModal" tabindex="-1"
				role="dialog" aria-labelledby="projectModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-project">
					<div class="modal-content" style="padding: 0px 10px">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="projectModalLabel"
								style="font-weight: bold">新建项目</h4>
						</div>
						<div class="modal-body">
							<form role="form" class="form-inline">
								<table class="table table-condensed">
									<tbody>
										<tr>
											<td class="new-project-subject"><p class="pull-right">名称：</p></td>
											<td class="new-project-content"><form:input
													class="form-control" path="name" style="width:90%"
													required="true" /></td>
										</tr>
										<tr>
											<td class="new-project-subject"><p class="pull-right">内容：</p></td>
											<td class="new-project-content"><form:textarea
													class="form-control" path="description" style="width:90%"
													rows="6" placeholder="描述项目需求详情。" /></td>
										</tr>
										<tr>
											<td class="new-project-subject"><p class="pull-right">项目经理：</p></td>
											<td class="new-project-content"><form:select
													class="form-control" path="projectManager"
													style="width:36%" required="true">
													<form:option value="" label="" />
													<form:options items="${users}" itemLabel="name"
														itemValue="email" />
												</form:select></td>
										</tr>
										<tr>
											<td class="new-project-subject"><p class="pull-right">附件：</p></td>
											<td class="new-project-content"><p>test.txt</p></td>
										</tr>
									</tbody>
								</table>
							</form>

							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-newProject"
									onclick="newProjectFormSubmit();">提交</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>


		<!-- 新留言 -->
		<div class="modal modal-comment fade" id="newCommentModel">
			<div class="modal-dialog">
				<div class="modal-content message_align">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title">新增留言</h4>
					</div>
					<div class="modal-body">
						<textarea class="form-control" rows="10" placeholder="说点什么..."></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<a onclick="newCommentSave()" class="btn btn-newtask"
							data-dismiss="modal">发表</a>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>
