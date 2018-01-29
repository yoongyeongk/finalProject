<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../resources/css/myPage.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hi!Project - my page</title>
<script type="text/javascript">
$(function(){
	var message = '${message}';
	if(message != ''){
		alert(message);
	}
	
	//회원 탈퇴 확인
	$("#delete_btn").click(function(){
		var check = confirm("정말로 탈퇴하시겠습니까?");
		if(check){
			location.href = "./usersDelete";	
		}
	});
});
</script>
<style type="text/css">

</style>
</head>
<body>
<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
<!-- header 끝 -->

	<section id="main">
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
						
						<div id="move_wrap">
							<a href="./usersUpdate" class="selection">
								수정				
							</a>
							<a href="#" id="delete_btn" class="selection">
								탈퇴
							</a>
							<a href="./myWrite" class="selection">
								내가 쓴 글 보기
							</a>
						</div>
					</td>
					<th>아이디</th>
					<td>${user.username}</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>${user.nickname}</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${user.phone}</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>${user.create_date}</td>
				</tr>
				<tr>
					<th>최종 수정일</th>
					<td>${user.modify_date}</td>
				</tr>
			</table>
		</div>
		
	</section>

<!-- footer -->
<!-- footer 끝 -->
</body>
</html>