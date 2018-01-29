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
<script src="../resources/js/sidebar.js"></script>
<script src="../resources/js/task.js"></script>
<script src="../resources/js/comment.js"></script>
<script src="../resources/js/moment.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.3/css/all.css" >
<link rel="stylesheet" href="../resources/css/header.css">
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/task.css">
<body>
	<div id="main" class="wrapper">
		<c:import url="../temp/header.jsp"></c:import>
		<!-- contents -->
		<div class="dashboard">
			<div class="page-header">
				<i class="fas fa-arrow-left"></i> <input
					class="searchbar form-control" type="text" placeholder="Search">
			</div>

			<input type="hidden" name="project_id" value="${project_id}">

			<div class="sortable-x page-contents">
				<div class="section-wrap"><div class="section-header open-header"><label>Open</label></div><div class="section sortable-y open"></div></div>
				<div class="section-wrap"><div class="section-header in-progress-header"><label>In-Progress</label></div><div class="section sortable-y in-progress"></div></div>
				<div class="section-wrap"><div class="section-header done-header"><label>Done</label></div><div class="section sortable-y done"></div></div>
			</div>
			
			<div class="modal fade task">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h3>새 업무</h3>
						</div>
							<div class="modal-body new-task-modal">
								<form id="task-form" action="create" method="post">
									<label for="title" class="control-label">제목</label>
									<input class="form-control" type="text" name="title" placeholder="프로젝트 제목을 입력하세요.">
									
									<input type="hidden" name="project_id" value="${project_id}">
									<div><label for="status-label" class="control-label">업무 상태</label></div>
									<label for="status" class="control-label">Open</label>
									<input type="radio" class="status" name="status" value="" checked="checked">
									<label for="status" class="control-label">In Progress</label>
									<input type="radio" class="status" name="status" value="1">
									<label for="status" class="control-label">Done</label>
									<input type="radio" class="status" name="status" value="2">
								</form>
							</div>
							<div class="modal-footer">
								<input type="button" id="create-task" class="btn btn-info" value="업무 생성">
							</div>
					</div>
				</div>
			</div>

			<div class="modal fade task-view">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- view -->
						<div class="modal-body setting-pane">
							<form id="update-form" action="update" method="post">
								<input type="hidden" name="task_id">
								<label>제목</label>
								<input class="form-control" type="text" name="title">
								<hr>
								<label>시작일</label> <input name="start_date" class="form-control" type="date">
								<label>마감일</label> <input name="close_date" class="form-control" type="date">
								<div><label for="status-label" class="control-label">업무 상태</label></div>
								<label for="status" class="control-label">Open</label>
								<input type="radio" class="status" name="status" value="" checked="checked">
								<label for="status" class="control-label">In Progress</label>
								<input type="radio" class="status" name="status" value="1">
								<label for="status" class="control-label">Done</label>
								<input type="radio" class="status" name="status" value="2">
							</form>
							<hr>
							<!-- 업로드 파일 리스트 -->

							<!-- 파일 업로드 -->
							<form id="fileForm" action="file/upload" method="post" enctype="multipart/form-data">
								<input type="file" name="file">
							</form>
							<hr>
							<!-- 코멘트 작성폼 -->
							<form id="comment-form" action="post">
								<textarea class="input-comment form-control" name="contents"></textarea>
								<input type="hidden" name="writer" value="${user.nickname}">
								<input type="hidden" name="task_id">
								<button class="new-comment" type="button">코멘트 작성</button>
							</form>
							<!-- 코멘트 리스트 -->

							<div class="comment-list"></div>
						</div>

						<div class="modal-footer">
							<button class="btn btn-info" id="update-task">완료</button>
							<button class="btn btn-warning" data-dismiss="modal">취소</button>
						</div>
					</div>
					<!-- /view -->
				</div>
			</div>
		</div>
		<!-- /contents -->
	</div> 

</body>
</html>