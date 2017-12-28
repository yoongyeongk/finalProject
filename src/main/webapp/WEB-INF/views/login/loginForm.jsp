<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
.logo{

}
.form_wrap{
	width: 500px;
    height: 300px;
    margin: 0 auto;
    padding: 20px;
    background-color: yellow;
}
.login_sec{
	float: left;
	width: 225px;
	height: 260px;
	background-color: white;
	padding: 0 10px;
}
.exLogin_sec{
	float: right;
	width: 225px;
	height: 260px;
	background-color: white;
	padding: 0 10px;
}
label{
	display: block;
	color: rgb(158, 158, 158);
}
.glyphicon{
	color: rgb(158, 158, 158);
}
.login_btn{
	display: block;
	margin: 10px 0;
}
.text{
	color: rgb(22, 160, 133);
}
.forgot{
	float: left;
}
.join{
	float: right;
}
</style>
</head>
<body>
	<div class="logo"></div>
	
	<div class="form_wrap">
		<div class="login_sec">
			<form action="" method="post">
					<label for="id">Username</label>
					<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					<input type="text" class="form-control" name="username" id="id">
				
				<label for="password">Password</label>
				<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
				<input type="password" class="form-control" name="password" id="password">
				
				<label class="remember"><input type="checkbox" name="remember" id="remember"> Remember me</label>
				<input type="button" value="LOGIN" class="login_btn">
				<a class="text forgot">Forgot password</a>
				<a class="text join">Sign Up</a>
			</form>
		</div>
		<div class="exLogin_sec">
		
		</div>
	</div>

</body>
</html>