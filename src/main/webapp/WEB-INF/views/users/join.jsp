<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hi!Project</title>
</head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdn.ckeditor.com/4.8.0/basic/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="../resources/js/join.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/join.css">
<body>
	<div id="main" class="wrapper">
		<div class="container">
			<div class="col-md-8">
				<form id="form" class="form-horizontal" role="form" action="join"
					method="post" enctype="multipart/form-data">
					<div class="form-inner">
						<div class="form-group">
							<div class="col-md-8">
								<div class="profile-img">
									<div class="img_wrap">
										<img id="img" /> <img id="default-img"
											src="../resources/images/default-profile-img.png">
									</div>
									<input type="file" accept="image/*" id="profile_img"
										name="file">
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-8">
								<label for="username" class="control-label">이메일 주소</label> <input
									data-toggle="popover" data-placement="top" type="email"
									class="form-control" id="username" name="username"
									placeholder="이메일 주소를 입력해주세요">
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-8">
								<label for="password" class="control-label">비밀번호</label> <input
									type="password" class="form-control" id="password"
									name="password" placeholder="비밀번호를 입력해주세요">
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-8">
								<label for="password" class="control-label">비밀번호 확인</label> <input
									type="password" class="form-control" id="password_confirm"
									name="password_confirm" placeholder="비밀번호를 확인하세요">
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-8">
								<label for="nickname" class="control-label">닉네임</label> <input
									type="text" class="form-control" id="nickname" name="nickname"
									placeholder="닉네임을 입력해주세요">
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-8">
								<label for="phone" class="control-label">연락처</label> <input
									type="text" class="form-control" id="phone" name="phone"
									placeholder="연락처를 입력해주세요" maxlength="11">
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-8">
								<label><input type="checkbox" id="agree">이용약관에
									동의합니다.</label>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-8">
								<input type="submit" value="회원가입" class="btn btn-info">
								<a href="login" class="btn btn-default">취소</a>
							</div>
						</div>
					</div>
			</form>
		</div>
	</div>
	</div>
</body>
</html>