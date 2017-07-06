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
	          	<li><a href="${pageContext.request.contextPath}/task">任务</a></li>
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
		        <h3>任务管理</h3>
		    </div>
		    
		    <nav class="navbar navbar-default" role="navigation">
			    <div class="container-fluid">
				    <form class="form-inline" role="form">
					  <div class="form-group">
					    <label for="projectname">项目名称：</label>
					    <select class="form-control">
					      	<option>所有项目</option>
							<option>T91R</option>
							<option>板卡定制</option>
							<option>主线V5.0.2</option>
							<option>I66</option>
							<option>X66L</option>
					      </select>
					  </div>
					  <div class="form-group">
					    <label for="">负责人：</label>
					    <select class="form-control">
					    	<option>所有人</option>
					    	<option>我自己</option>					      								
					    </select>
					  </div>
					  <div class="form-group">
					     <input type="text" class="form-control" placeholder="查找任务...">
					  </div>  
					  <div class="form-group" style="float:right">
					  	<div class="dropdown">
						    <button type="button" class="btn dropdown-toggle btn-newtask" id="dropdownMenu1" data-toggle="dropdown">
						    	<span class="glyphicon glyphicon-plus-sign"></span>
						    	新建
						        <span class="caret"></span>
						    </button>
						    <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="dropdownMenu1">
						        <li role="presentation">
						            <a role="menuitem" tabindex="-1" href="#" class="text-center" data-toggle="modal" data-target="#myModal">添加任务</a>
						        </li>
						        <li role="presentation">
						            <a role="menuitem" tabindex="-1" href="#" class="text-center" data-toggle="modal" data-target="#myModal">新建项目</a>
						        </li>
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
    	  	  	<col style="width:50%">
    	  	  	<col style="">
    	  	  	<col style="">
    	  	  	<col style="width:8%">
    	  	  	<col style="">
    	  	  </colgroup>
			  <thead>
			    <tr>
			      <th>项目</th>
			      <th>描述</th>
			      <th>到期时间</th>
			      <th>处理人</th>
			      <th>进度</th>
			      <th>操作</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td><b>板卡定制</b></td>
			      <td>H61I支持二代身份证，支持IC卡防复制功能，叠加历史需求。</td>
			      <td>2017-07-16</td>
			      <td>丁庆发</td>
			      <td>
			      	<div class="progress">
					    <div class="progress-bar progress-bar-success" role="progressbar"
					         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
					         style="width: 100%;">
					    </div>
					</div>
				  </td>
			      <td>
			      	<button class="btn btn-primary btn-opt" type="submit"><span class="glyphicon glyphicon-zoom-in glyphicon-opt"></span>详情</button>
			      	<button class="btn btn-success btn-opt" type="submit"><span class="glyphicon glyphicon-pencil glyphicon-opt"></span>编辑</button>
			      	<button class="btn btn-warning btn-opt" type="submit"><span class="glyphicon glyphicon-check glyphicon-opt"></span>进度</button>
			      </td>
			    </tr>
			    <tr>
			      <td><b>板卡定制</b></td>
			      <td>H61I支持二代身份证，支持IC卡防复制功能，叠加历史需求。H61I支持二代身份证.</td>
			      <td>2017-07-16</td>
			      <td>丁庆发</td>
			      <td>
			      	<div class="progress">
					    <div class="progress-bar progress-bar-info" role="progressbar"
					         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
					         style="width: 30%;">
					    </div>
					</div>
			      </td>
			      <td>
			      	<button class="btn btn-primary btn-opt" type="submit"><span class="glyphicon glyphicon-zoom-in glyphicon-opt"></span>详情</button>
			      	<button class="btn btn-success btn-opt" type="submit"><span class="glyphicon glyphicon-pencil glyphicon-opt"></span>编辑</button>
			      	<button class="btn btn-warning btn-opt" type="submit"><span class="glyphicon glyphicon-check glyphicon-opt"></span>进度</button>
			      </td>
			    </tr>
			    <tr>
			      <td><b>T91R</b></td>
			      <td>LCD B备用方案调试</td>
			      <td>2017-07-16</td>
			      <td>丁庆发</td>
			      <td>
			      	<div class="progress">
					    <div class="progress-bar progress-bar-success" role="progressbar"
					         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
					         style="width: 0%;">
					    </div>
					</div>
			      </td>
			      <td>
			      	<button class="btn btn-primary btn-opt" type="submit"><span class="glyphicon glyphicon-zoom-in glyphicon-opt"></span>详情</button>
			      	<button class="btn btn-success btn-opt" type="submit"><span class="glyphicon glyphicon-pencil glyphicon-opt"></span>编辑</button>
			      	<button class="btn btn-warning btn-opt" type="submit"><span class="glyphicon glyphicon-check glyphicon-opt"></span>进度</button>
			      </td>
			    </tr>
			    <tr>
			      <td><b>板卡定制</b></td>
			      <td>H61I支持二代身份证，支持IC卡防复制功能，叠加历史需求。</td>
			      <td>2017-07-16</td>
			      <td>丁庆发</td>
			      <td>
			      	<div class="progress">
					    <div class="progress-bar progress-bar-info" role="progressbar"
					         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
					         style="width: 50%;">
					    </div>
					</div>
			      </td>
			      <td>
			      	<button class="btn btn-primary btn-opt" type="submit"><span class="glyphicon glyphicon-zoom-in"></span>详情</button>
			      	<button class="btn btn-success btn-opt" type="submit"><span class="glyphicon glyphicon-pencil"></span>编辑</button>
			      	<button class="btn btn-warning btn-opt" type="submit"><span class="glyphicon glyphicon-check"></span>进度</button>
			      </td>
			    </tr>
			  </tbody>
			</table>
			
			<!-- 新建任务，模态框（Modal） -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content" style="padding: 2px 20px">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                <h4 class="modal-title" id="myModalLabel">新建任务</h4>
			            </div>
			            <div class="modal-body">
							<form role="form">
							  <div class="form-group">
							    <label for="name">任务描述：</label>
							    <textarea class="form-control" rows="5"></textarea>
							  </div>
							</form>
							
							<div class="row">
								<div class="col-md-6">
									<form role="form">
									  <div class="form-group">
									    <label for="projectname">所属项目：</label>
									    <select class="form-control">
									      	<option>所有项目</option>
											<option>T91R</option>
											<option>板卡定制</option>
											<option>主线V5.0.2</option>
											<option>I66</option>
											<option>X66L</option>
									      </select>
									   </div>
									</form>
								</div>
								<div class="col-md-6">
									<form role="form">
									  <div class="form-group">
									    <label for="">任务状态：</label>
									    <select class="form-control">
									    	<option>未分配</option>
									    	<option>正在处理</option>		
									    	<option>已完成</option>		      								
									    </select>
									   </div>
									</form>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<form role="form">
									  <div class="form-group">
									    <label for="projectname">分配给：</label>
									    <select class="form-control">
									      	<option>丁庆发</option>
											<option>洪桂芳</option>
											<option>陈钟</option>
											<option>李晴</option>
											<option>王锦乐</option>
									      </select>
									  </div>
									</form>	
								</div>
							</div>			 				 
						</div>
						
			            <div class="modal-footer">
			                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			                <button type="button" class="btn btn-primary">提交任务</button>
			            </div>
			        </div><!-- /.modal-content -->
			    </div><!-- /.modal -->
			</div>
			
			
			<div class="row-fluid">
				<div id="footer" class="span12">
					2017 - 2018 &copy; Brought to you by <a href="#">kinphar.</a>
				</div>
			</div>
			
	   </div>
	   
	   
	   
	</body>
</html>
	