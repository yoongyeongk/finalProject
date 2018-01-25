<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="list" var="dto">
	<table class="t_compare">
		<tr class="project_name">
			<td>${dto.pmfBoardDTO.project_name}</td>
		</tr>
		<tr class="compare_tr duration">
			<td>${dto.pmfBoardDTO.start_date} ~ ${dto.pmfBoardDTO.end_date}</td>
		</tr>
		<tr class="compare_tr work">
			<td>
			${dto.pmfBoardDTO.major_key}
			<c:forTokens items="${dto.pmfBoardDTO.sub_key}" delims="/" var="keys">
				${keys}
			</c:forTokens>
			</td>
		</tr>
		<tr class="compare_tr work_detail">
			<td>${dto.pmfBoardDTO.works}</td>
		</tr>
		<tr class="compare_tr condition">
			<td>${dto.pmfBoardDTO.work_kind} / 
			${dto.pmfBoardDTO.payment_kind}
			<c:if test="${not empty dto.pmfBoardDTO.payment_value}">
			${dto.pmfBoardDTO.payment_value}
			</c:if>
			</td>
		</tr>
		<tr class="compare_tr experience">
			<td>${dto.pmfBoardDTO.education_level} / ${dto.pmfBoardDTO.career}</td>
		</tr>
		<tr class="compare_tr host">
			<td>${dto.pmfBoardDTO.firm_info}</td>
		</tr>
		<tr class="compare_tr addr">
			<td>${dto.pmfBoardDTO.addr}</td>
		</tr>
		<tr>
			<td><input type="button" data-value="${dto.num}" id="view_btn" value="원본 글 보기"></td>
		</tr>
	</table>
</c:forEach>