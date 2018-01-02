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
<style>
.searchbar {
	float: right;
	width: 20%;
	padding-left: 30px;
	background-image: url("resources/images/search-icon.png");
	background-size: 10px;
	background-position: 10px 12px;
	background-repeat: no-repeat;
}

.new-project {
	display: inline-block;
}

.dashboard {
	margin: 100px;
	height: inherit;
}
.page-contents {
	height: inherit;
}

.task {
	width: 295px;
	display: inline-block;
	background-color: #e0e0e0;
}

.task #important {
	margin-left: 5px;
}

.task #title {
	width: 80%;
	display: inline-block;
}

.task-header {
	margin: 5px;
}

.task-header #new-task {
	background-color: transparent;
	border-color: transparent;
	color: white;
	font-size: 20px;
}

.task-input textarea {
	width: 96%;
	margin: 0 5px;
	resize: vertical;
    min-height: 50px;
}

.task-input button {
	float: right;
	margin: 5px 5px 5px 0;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".draggable").draggable({
			/* axis : "x", */
			containment : "parent"
		});
	});
</script>
<body>
	<div id="main" class="wrapper">
		<c:import url="temp/header.jsp"></c:import>
		<!-- contents -->
		<div class="dashboard">
			<div class="page-header">
				<button class="new-project btn btn-default">+새 프로젝트</button>
				<input class="searchbar form-control" type="text" placeholder="Search">
			</div>

			<div class="page-contents">
				<!-- task -->	
				<div class="draggable task">
					<div class="task-header">
						<input id="complete" class="checkbox-inline" type="checkbox">
						<input id="title" class="form-control" type="text" placeholder="업무 리스트 이름">
						<button id="new-task">+</button>
					</div>
					
					<div class="task-input">
						<textarea class="form-control" placeholder="새 업무 작성"></textarea>
						<button class="btn btn-default">작성</button>
						<button class="btn btn-default">취소</button>
					</div>
				</div>
				<!-- /task -->
			</div>

		</div>
		<!-- /contents -->
	</div> 

</body>
</html>