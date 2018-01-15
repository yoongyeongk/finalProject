<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${list}" var="dto">
	<div class="wrap_total">
		<div class="wrap_1">
			<div class="image">이미지</div>
			<c:if test="${dto.pmfBoardDTO.duration_kind != '상시 모집'}">
			<p class="d-day">D-O</p>
			</c:if>
			<c:if test="${dto.pmfBoardDTO.duration_kind == '상시 모집'}">
			<p class="d-day">상시모집</p>
			</c:if>
		</div>
		<div class="wrap_2">
			<p class="project_title">${dto.pmfBoardDTO.project_name}</p>
			<div class="works_list">
				<ul>
					<li>list1</li>
					<li>list2</li>
				</ul>
			</div>
			<div class="tags_list">
				<%-- <c:forEach items="" var="tag"> --%>
				<a href="#">#tag1</a> <a href="#">#tag2</a>
				<%-- </c:forEach>  --%>
			</div>
		</div>
	</div>
</c:forEach>