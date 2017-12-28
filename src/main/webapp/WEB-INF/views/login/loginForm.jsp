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
	background-color: rgb(22, 160, 133);
	font-family: HanSans;
}
.logo{
	margin: 0 auto;
	margin-top: 105px;
	width: 300px;
	height: 55px;
	background-color: yellow;
}
.form_wrap{
	width: 500px;
    height: 300px;
    margin: 0 auto;
    padding: 20px;
    border-radius: 5px;
    margin-top: 50px;
    background-color: white;
    box-shadow: rgba(0, 0, 0, 0.11) 10px 10px 15px 3px; 
    opacity: 0.9;
}
#frm{
	margin-top: 25px;
	width: 200px;
	background: white;
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
	font-size: 12px;
	margin: 0 auto;
	background-color: white;
	font-weight: 500;
}
.form-control{
	height: 30px;
	width: 200px;
	margin: 0 auto;
	padding-left: 30px;
	font-size: 11px;
}
#id{
	background-color: #ffffff;
	opacity: 1;
}
#password{
	background-color: #ffffff;
	opacity: 1;
}
.glyphicon{
	color: rgb(158, 158, 158);
	position: relative;
    left: 8px;
    top: -23px;
    background: none;
}
.login_btn{
	display: block;
	width: 200px;
	margin: 0 auto;
	margin-top: 10px;
	margin-bottom: 10px;
	padding: 5px 79px;
    border: solid 1px rgb(22, 160, 133);
    background-color: rgb(22, 160, 133);
    border-radius: 3px;
    font-weight: 700;
    color: white;
}
.remember{
	font-size: 11px;
	color: rgb(22, 160, 133);
}
.text{
	color: rgb(22, 160, 133);
	font-size: 11px;
}
.forgot{
	float: left;
}
.join{
	float: right;
}
.line{
	width: 0.5px;
	height: 230px;
	float: left;
	margin: 20px 4px;
	background-color: rgb(158, 158, 158);
}
a:hover {
	text-decoration: none;
}
.description{
	margin: 0 auto;
	margin-top: 25px;
	margin-bottom: 25px;
	font-size: 12px;
	color: rgb(158, 158, 158);
	background-color: white;
}
.btns{
	background-color: white;
}
.naverLogin{
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 25px;
	width: 200px;
	height: 30px;
	background-color: rgb(46, 204, 113);
	color: white;
	font-weight: 700;
	text-align: center;
	line-height: 30px;
	border-radius: 3px;
}
.kakaoLogin{
	margin: 0 auto;
	width: 200px;
	height: 30px;
	background-color: rgb(241, 196, 15);
	color: white; 
	font-weight: 700;
	text-align: center;
	line-height: 30px;
	border-radius: 3px;
}
</style>
</head>
<body>
	<div class="col-md-4"></div>
	<div class="col-md-4">
	<div class="logo"></div>
	<div class="form_wrap">
		<div class="login_sec">
			<form action="" id="frm" method="post">
					<label for="id">Username</label>
					<input type="text" class="form-control" name="username" id="id">
					<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				
				<label for="password">Password</label>
				<input type="password" class="form-control" name="password" id="password">
				<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
				
				<label class="remember"><input type="checkbox" name="remember" id="remember"> Remember me</label>
				<input type="button" value="LOGIN" class="login_btn">
				<a href="#" class="text forgot">Forgot password</a>
				<a href="#" class="text join">Sign Up</a>
			</form>
		</div>
		
		<div class="line"></div>
		
		<div class="exLogin_sec">
			<div class="description">
				네이버와 카카오 아이디를 이용하여 편리하게 회원가입 및 로그인을 할 수 있습니다.
			</div>
			<div class="btns">
				<div class="naverLogin">네이버 로그인</div>
				<div class="kakaoLogin">카카오 로그인</div>
			</div>
		</div>
		
	</div>
	</div>
	<div class="col-md-4"></div>
</body>
</html>