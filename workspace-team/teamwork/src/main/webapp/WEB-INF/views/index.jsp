<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>teamwork</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<script type="application/javascript" src="js/jquery.min.js"></script>
		<script type="application/javascript" src="js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<h2>Hello ${spring}!</h2>
		
		<nav class="navbar navbar-inverse navbar-fixed-top">
	      <div class="container">
	        <div class="navbar-header">
	          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	          <a class="navbar-brand" href="#">Project name</a>
	        </div>
	        <div id="navbar" class="navbar-collapse collapse">
	          <form class="navbar-form navbar-right">
	            <div class="form-group">
	              <input type="text" placeholder="Email" class="form-control">
	            </div>
	            <div class="form-group">
	              <input type="password" placeholder="Password" class="form-control">
	            </div>
	            <button type="submit" class="btn btn-success">Sign in</button>
	          </form>
	        </div><!--/.navbar-collapse -->
	      </div>
    	</nav>
    	
    	<div class="container theme-showcase" role="main">
    	  <div class="page-header">
	        <h1>Panels</h1>
	      </div>
	      <div class="row">
	        <div class="col-sm-4">
	          <div class="panel panel-default">
	            <div class="panel-heading">
	              <h3 class="panel-title">Panel title</h3>
	            </div>
	            <div class="panel-body">
	              Panel content
	            </div>
	          </div>
	          <div class="panel panel-primary">
	            <div class="panel-heading">
	              <h3 class="panel-title">Panel title</h3>
	            </div>
	            <div class="panel-body">
	              Panel content
	            </div>
	          </div>
	        </div><!-- /.col-sm-4 -->
	        <div class="col-sm-4">
	          <div class="panel panel-success">
	            <div class="panel-heading">
	              <h3 class="panel-title">Panel title</h3>
	            </div>
	            <div class="panel-body">
	              Panel content
	            </div>
	          </div>
	          <div class="panel panel-info">
	            <div class="panel-heading">
	              <h3 class="panel-title">Panel title</h3>
	            </div>
	            <div class="panel-body">
	              Panel content
	            </div>
	          </div>
	        </div><!-- /.col-sm-4 -->
	        <div class="col-sm-4">
	          <div class="panel panel-warning">
	            <div class="panel-heading">
	              <h3 class="panel-title">Panel title</h3>
	            </div>
	            <div class="panel-body">
	              Panel content
	            </div>
	          </div>
	          <div class="panel panel-danger">
	            <div class="panel-heading">
	              <h3 class="panel-title">Panel title</h3>
	            </div>
	            <div class="panel-body">
	              Panel content
	            </div>
	          </div>
	        </div><!-- /.col-sm-4 -->
	      </div>
	    </div>
	    
	    <div>
	    	<button type="button" class="btn btn-default">
		        <span class="glyphicon glyphicon-sort-by-attributes"></span>
		    </button>
		    <button type="button" class="btn btn-default">
		        <span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
		    </button>
		    <button type="button" class="btn btn-default">
		        <span class="glyphicon glyphicon-sort-by-order"></span>
		    </button>
		    <button type="button" class="btn btn-default">
		        <span class="glyphicon glyphicon-sort-by-order-alt"></span>
		    </button>
	    </div>

	</body>
</html>
	