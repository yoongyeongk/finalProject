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
</style>
<script type="text/javascript">
	$(function() {
		var nickname = '${user.nickname}';
		$.ajax({
			type : 'POST',
			url : "project/list",
			success : function(data) {
				alert(JSON.stringify(data));
			}
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
				<input class="searchbar form-control" type="text"
					placeholder="Search">
			</div>

			<div class="page-contents">
			</div>
		</div>
		<!-- /contents -->
	</div> 

</body>
</html>