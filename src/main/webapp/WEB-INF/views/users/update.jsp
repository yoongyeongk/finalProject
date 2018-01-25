<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/pmf/pmf_scrap_css.css">
<link rel="stylesheet" href="../resources/css/header.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hi!Project - my info update</title>
</head>
<style type="text/css">
.profile_img{
	width: 170px;
	height: 170px;
}
#myInfo{
	margin: 0 auto;
    width: 800px;
    height: 400px;
    background-color: #f5f5f5;
    border-radius: 5px;
    margin-top: 200px;
    padding: 50px 0;
}
#t_info{
	width: 800px;
    height: 300px;
}
#t_info td,#t_info th,#t_info tr{
	border: none;
	width: auto;
	font-size: 17px;
}
#t_info th{
	font-weight: 600;
	text-align: center;
}
#t_info input{
	height: 35px;
    padding: 2px 10px;
    border-radius: 3px;
    border: 1px solid #ddd;
}
#move_wrap{
	width: 800px;
	margin: 0 auto;
	padding: 20px 3px;
}
.update_btn{
	float: right;
	width: 150px;
    height: 40px;
    font-size: 18px;
    background-color: #eee;
    border: 1px solid #ddd;
    border-radius: 3px;
}
</style>
<body>
<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
<!-- header 끝 -->

	<section id="main">
		<form action="./usersUpdate" method="post" enctype="multipart/form-data">
			<div id="myInfo">
				<table id="t_info">
					<tr>
						<td rowspan="5">
							<div class="profile">
								<c:if test="${user.filename.file_name ne null}">
									<img class="profile_img img-circle" src="${pageContext.request.contextPath}/resources/upload/${user.filename.file_name}">
								</c:if>
								<c:if test="${user.filename.file_name eq null}">
									<img class="profile_img img-circle" src="${pageContext.request.contextPath}/resources/images/default-profile-img.png">
								</c:if>
							</div>
						</td>
						<th>아이디</th>
						<td>
							${user.username}
							<input type="hidden" name="username" value="${user.username}">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="password" name="password" value="${user.password}"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" id="password_ch" value="${user.password}"></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td><input type="text" id="nickname_ch" name="nickname" value="${user.nickname}"></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="tel" name="phone" value="${user.phone}"></td>
					</tr>
				</table>
			</div>
			
			<div id="move_wrap">
				<input type="submit" class="update_btn" value="수정">
			</div>
		</form>
		
		
	</section>

<!-- footer -->
<!-- footer 끝 -->
</body>
</html>