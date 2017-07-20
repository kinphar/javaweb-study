<%@ include file="common/IncludeHead.jsp"%>
<link href="../css/my.css" rel="stylesheet">
<%@ include file="common/IncludeNavbar.jsp"%>

<div id="Content" class="container">
						
	<nav class="navbar navbar-default" role="navigation">
	    <div class="container-fluid">
		    <div class="navbar-header">
		        <a class="navbar-brand" href="#"></a>
		    </div>
		    <div>
		        <ul class="nav navbar-nav">
		            <li><a href="#">未分配</a></li>
		            <li class="active"><a href="#">正在处理</a></li>
		            <li><a href="#">已完成</a></li>
		            <li><a href="#">已归档</a></li>
		            
		        </ul>
		        
		        <ul class="nav navbar-nav navbar-right">
		        	<li>
			        	<div class="btn-group">
						  <button class="btn btn-success"><i class="icon-star"></i> 新建任务</button>
						  <button data-toggle="dropdown" class="btn btn-success dropdown-toggle"><span class="caret"></span></button>
						  <ul class="dropdown-menu">
							<li><a href="#">新建任务</a></li>
				            <li role="separator" class="divider"></li>
				            <li><a href="#">新建项目</a></li>
				            <li role="separator" class="divider"></li>
				            <li><a href="#">新建其他</a></li>
						  </ul>
						</div><!-- /btn-group -->
					</li>
			    </ul>  
		    </div>
	    </div>
	</nav>
	
	<button class="btn btn-inverse"><span class="glyphicon glyphicon-star"></span> Update</button>
	<button class="btn btn-primary"><i class="icon-pencil icon-white"></i> Edit</button>
	<button class="btn btn-danger"><i class="icon-remove icon-white"></i> Delete</button>
	<button type="button" class="btn btn-default">
        <span class="glyphicon glyphicon-sort-by-attributes"></span>
    </button>
	
	<div class="alert alert-info">
		This page demonstrates a jQuery calendar plugin. Try to add a new event!
		<a href="#" class="close" data-dismiss="alert">×</a>
	</div>
		
    <c:forEach items="${taskMap}" var="taskEntry">
        <div id="task_${taskEntry.key}" class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading">
                <%--${taskEntry.value.taskname}--%>
                <ul id="taskInfo" class="list-inline">
                    <li><a href="${pageContext.request.contextPath}/task/editTaskForm?taskid=${taskEntry.key}&action=edit">【20170629-001】魔镜项目第二阶段</a></li>
                    <li>【预研】</li>
                    <li>Deadline:20170/06/30</li>
                    <li class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
		                    <!--<b class="caret"></b>-->
		                    <span class="caret"></span>
		                </a>
		                <ul class="dropdown-menu">
		                    <li><a href="#">填写进度</a></li>
		                    <li class="divider"></li>
		                    <li><a href="#">编辑</a></li>
		                    <li class="divider"></li>
		                    <li><a href="#">删除</a></li>
		                    <li class="divider"></li>
		                    <li><a href="#">更多操作</a></li>
		                </ul>
	            	</li>
                </ul>
            </div>
            <div class="panel-body">
                <dl class="dl-horizontal">
                    <dt>任务id</dt>
                    <dd>${taskEntry.key}</dd>
                    <dt>执行人</dt>
                    <dd>${taskEntry.value.owner}</dd>
                    <dt>用例已分配?</dt>
                    <c:if test="${taskEntry.value.prepared == true}">
                        <dd>YES</dd>
                    </c:if>
                    <c:if test="${taskEntry.value.prepared == false}">
                        <dd>NO</dd>
                    </c:if>
                    <dt>任务已完成?</dt>
                    <c:if test="${taskEntry.value.taskdone == true}">
                        <dd id="taskdone_${taskEntry.key}">YES</dd>
                    </c:if>
                    <c:if test="${taskEntry.value.taskdone == false}">
                        <dd id="taskdone_${taskEntry.key}">NO</dd>
                    </c:if>
                    <dt>任务评分</dt>
                    <dd id="taskscore_${taskEntry.key}">${taskEntry.value.taskscore}</dd>
                    <dt>创建人</dt>
                    <dd>${taskEntry.value.creator}</dd>
                    <dt>修改人</dt>
                    <dd>${taskEntry.value.modifier}</dd>
                </dl>
            </div>
            <!-- <div class="panel-footer"></div> -->            
        </div>
    </c:forEach>
</div>

<img src="/images/sdog.jpg" class="img-circle">

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            带有 title 的面板标题1
        </h3>
    </div>
    <div class="panel-body">
        面板内容
    </div>
</div>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            带有 title 的面板标题2
        </h3>
    </div>
    <div class="panel-body">
        面板内容
    </div>
</div>

<div class="progress">
    <div class="progress-bar" role="progressbar" aria-valuenow="60" 
        aria-valuemin="0" aria-valuemax="100" style="width: 40%;">
        <span class="sr-only">40% 完成</span>
    </div>
</div>

<%@ include file="common/IncludeJsVendor.jsp"%>
<script type="text/javascript">
    $(document).ready(function() {
        $(".del").click(function () {
            var link = $(this);
            $.ajax({
                type: "POST",
                url:"${pageContext.request.contextPath}/task/delTask",
                data: {
                    taskid: link.data("id")
                },
                success: function (resp) {
                    $("#task_" + resp).remove();
                },
                error: function (xhr) {
                }
            });
            return false;
        });

        $(".casedone").click(function () {
            var link = $(this);
            $.ajax({
                type: "POST",
                url:"${pageContext.request.contextPath}/taskcase/casedone",
                data: {
                    taskid: link.data("taskid"),
                    caseid: link.data("caseid")
                },
                success: function (resp) {
                    $("#casedone_" + resp).prop('checked', true);
                },
                error: function (xhr) {
                }
            });
            return false;
        });

        $(".good").click(function () {
            var link = $(this);
            var taskid = link.data("taskid");
            var caseid = link.data("caseid")
            $.ajax({
                type: "POST",
                url:"${pageContext.request.contextPath}/taskcase/goodcasescore",
                data: {
                    taskid: taskid,
                    caseid: caseid
                },
                success: function (resp) {
                    var img = '<img class="img_' + taskid + '" src="/images/good.png" />'
                    $("#casescore_" + resp).html('');
                    $("#casescore_" + resp).append(img);

                    if ($("#task_" + taskid + " .img_" + taskid).length === $("#casescore_" + resp).parent().siblings().size()) {
                        $.ajax({
                            type: "POST",
                            url:"${pageContext.request.contextPath}/task/taskscore",
                            data: {
                                taskid: taskid
                            },
                            success: function (resp) {
                                $("#taskdone_" + taskid).html("YES");
                                $("#taskscore_" + taskid).html(resp);
                            },
                            error: function (xhr) {
                            }
                        });
                    }
                },
                error: function (xhr) {
                }
            });

            return false;
        });

        $(".bad").click(function () {
            var link = $(this);
            var taskid = link.data("taskid");
            var caseid = link.data("caseid")
            $.ajax({
                type: "POST",
                url:"${pageContext.request.contextPath}/taskcase/badcasescore",
                data: {
                    taskid: taskid,
                    caseid: caseid
                },
                success: function (resp) {
                    var img = '<img class="img_' + taskid + '" src="/images/bad.png" />'
                    $("#casescore_" + resp).html('');
                    $("#casescore_" + resp).append(img);

                    if ($("#task_" + taskid + " .img_" + taskid).length === $("#casescore_" + resp).parent().siblings().size()) {
                        $.ajax({
                            type: "POST",
                            url:"${pageContext.request.contextPath}/task/taskscore",
                            data: {
                                taskid: taskid
                            },
                            success: function (resp) {
                                $("#taskdone_" + taskid).html("YES");
                                $("#taskscore_" + taskid).html(resp);
                            },
                            error: function (xhr) {
                            }
                        });
                    }
                },
                error: function (xhr) {
                }
            });
            return false;
        });

        $(document).on('change', '.bugurl', function () {
            var link = $(this);
            var bugurl = $(this).val();
            var taskid = link.data("taskid");
            var caseid = link.data("caseid");
            if (bugurl && bugurl !== "http://") {
                $.ajax({
                    type: "POST",
                    url:"${pageContext.request.contextPath}/taskcase/bugurl",
                    data: {
                        taskid: taskid,
                        caseid: caseid,
                        bugurl: bugurl
                    },
                    success: function (resp) {
                        var e1 = '<a class="buglink" href="' + bugurl + '" target="_blank"><img src="/images/bug.png" /></a>';
                        var e2 = '<input class="bugurl" data-taskid="' + taskid + '" data-caseid="' + caseid + '" type="url" value="' + bugurl + '">';
                        $("#bugurl_" + resp).html('');
                        $("#bugurl_" + resp).append(e1, e2);

                    },
                    error: function (xhr) {
                    }
                });
            }

            return false;
        });
    });
</script>


</body>
</html>