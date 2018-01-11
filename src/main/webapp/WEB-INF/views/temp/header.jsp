<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- header -->
<header class="nav-header">
	<a onclick="openNav()" data-toggle="sidebar" class="sidebar-btn" href="#"><span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span></a>
	<a href="#" id="logo"><img class="logo-img" src="${pageContext.request.contextPath}/resources/images/logo_3.png"></a>
	<div class="navbar-menu">
		<ul class="nav navbar-nav">
			<li>
				<div class="dropdown">
					<a href="#" class="dropdown-toggle" type="button"
						data-toggle="dropdown">알림</a>
					<ul class="dropdown-menu">
						<li class="header">10개의 알림이 있습니다.</li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
					</ul>
				</div>
			</li>

			<li class="nav navbar-nav">
				<div class="dropdown">
					<a href="#" class="dropdown-toggle" type="button"
						data-toggle="dropdown">메세지</a>
					<ul class="dropdown-menu">
						<li class="header">5개의 메세지가 도착했습니다.</li>
						<li><a href="#">메세지1</a></li>
						<li><a href="#">메세지2</a></li>
					</ul>
				</div>
			</li>

			<li class="nav navbar-nav">
				<div class="dropdown">
					<a href="#" class="dropdown-toggle" type="button" data-toggle="dropdown">
						<c:if test="${user.filename.file_name ne null}">
							<img class="profile-img img-circle" src="${pageContext.request.contextPath}/resources/upload/${user.filename.file_name}">
						</c:if>
						<c:if test="${user.filename.file_name eq null}">
							<img class="profile-img img-circle" src="${pageContext.request.contextPath}/resources/images/default-profile-img.png">
						</c:if>
					</a>
					<ul class="dropdown-menu">
						<li class="header">${user.username}</li>
						<li><a href="#">나의 정보</a></li>
						<c:if test="${user ne null}">
							<li><a href="users/logout">로그아웃</a></li>
						</c:if>
					</ul>
				</div>
			</li>
		</ul>
	</div>
</header>
<!-- /header -->

<!-- sidebar -->

<div id="sidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	<a href="#">About</a> <a href="#">Services</a> <a href="#">Clients</a>
	<a href="#">Contact</a>
</div>