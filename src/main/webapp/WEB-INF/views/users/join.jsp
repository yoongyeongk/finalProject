<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="../resources/css/join.css">
<script src="../resources/js/join.js"></script>
	<div id="main" class="wrapper">
		<div class="join_container">
		<form id="form" class="form-horizontal" role="form" action="join" method="post" enctype="multipart/form-data">

				<table class="t_join">
					<tr>
						<td id="profile_img" rowspan="5">
							<div class="img_wrap">
							<img id="img" width="150px" height="150px" style="display: none;"/> 
							<img id="default-img" src="../resources/images/default-profile-img.png">
						</div>
						<input type="file" accept="image/*" width="150px" height="150px" id="profile_img" name="file">
						</td>
						<th>이메일 주소</th>
						<td>
							<input data-toggle="popover" data-placement="top" type="email" class="form-control" id="username" name="username" placeholder="이메일 주소를 입력해주세요">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요">
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" class="form-control" id="password_confirm" name="password_confirm" placeholder="비밀번호를 확인하세요">
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>
							<input type="text" class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력해주세요">
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<input type="text" class="form-control" id="phone" name="phone" placeholder="연락처를 입력해주세요" maxlength="11">
						</td>
					</tr>
				</table>

				<div class="wrap">
					<label>
						<input type="checkbox" id="agree">이용약관에 동의합니다.</label>
				</div>
				
				<div class="btn_wrap2">
					<input type="submit" value="회원가입" class="btn btn-info"> 
					<a href="login" class="cancel btn btn-default">취소</a>
				</div>
		</form>
	</div>
	</div>