<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>Login</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-family: HanSans;
}

body {
	background: url("../resources/images/office-1209640_1920.jpg") no-repeat fixed center;
}

.logo {
	margin: 0 auto;
	margin-top: 105px;
	width: 300px;
	height: 55px;
	/* background-color: yellow; */
}

.form_wrap {
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

#frm {
	margin-top: 25px;
	width: 200px;
	background: white;
}

.login_sec {
	float: left;
	width: 225px;
	height: 260px;
	background-color: white;
	padding: 0 10px;
}

.exLogin_sec {
	float: right;
	width: 225px;
	height: 260px;
	background-color: white;
	padding: 0 10px;
}

label {
	display: block;
	color: rgb(158, 158, 158);
	font-size: 12px;
	margin: 0 auto;
	background-color: white;
	font-weight: 500;
}

.form-control {
	height: 30px;
	width: 200px;
	margin: 0 auto;
	padding-left: 30px;
	font-size: 11px;
}

#id {
	background-color: #ffffff;
	opacity: 1;
}

#password {
	background-color: #ffffff;
	opacity: 1;
}

.glyphicon {
	color: rgb(158, 158, 158);
	position: relative;
	left: 8px;
	top: -23px;
	background: none;
}

.login_btn {
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

.remember {
	font-size: 11px;
	color: rgb(22, 160, 133);
}

.text {
	color: rgb(22, 160, 133);
	font-size: 11px;
}

.forgot {
	float: left;
}

.join {
	float: right;
}

.line {
	width: 0.5px;
	height: 230px;
	float: left;
	margin: 20px 4px;
	background-color: rgb(158, 158, 158);
}

a:hover {
	text-decoration: none;
}

.description {
	margin: 0 auto;
	margin-top: 25px;
	margin-bottom: 25px;
	font-size: 12px;
	color: rgb(158, 158, 158);
	background-color: white;
}

.btns {
	background-color: white;
}

 
.naverLogin img{
	padding: 5px 0;
}
.kakaoLogin img{
	padding: 5px 0;
} 


</style>
</head>
<body>
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div class="logo">
			<a href="#"><img src="../resources/images/logo_3.png"></a>
		</div>
		<div class="form_wrap">
			<div class="login_sec">
				<form action="" id="frm" method="post">
					<label for="id">이메일</label>
					<input type="text" class="form-control" name="username" id="id">
					<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					
					<label for="password">비밀번호</label> 
					<input type="password" class="form-control" name="password" id="password">
					<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
					
					<label class="remember"><input type="checkbox" name="remember" id="remember"> 아이디 저장</label>
					<input type="button" value="로그인" class="login_btn">
					<a href="#"	class="text forgot">비밀번호 찾기</a>
					<a href="#"	class="text join">회원가입</a>
				</form>
			</div>

			<div class="line"></div>

			<div class="exLogin_sec">
				<div class="description">네이버와 카카오 아이디를 이용하여 편리하게 회원가입 및 로그인을 할
					수 있습니다.</div>
				<div class="btns">
					<div class="naverLogin">
						<a href="${url}"><img src="../resources/images/naver-login.PNG" style="width: 200px;"></a>
					</div>
					<div class="kakaoLogin">
						<a id="custom-login-btn" href="javascript:loginWithKakao()">
							<img src="../resources/images/kakao_account_login_btn_large_narrow.png" style="width: 200px;" />
						</a>
					</div>
					<script type='text/javascript'>
						Kakao.init('6549962324feae4e4df045911fbf4a75');
						function loginWithKakao() {
							Kakao.Auth.login({
								success : function(authObj) {
									Kakao.API.request({
										url: '/v1/user/me',
										success: function(res) {
											alert(JSON.stringify(res));
										},
										fail: function(error) {
											alert(JSON.stringify(error));
										}
									});
								},
								fail : function(err) {
									alert(JSON.stringify(err));
								}
							});
						};
					</script>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-4"></div>
</body>
</html>