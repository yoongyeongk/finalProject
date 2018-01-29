<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/tenderList.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

<div class="all">
	<div class="box">
		<c:if test="${!empty list }">
		<table class="t_list">
			<tr>
				<th class="td_1">기업명</th>
				<th class="td_2">프로젝트 명</th>
				<th class="td_3">현재 경매가</th>
				<th class="td_4">마감일</th>
				<th class="td_5">나의입찰금액</th>
			</tr>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.corporation}</td>
					<td><a href="./tradeBoardView?num=${dto.num }&writer=${user.nickname}&curPage=1">${dto.title}</a></td>
					<td><fmt:formatNumber value="${dto.present_price }" type="currency" currencySymbol="￦"/></td>
					<td>${dto.closing_date }</td>
					<td>
						<c:forEach items="${tender }" var="t">
							<c:if test="${t.num eq dto.num }">
								<p><fmt:formatNumber value="${t.bidding_price }" type="currency" currencySymbol="￦"/></p>
								<c:if test="${dto.close eq 0 and dto.present_price eq t.bidding_price}"><p style="color: blue">[낙찰예정]</p></c:if>
								<c:if test="${dto.close eq 1 and dto.present_price eq t.bidding_price}"><p style="color: red">[낙찰됨]</p></c:if>
							</c:if>
							
						</c:forEach>
					</td>
				</tr>
			</c:forEach>
		</table>

		<div class="paging">
			<c:if test="${pager.curBlock gt 1 }"><a class="pg" href="./tenderList?curPage=${pager.startNum-1 }">&lt;</a></c:if>
			
				<c:forEach begin="${pager.startNum }" end="${pager.lastNum }" var="p">
					<a class="pg" href="./tenderList?curPage=${p }&writer=${user.nickname}">${p }</a>
				</c:forEach>
			
			<c:if test="${pager.curBlock lt pager.totalBlock }"><a class="pg" href="./tenderList?curPage=${pager.lastNum+1 }">&gt;</a></c:if>
		</div>
		</c:if>
		<c:if test="${empty list }">
			<h1 class="gui">입찰 내역이 없습니다</h1>
		</c:if>
	</div>
</div>

</body>
</html>