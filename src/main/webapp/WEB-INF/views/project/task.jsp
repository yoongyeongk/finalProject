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
<script src="../resources/js/sidebar.js"></script>
<script src="../resources/js/task.js"></script>
<script src="../resources/js/moment.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.3/css/all.css" >
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="../resources/css/header.css">
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet" href="../resources/css/task.css">
<script type="text/javascript">
	$(function(){
		$(".fa-arrow-left").click(function() {
			history.back();
		});
	});
</script>

<body>
	<div id="main" class="wrapper">
		<c:import url="../temp/header.jsp"></c:import>
		<!-- contents -->
		<div class="dashboard">
			<div class="page-header">
				<i class="fas fa-arrow-left"></i>
				<!-- 프로젝트 명 추가 -->
				<input class="searchbar form-control" type="text" placeholder="Search">
			</div>
			
			<input type="hidden" name="project_id" value="${project_id}">
						
			<div id="sortable" class="page-contents">
				<div class="section open"></div>
				<div class="section in-progress"></div>
				<div class="section done"></div>
			</div>
			
			<div class="modal fade task-view">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header setting-header">
							<input type="hidden" name="task_id">
							<input class="form-control" type="text" name="title">
						</div>
								
						<div class="modal-body setting-pane">
							<!-- 체크리스트 -->
							<label>시작일</label>
							<input name="start_date" class="form-control" type="date">
							<hr>
							<label>마감일</label>
							<input name="close_date" class="form-control" type="date">
							<hr>
							<!-- 파일 업로드 -->
							<form id="fileForm" action="../fileUpload" method="post" enctype="multipart/form-data">
								<input type="file" id="file" name="files">
								<input type="button" value="저장" onclick="fileSave()">
							</form>
							<hr>
							<!-- 코멘트 -->
							<textarea class="reply form-control" name="comments"></textarea>
							<button class="reply-btn">코멘트 작성</button>
							
							<!-- 태그 -->
						</div>
							
						<div class="modal-footer">
							<button class="btn btn-info" id="update">완료</button>
							<button class="btn btn-warning" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- /contents -->
	</div> 

</body>
</html>