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
<script src="resources/js/sidebar.js"></script>
<script src="resources/js/project.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://use.fontawesome.com/releases/v5.0.3/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="resources/css/main.css">
<body>
	<div id="main" class="wrapper">
		<c:import url="temp/header.jsp"></c:import>
		<!-- contents -->
		<div class="dashboard">
			<div class="page-header">
				<button class="new-project btn btn-default" data-toggle="modal"
					data-target=".project">새 프로젝트</button>
				<input class="searchbar form-control" type="text"
					placeholder="Search">
			</div>
			
			<div class="page-contents">
				<div class="project-box">
					<div class="project-header">
						<c:choose>
							<c:when test="${list.privacy eq 'private'}">
								<i class="fas fa-lock"></i>
								<!-- <span class="glyphicon glyphicon-lock"></span> -->
							</c:when>
							<c:otherwise>
								<i class="fas fa-globe"></i>
								<!-- <span class="glyphicon glyphicon-globe"></span> -->
							</c:otherwise>
						</c:choose>
						<span>프로젝트명</span>
						<!-- <span class="glyphicon glyphicon-cogwheel"></span> -->
					</div>
					<div class="project-side">
						<c:choose>
							<c:when test="${list.star eq 0}">
								<i class="far fa-star"></i>
								<!-- <span class="glyphicon glyphicon-star-empty"></span> -->
							</c:when>
							<c:otherwise>
								<i class="fas fa-star"></i>
								<!-- <span class="glyphicon glyphicon-star"></span> -->
							</c:otherwise>
						</c:choose>
						<i class="fas fa-cog"></i>
					</div>
					<div class="project-footer">
						<select class="status" name="status">
							<option value="">상태 없음</option>
							<option value="계획됨">계획됨</option>
							<option value="진행중">진행중</option>
							<option value="완료됨">완료됨</option>
							<option value="보류">보류</option>
							<option value="취소">취소</option>
						</select>
					</div>
				</div>
			</div>

			<div class="modal fade project" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h3>새 프로젝트</h3>
						</div>

						<form id="frm">
							<div class="modal-body">
								<div>
									<label for="title" class="control-label">제목</label> <input
										class="form-control" type="text" name="title"
										placeholder="프로젝트 제목을 입력하세요.">
								</div>

								<div>
									<label for="privacy" class="control-label">공개</label> <input
										type="radio" class="privacy" name="privacy" value="public" checked="checked">
									<label for="privacy" class="control-label">비공개</label> <input
										type="radio" class="privacy" name="privacy" value="private">
									<input type="hidden" name="status"> <input
										type="hidden" name="manager" value="${user.nickname}">
								</div>

								<div>
									<label for="members" class="control-label">프로젝트 멤버</label> <br>
									<span class="glyphicon glyphicon-plus"></span>
								</div>
							</div>
							
							<div class="modal-footer">
								<button id="create-project" class="btn btn-info">프로젝트 생성</button>
							</div>
						</form>

					</div>

				</div>
			</div>
		</div>
		<!-- /contents -->
	</div>

<P>  The time on the server is ${serverTime}. </P>

<a href="pmf/pmfList">find member</a>

</body>
</html>