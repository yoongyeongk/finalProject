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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="resources/css/main.css">
<script type="text/javascript">
	$(function() {
		$("#create-project").click(function() {
			var param = $("#frm").serialize();
			$.ajax({
				type : 'POST',
				url : "/project/create",
				data : param,
				success : function(data) {
					if (data == 0)
						alert("프로젝트 생성에 실패하였습니다.");
				}
			});
		});
		list();
	});

	function list() {
		$.ajax({
			type : 'POST',
			url : "project/list",
			success : function(data) {
				var html = '';
				// alert(JSON.stringify(data));
				$.each(data, function(key, value) {
					html += '<h4>' + value.title + '</h4>';
				});
				// $(".project-box").html(html);
			}
		});
	}
</script>
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
					<div>
						<span class="glyphicon glyphicon-lock"></span>
						<span class="glyphicon glyphicon-global"></span>
						<span>프로젝트명</span>
						<span class="glyphicon glyphicon-star-empty"></span>
						<span class="glyphicon glyphicon-star"></span>
						<span class="glyphicons glyphicons-cogwheel"></span>
						<select>
							<option>상태 없음</option>
							<option>계획됨</option>
							<option>상태없음</option>
							<option>상태없음</option>
							<option>상태없음</option>
							<option>상태없음</option>
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
										type="radio" class="privacy" name="privacy" value="public">
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

</body>
</html>