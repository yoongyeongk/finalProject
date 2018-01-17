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
				<button class="new-project btn btn-default" data-toggle="modal" data-target=".project">새 프로젝트</button>
				<input class="searchbar form-control" type="text" placeholder="Search">
			</div>
			
			<div class="page-contents">
			</div>

			<!-- sidebar -->
			<div class="project-properties">
				<div class="project-properties-header">
					<i class="far fa-star"></i>
					<input class="form-control" type="text">
				</div>
					
				<div class="project-properties-pane">
					<label for="status" class="control-label">프로젝트 상태</label>
					<select class="status" name="status">
						<option value="">상태 없음</option>
						<option value="">계획됨</option>
						<option value="">진행중</option>
						<option value="">계획됨</option>
						<option value="">완료됨</option>
						<option value="">보류</option>
						<option value="">취소</option>
					</select>
					<hr>
					<label>시작일</label>
					<input name="start-date" class="form-control" type="date">
					<hr> 
					<label>마감일</label>
					<input name="close-date" class="form-control" type="date">
					<hr>
					<label>프로젝트 관리자</label>
					<hr>
					<label>공개 프로젝트</label>
					<hr>					
				</div>
			</div>
			<!-- /sidebar -->

			<!-- modal -->
			<div class="modal fade project" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h3>새 프로젝트</h3>
						</div>

						<form id="frm">
							<div class="modal-body">
								<div>
									<label for="title" class="control-label">제목</label>
									<input class="form-control" type="text" name="title" placeholder="프로젝트 제목을 입력하세요.">
								</div>

								<div>
									<label for="privacy" class="control-label">공개</label>
									<input type="radio" class="privacy" name="privacy" value="public" checked="checked">
									<label for="privacy" class="control-label">비공개</label>
									<input type="radio" class="privacy" name="privacy" value="private">
									<input type="hidden" name="status">
									<input type="hidden" name="manager" value="${user.nickname}">
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
			<!-- /modal -->
		</div>
		<!-- /contents -->
	</div>
	<a href="pmf/pmfList">find member</a>
</body>
</html>