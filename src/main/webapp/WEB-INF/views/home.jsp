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
<script src="resources/js/sidebar.js"></script>
<script src="resources/js/project.js"></script>
<script src="resources/js/moment.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.3/css/all.css" >
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="resources/css/main.css">
<body>
<c:import url="temp/header.jsp"></c:import>
	<div id="main" class="wrapper">
		<!-- contents -->
		<div class="dashboard">
			<div class="page-header">
				<button class="new-project btn btn-default" data-toggle="modal" data-target=".project">새 프로젝트</button>
				<input class="searchbar form-control" type="text" placeholder="Search">
			</div>
			
			<div class="page-contents">
			</div>
			
			<!-- setting -->
			<div class="modal fade setting">
				<div class="modal-dialog">
					<div class="modal-content">
						<form id="update-frm">
							<input type="hidden" name="project_id">
							<div class="modal-header setting-header">
							</div>
								
							<div class="modal-body setting-pane">
								<label for="status" class="control-label">프로젝트 상태</label>
								<select id="status" name="status">
									<option value="">상태 없음</option>
									<option value="계획됨">계획됨</option>
									<option value="진행중">진행중</option>
									<option value="완료됨">완료됨</option>
									<option value="보류">보류</option>
									<option value="취소">취소</option>
								</select>
								<hr>
								<label>시작일</label>
								<input name="start_date" class="form-control" type="date">
								<hr> 
								<label>마감일</label>
								<input name="close_date" class="form-control" type="date">
								<hr>
								<label>프로젝트 관리자</label>
								<i class="fas fa-plus"></i>
								<hr>
								<label>공개 프로젝트</label>
								
								<label for="privacy" class="control-label">공개</label>
								<input type="radio" name="privacy" value="true">
								<label for="privacy" class="control-label">비공개</label>
								<input type="radio" name="privacy" value="false">
								
								<hr>
							</div>
							<div class="modal-footer">
								<button class="btn btn-info" id="update-project">수정</button>
								<button class="btn btn-warning" data-dismiss="modal">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- /setting -->

			<!-- new-project -->
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
									<i class="fas fa-plus"></i>
								</div>
							</div>
							
							<div class="modal-footer">
								<button id="create-project" class="btn btn-info">프로젝트 생성</button>
							</div>
						</form>

					</div>
				</div>
			</div>
			<!-- /new-project -->
		</div>
		<!-- /contents -->
			<a href="${pageContext.request.contextPath}/pmf/pmfList">find member</a>
			<p></p>
			<a href="${pageContext.request.contextPath}/trade/tradeBoardWrite">wt</a>
			<a href="${pageContext.request.contextPath}/trade/tradeBoardList">lt</a>
			<a href="${pageContext.request.contextPath}/trade/tradeBoardUpdate?num=31">ut</a>
	</div>
	<a href="pmf/pmfList">find member</a>

<P>  The time on the server is ${serverTime}. </P>

<a href="pmf/pmfList">find member</a>
<p></p>
<a href="${pageContext.request.contextPath }/trade/tradeBoardWrite">wt</a>
<a href="${pageContext.request.contextPath }/trade/tradeBoardList">lt</a>
<a href="${pageContext.request.contextPath }/trade/tradeBoardUpdate?num=31">ut</a>
<a href="schedule/mainSchedule">your schedule</a>
</body>
</html>