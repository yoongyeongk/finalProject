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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myWrite.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hi!Project - my board list</title>
<script type="text/javascript">
	$(function(){
		var message = '${message}';
		if(message != ''){
			alert(message);
		}
	});
</script>
</head>
<body>
<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
<!-- header 끝 -->

	<section id="main">
		<!-- 전체 div 목록 -->
		<div id="myWrite_wrap">
		
			<!-- 프로젝트 멤버 모집 리스트 -->
			<div id="pmfWrote_wrap" class="board_wrap">
				<p>프로젝트 멤버 모집</p>
				<span>전체 글 개수: ${fn:length(map.pmf)} 개</span>
				
				<table class="my_t">
					<tr>
						<th class="tr_num">번호</th>
						<th class="tr_title">제목</th>
						<th class="tr_regdate">등록일</th>
						<th class="tr_enddate">마감일</th>
						<th class="tr_hit">조회수</th>
					</tr>
					
					<c:if test="${not empty map.pmf}">
					<c:forEach items="${map.pmf}" var="dto" varStatus="i">
					<tr>
						<td>${i.count}</td>
						<td>
							<a href="../pmf/pmfView?num=${dto.num}">${dto.title}</a>
						</td>
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
					</c:if>
					
					<c:if test="${empty map.pmf}">
						<tr>
							<td colspan="5" rowspan="3">게시글이 없습니다.</td>
						</tr>
					</c:if>
				</table>
			</div>
		
			<!-- 프로젝트 매매 리스트 -->
			<div id="tradeWrote_wrap" class="board_wrap">
				<p>프로젝트 매매</p>
				<span>전체 글 개수: ${fn:length(map.trade)} 개</span>
				
				<table class="my_t">
					<tr>
						<th class="tr_num">번호</th>
						<th class="tr_title">제목</th>
						<th class="tr_regdate">등록일</th>
						<th class="tr_enddate">마감일</th>
						<th class="tr_hit">조회수</th>
					</tr>
					
					<c:if test="${not empty map.trade}">
					<c:forEach items="${map.trade}" var="dto" varStatus="i">
					<tr>
						<td>${i.count}</td>
						<td>
							<a href="../trade/tradeBoardView?num=${dto.num}&writer=${dto.writer}">${dto.title}</a>
						</td>
						<td>${dto.reg_date}</td>
						<td>${dto.closing_date}</td>
						<td>${dto.hit}</td>
					</tr>
					</c:forEach>
					</c:if>
					
					<c:if test="${empty map.trade}">
						<tr>
							<td colspan="5" rowspan="3">게시글이 없습니다.</td>
						</tr>
					</c:if>
				</table>
			</div>
			
			<!-- 임시저장 리스트 -->
			<div id="tempsave_wrap" class="board_wrap">
				<p>임시저장한 글</p>
				
				<!-- 계산식 -->
				<c:set var="pmf_size" value="${fn:length(map.pmfTemp)}"/>
				<c:set var="trade_size" value="${fn:length(map.tradeTemp)}"/>
				<c:set var="sum" value="${pmf_size+trade_size}"/>
				<!-- 계산 끝 -->
				
				<span>전체 글 개수: <c:out value="${sum}"/> 개</span>
				
				<table class="my_t">
					<tr>
						<th class="tr_num"><input type="checkbox" id="temp_chBox" class="chBox chTotal"></th>
						<th class="tr_kind">항목</th>
						<th class="tr_tmptitle">제목</th>
						<th class="tr_tmpcontents">내용</th>
						<th class="tr_regdate">등록일</th>
					</tr>
					
					<c:if test="${sum != 0}">
					<c:forEach items="${map.pmfTemp}" var="dto">
					<tr>
						<td><input type="checkbox" class="chBox"></td>
						<td class="td_kind">프로젝트 멤버 모집</td>
						<td class="td_title">
							<a href="../pmf/pmfUpdate?num=${dto.num}">
								<c:if test="${dto.title eq null}">
									제목 없음
								</c:if>
								<c:if test="${dto.title ne null}">
									${dto.title}
								</c:if>
							</a>
						</td>
						<td class="td_contents">${dto.project_detail}</td>
						<td>${dto.reg_date}</td>
					</tr>
					</c:forEach>
					<c:forEach items="${map.tradeTemp}" var="dto">
					<tr>
						<td><input type="checkbox" class="chBox"></td>
						<td class="td_kind">프로젝트 매매</td>
						<td class="td_title">
							<a href="../tradeSave/tradeSaveUpdate?save_num=${dto.save_num}">
								<c:if test="${dto.title eq null}">
									제목 없음
								</c:if>
								<c:if test="${dto.title ne null}">
									${dto.title}
								</c:if>
							</a>
						</td>
						<td class="td_contents">${dto.contents}</td>
						<td>${dto.reg_date}</td>
					</tr>
					</c:forEach>
					</c:if>
					<c:if test="${sum == 0}">
						<tr>
							<td colspan="5" rowspan="3">게시글이 없습니다.</td>
						</tr>
					</c:if>
				</table>
			</div>
		</div>
	</section>
</body>
</html>