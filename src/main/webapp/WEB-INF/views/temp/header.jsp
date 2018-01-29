<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<script src="${pageContext.request.contextPath}/resources/js/sidebar.js"></script>
<script type="text/javascript">

function openWin(){
	window.open("https://spring-ws-chat.herokuapp.com/", 
			"_blank", "width=600, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
}

</script>
<!DOCTYPE html>
<!-- header -->
<header class="nav-header">
	
	<!-- sideNav -->
	<a data-toggle="sidebar" class="sideOn sidebar-btn" href="#"><span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span></a>
	
	<!-- logo-img -->
	<a href="${pageContext.request.contextPath}/" id="logo">
		<img class="logo-img" src="${pageContext.request.contextPath}/resources/images/logo_3.png">
	</a>
	
	<!-- navbar - 알림/메시지/유저정보 -->
	<div class="navbar-menu">
		<ul class="nav navbar-nav">
			<li>
				<!-- nav1 - 알림 -->
				<div class="dropdown">
					<a href="#" class="alert_sec dropdown-toggle" type="button" data-toggle="dropdown">새 알림
						<span class="badge">10</span>
					</a>
					<ul class="alert_ul dropdown-menu">
						<li class="alert_header header">10개의 알림이 있습니다.</li>
						<!-- 일정관리 페이지로 이동 -->
						<li>
							<a href="#">
								<span class="alert_con glyphicon glyphicon-time"></span>오늘 처리해야 하는 일정이 5개 있습니다.
							</a>
						</li>
						<!-- 프로젝트 페이지에서 확인 -->
						<li>
							<a href="#">
								<span class="alert_con glyphicon glyphicon-bell"></span>새 프로젝트 초대가 있습니다.
							</a>
						</li>
						<!-- 메신저 열기 -->
						<li>
							<a href="#">
								<span class="alert_con glyphicon glyphicon-comment"></span>새 메세지 총 3개
							</a>
						</li>
						<!-- 내가 쓴 글 보러가기 -->
						<li>
							<a href="#">
								<span class="alert_con glyphicon glyphicon-file"></span>새 댓글 10개를 확인하세요.
							</a>
						</li>
					</ul>
				</div>
			</li>

			<li class="nav navbar-nav">
			<!-- 메신저 탭 열기 -->
				<div class="dropdown">
					<a href="#" class="messinger_open dropdown-toggle" type="button" data-toggle="dropdown">
						<span class="glyphicon glyphicon-envelope"></span>
					</a>
					<a onclick="openWin()">메신저</a>
					<ul class="dropdown-menu">
						<li class="messinger_header header">5개의 메세지가 도착했습니다.</li>
						<li><a href="#">메세지1</a></li>
						<li><a href="#">메세지2</a></li>
					</ul>
				</div>
			</li>

			<!-- user 정보 -->
			<li class="nav navbar-nav">
				<div class="dropdown">
					<a href="#" class="user_info dropdown-toggle" type="button" data-toggle="dropdown">
						<c:if test="${user.filename.file_name ne null}">
							<img class="profile-img img-circle" src="${pageContext.request.contextPath}/resources/upload/${user.filename.file_name}">
						</c:if>
						<c:if test="${user.filename.file_name eq null}">
							<img class="profile-img img-circle" src="${pageContext.request.contextPath}/resources/images/default-profile-img.png">
						</c:if>
						<span class="user_nickname">${user.nickname}</span>
					</a>
					
					<ul class="dropdown-menu">
						<li class="header">${user.username}</li>
						<li><a href="${pageContext.request.contextPath}/users/myPage">나의 정보</a></li>
						<c:if test="${user ne null}">
							<li><a href="${pageContext.request.contextPath}/users/logout">로그아웃</a></li>
						</c:if>
					</ul>
				</div>
			</li>
		</ul>
	</div>
</header>
<!-- /header -->

<!-- sidebar -->
<div id="sideNav_main" class="sideOn">
	<span class="icons project_icon glyphicon glyphicon-folder-open"></span>		<!-- project -->
	<span class="icons calendar_icon glyphicon glyphicon-calendar"></span>		<!-- calendar -->
	<span class="icons address_book glyphicon glyphicon-list-alt"></span>		<!-- address book -->
	<span class="icons community_icon glyphicon glyphicon-globe"></span>		<!-- commnunity -->
	<span class="icons scrap_icon glyphicon glyphicon-star"></span>		<!-- scrap -->
</div>

<div id="sidenav" class="sidenav" style="display: none;">
	<!-- <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a> -->
	<a href="#">projects</a> 
	<a href="${pageContext.request.contextPath}/schedule/mainSchedule">calendar</a> 
	<a href="#">contact</a>
	<a href="${pageContext.request.contextPath}/pmf/pmfList">community</a>
	<a href="${pageContext.request.contextPath}/scrap/pmfList">scrap</a>
</div>
