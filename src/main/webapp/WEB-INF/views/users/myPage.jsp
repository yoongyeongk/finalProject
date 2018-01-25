<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/pmf/pmf_scrap_css.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
#move_wrap{
	margin: 20px 20px -10px 20px;
}
.selection{
	display: block;
    width: 200px;
    height: 30px;
    margin: 0 auto;
    background-color: white;
    line-height: 30px;
    border-radius: 5px;
    margin-bottom: 10px;
    color: black;
    font-weight: 600;
}
.selection:hover {
	text-decoration: none;
	background-color: #ddd;
	color: white;
}
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