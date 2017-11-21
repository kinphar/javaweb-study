<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登录</title>
<link rel="shortcut icon" href="/images/monkey.jpg">

<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/common.css" />
<link rel="stylesheet" href="/css/signin.css" />
<script type="text/javascript">
	var redirect = "${redirect}";
	console.log("redirect:" + redirect);
</script>
</head>

<body>
	<div class="container">
		<form class="form-signin" action="${ctx}/account/dologin"
			method="POST">
			<input type="hidden" name="redirectUrl" value="${redirectUrl}"/>
			<div style="text-align:center">
				<img class="img-rounded" alt="Brand" src="/images/bill.jpg"
				style="height: 80%; width: 80%; margin-top: 10px; margin-bottom: 30px">
			</div>			
				
			<!-- <h5 class="form-signin-heading">诺曼底登录</h5> -->
			<input type="email" id="inputEmail" name="email" class="form-control"
				placeholder="Email" required autofocus> 
				
			<input type="password" id="inputPassword" name="password" style="margin-top:10px"
				class="form-control" placeholder="Password" required>
				
			<!-- <div class="checkbox">
				<label> <input type="checkbox" value="remember-me">
					记住我
				</label>
			</div> -->
			<button class="btn btn-lg btn-success btn-block" style="margin-top:16px" type="submit">登录
				Login</button>
			
		</form>

	</div>
	<!-- /container -->

</body>
</html>
