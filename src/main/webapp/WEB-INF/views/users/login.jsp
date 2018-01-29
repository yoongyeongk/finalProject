<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/login.css" type="text/css">
<title>Login</title>
</head>
<body>
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div class="logo">
			<a href="#"><img src="../resources/images/logo_3.png"></a>
		</div>
		<div class="form_wrap">
			<div class="login_sec">
				<form action="login" id="frm" method="post">
					<label for="id">이메일</label>
					<input type="text" class="form-control" name="username" id="id">
					<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
					
					<label for="password">비밀번호</label> 
					<input type="password" class="form-control" name="password" id="password">
					<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
					
					<label class="remember"><input type="checkbox" name="remember" id="remember"> 아이디 저장</label>
					<input type="submit" value="로그인" class="login_btn">
					<a href="#"	class="text forgot">비밀번호 찾기</a>
					<a href="join" class="text join">회원가입</a>
				</form>
			</div>

			<div class="line"></div>

			<div class="exLogin_sec">
				<div class="description">네이버와 카카오 아이디를 이용하여 편리하게 회원가입 및 로그인을 할 수 있습니다.</div>
				<div class="btns">
					<div id="naverIdLogin" class="naverLogin">
						<a href="#"><img src="../resources/images/naver-login.PNG" style="width: 200px;"></a>
					</div>

					<script type="text/javascript">
						var naverLogin = new naver.LoginWithNaverId({
							clientId : "MAn71SNNZHBVz0vV6Qs3",
							callbackUrl : "http://localhost/project/users/callback",
							isPopup : false,
							loginButton: {color: "green", type: 3, height: 53}
						});

						naverLogin.init();
					</script>


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