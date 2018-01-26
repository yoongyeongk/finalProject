<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hi!Project - my board list</title>
<style type="text/css">
#myWrite_wrap{
	width: 1000px;
    margin: 0 auto;
    text-align: center;
}
.board_wrap{
	margin: 50px 0;
}
.board_wrap p{
	height: 40px;
    line-height: 40px;
    background-color: #eee;
    border-radius: 3px;
    font-size: 17px;
    font-weight: 800;
}
.board_wrap span{
	float: right;
}
.my_t{
	margin-top: 60px;
    width: 100%;
}
.my_t th{
	text-align: center;
    font-size: 15px;
    font-weight: 600;
    height: 40px;
    background-color: #eee;
}
.my_t td{
	height: 35px;
}
.my_t tr{
	border: 1px solid #eee;
}
</style>
</head>
<body>
<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
<!-- header 끝 -->

	<section id="main">
		<div>
			<!-- 테이블 형식으로 만들기 
			//상태: 임시저장/완료
			//글제목: 없을 경우 제목 없음으로 넣기 - 전체
			//댓글: 글제목 옆에 표시 - pmf
			//체크박스: 한꺼번에 삭제하기 위해서 - 전체
			//마지막 수정일 - 전체
			//조회수: 완료 글만 - pmf/trade
			//내용 미리보기: 프로젝트 설명부분 미리보기 (overflow hidden) -->
		</div>
		
		<!-- 전체 div 목록 -->
		<div id="myWrite_wrap">
		
			<!-- 프로젝트 멤버 모집 리스트 -->
			<div id="pmfWrote_wrap" class="board_wrap">
				<p>프로젝트 멤버 모집</p>
				<span>전체 글 개수: ${fn:length(map.pmf)} 개</span>
				
				<table class="my_t">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
						<th>마감일</th>
						<th>조회수</th>
					</tr>
					<c:forEach items="${map.pmf}" var="dto" varStatus="i">
					<tr>
						<td>${i.count}</td>
						<td>${dto.title}</td>
						<td>${dto.reg_date}</td>
						<td>
							<c:if test="${dto.duration_kind ne '상시 모집'}">
							${dto.duration_end}
							</c:if>
							<c:if test="${dto.duration_kind eq '상시 모집'}">
							상시 모집
							</c:if>
						</td>
						<td>${dto.hit}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
		
			<!-- 프로젝트 매매 리스트 -->
			<div id="tradeWrote_wrap" class="board_wrap">
				<p>프로젝트 매매</p>
				<span>전체 글 개수: 0 개</span>
				
				<table class="my_t">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
						<th>마감일</th>
						<th>조회수</th>
					</tr>
					<c:forEach items="${map.trade}" var="dto" varStatus="i">
					<tr>
						<td>${i.count}</td>
						<td>${dto.title}</td>
						<td>${dto.reg_date}</td>
						<td>${dto.closing_date}</td>
						<td>${dto.hit}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			
			<!-- 임시저장 리스트 -->
			<div id="tempsave_wrap" class="board_wrap">
				<p>임시저장한 글</p>
				<span>전체 글 개수: 0 개</span>
				
				<table class="my_t">
					<tr>
						<th><input type="checkbox" id="temp_chBox" class="chBox chTotal"></th>
						<th>제목</th>
						<th>등록일</th>
						<th>내용</th>
					</tr>
					<c:forEach items="${map.temp}" var="dto">
					<tr>
						<td><input type="checkbox" class="chBox"></td>
						<td>${dto.title}</td>
						<td>${dto.reg_date}</td>
						<td>
							<c:if test="">
							${dto.contents}
							</c:if>
						</td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>
</body>
</html>