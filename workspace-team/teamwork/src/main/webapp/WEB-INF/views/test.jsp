<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>teamwork</title>
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<script type="application/javascript" src="js/jquery.min.js"></script>
<script type="application/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<script type="text/javascript">
	var i=1;
	function add(){
	var top=document.getElementById("top");
	var input=document.createElement("input");
	var div=document.createElement("div");
	div.innerHTML="studen:"+i
	div.id=i
	i=i+1;
	input.type="input"
	input.name="v";
	input.onclick=function remo(){alert(i);top.removeChild(div)};//点击删除控件
	input.value="nihao";
	input.id="v";
	div.appendChild(input);
	top.appendChild(div);
	}
</script>

</head>

<body>
	<%@ include file="common/top_navbar.jsp"%>

	<div class="container theme-showcase" role="main" style="margin-bottom: 50px">
		<div class="page-header">
			<h1>Task manager</h1>
		</div>
		<div class="row">

			<div class="col-sm-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Undo</h3>
					</div>
					<div class="panel-body">
						<div class="media well">
							<div class="media-left">
								<a href="#"> <img class="media-object wh64"
									src="images/a.png" alt="卓大哥">
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">homework1</h4>
								take a photo!
							</div>
						</div>
						<div class="media well">
							<div class="media-body text-right">
								<h4 class="media-heading">homework1</h4>
								just sleep!
							</div>
							<div class="media-right">
								<a href="#"> <img class="media-object wh64"
									src="images/b.png" alt="技术大哥">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.col-sm-4 -->

			<div class="col-sm-4">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h3 class="panel-title">Doing</h3>
					</div>
					<div class="panel-body">
						<div class="media well">
							<div class="media-left">
								<a href="#"> <img class="media-object wh64"
									src="images/a.png" alt="卓大哥">
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">homework2</h4>
								take a photo!
							</div>
						</div>
						<div class="media well">
							<div class="media-body text-right">
								<h4 class="media-heading">homework2</h4>
								just sleep!
							</div>
							<div class="media-right">
								<a href="#"> <img class="media-object wh64"
									src="images/b.png" alt="技术大哥">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.col-sm-4 -->

			<div class="col-sm-4">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">Done</h3>
					</div>
					<div class="panel-body">
						<div class="media well">
							<div class="media-left">
								<a href="#"> <img class="media-object wh64"
									src="images/a.png" alt="卓大哥">
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">homework3</h4>
								take a photo!
							</div>
						</div>
						<div class="media well">
							<div class="media-body text-right">
								<h4 class="media-heading">homework3</h4>
								just sleep!
							</div>
							<div class="media-right">
								<a href="#"> <img class="media-object wh64"
									src="images/b.png" alt="技术大哥">
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.col-sm-4 -->
		</div>

		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#"> <span
						class="glyphicon glyphicon-home"> Home</span></a></li>
				<li><a href="#shop"> <span
						class="glyphicon glyphicon-shopping-cart"> Shop</span></a></li>
				<li><a href="#support"> <span
						class="glyphicon glyphicon-headphones"> Support</span></a></li>
				<li><a href="#heart"> <span
						class="glyphicon glyphicon-heart"> heart</span></a></li>
			</ul>
		</div>

		<div class="page-header">
			<h1>List groups</h1>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<ul class="list-group">
					<li class="list-group-item">Cras justo odio</li>
					<li class="list-group-item">Dapibus ac facilisis in</li>
					<li class="list-group-item">Morbi leo risus</li>
					<li class="list-group-item">Porta ac consectetur ac</li>
					<li class="list-group-item">Vestibulum at eros</li>
				</ul>
			</div>
			<!-- /.col-sm-4 -->
			<div class="col-sm-4">
				<div class="list-group">
					<a href="#" class="list-group-item active"> Cras justo odio </a> <a
						href="#" class="list-group-item">Dapibus ac facilisis in</a> <a
						href="#" class="list-group-item">Morbi leo risus</a> <a href="#"
						class="list-group-item">Porta ac consectetur ac</a> <a href="#"
						class="list-group-item">Vestibulum at eros</a>
				</div>
			</div>
			<!-- /.col-sm-4 -->
			<div class="col-sm-4">
				<div class="list-group">
					<a href="#" class="list-group-item active">
						<h4 class="list-group-item-heading">List group item heading</h4>
						<p class="list-group-item-text">Donec id elit non mi porta
							gravida at eget metus. Maecenas sed diam eget risus varius
							blandit.</p>
					</a> <a href="#" class="list-group-item">
						<h4 class="list-group-item-heading">List group item heading</h4>
						<p class="list-group-item-text">Donec id elit non mi porta
							gravida at eget metus. Maecenas sed diam eget risus varius
							blandit.</p>
					</a> <a href="#" class="list-group-item">
						<h4 class="list-group-item-heading">List group item heading</h4>
						<p class="list-group-item-text">Donec id elit non mi porta
							gravida at eget metus. Maecenas sed diam eget risus varius
							blandit.</p>
					</a>
				</div>
			</div>
			<!-- /.col-sm-4 -->
		</div>
		
		<div class="page-header">
			<h1>create widget</h1>
		</div>
		<div><input type="button" onclick="add()" value="Add" /></div>
		<div id="top"></div>




	</div>

<!-- 	<div id="footer" class="container">
		<nav class="navbar navbar-default navbar-fixed-bottom">
			<div class="navbar-inner navbar-content-center">
				<p class="text-muted credit text-center" style="padding: 0px;">
					2017 - 2018 &copy; Brought to you by <a href="#">kinphar.</a>
				</p>
			</div>
		</nav>
	</div> -->

</body>
</html>
