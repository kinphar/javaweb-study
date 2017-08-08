<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="../../favicon.ico">
<title>登录</title>

<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/signin.css" />
</head>

<body>
	<div class="container">
		<form class="form-signin" action="${ctx}/account/dologin"
			method="POST">
			<div style="text-align:center">
				<img class="img-rounded" alt="Brand" src="/images/justgun.gif"
				style="height: 80%; width: 80%; margin-top: 10px; margin-bottom: 30px">
			</div>			
				
			<h5 class="form-signin-heading">诺曼底登录</h5>
			<input type="email" id="inputEmail" name="email" class="form-control"
				placeholder="Email" required autofocus> <input
				type="password" id="inputPassword" name="password"
				class="form-control" placeholder="Password" required>
			<!-- <div class="checkbox">
				<label> <input type="checkbox" value="remember-me">
					记住我
				</label>
			</div> -->
			<button class="btn btn-lg btn-primary btn-block" type="submit">登录
				Login</button>
			
		</form>

	</div>
	<!-- /container -->

</body>
</html>
