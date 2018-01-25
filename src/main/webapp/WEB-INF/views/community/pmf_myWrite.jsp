<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
			<div id="pmfWrote_wrap">
				<p>프로젝트 멤버 모집</p>
				<span>전체 글 개수: 0 개</span>
				
				<table class="my_t">
					<tr>
						<th><input type="checkbox" id="pmf_chBox"></th>
						<th>제목</th>
						<th>등록일</th>
						<th>마감일</th>
						<th>조회수</th>
					</tr>
					<c:forEach items="${map.pmf}" var="dto">
					<tr>
						<td>${dto.title}</td>
						<td>${dto.reg_date}</td>
						<td>
							<c:if test="${dto.duration_kind ne '상시 모집'}">
							${dto.duration_date}
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
			<div id="tradeWrote_wrap">
				<p>프로젝트 매매</p>
				<span>전체 글 개수: 0 개</span>
				
				<table class="my_t">
					<tr>
						<th><input type="checkbox" id="trade_chBox"></th>
						<th>제목</th>
						<th>등록일</th>
						<th>마감일</th>
						<th>조회수</th>
					</tr>
					<c:forEach items="${map.trade}" var="dto">
					<tr>
						<td>${dto.title}</td>
						<td>${dto.reg_date}</td>
						<td>${dto.closing_date}</td>
						<td>${dto.hit}</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			
			<!-- 임시저장 리스트 -->
			<div id="tempsave_wrap">
				<p>임시저장한 글</p>
				<span>전체 글 개수: 0 개</span>
				
				<table class="my_t">
					<tr>
						<th><input type="checkbox" id="temp_chBox"></th>
						<th>제목</th>
						<th>등록일</th>
						<th>내용</th>
					</tr>
				</table>
			</div>
		</div>
	</section>
</body>
</html>