<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(function(){
		//cnt 다시 조정하기 여러개에 걸쳐서 적용됨
		var cnt = 0;
		
		$(".wrap_total").click(function(){
			var clickedDiv = $(this);
			cnt++;
			if(cnt%2 != 0){
				clickedDiv.css("background-color","rgb(46, 170, 145)");				
			}else{
				clickedDiv.css("background-color","rgba(26, 188, 156, 0.39)");
			}
			
		});
	});
</script>
<c:forEach items="${list}" var="dto">
	<div class="wrap_total" id="${dto.snum}">
		<div class="wrap_1">
			<div class="image">이미지</div>
			<c:if test="${dto.pmfBoardDTO.duration_kind != '상시 모집'}">
				<c:if test="${not empty dto.fin}">
					<p class="d-day">${dto.fin}</p>
				</c:if>
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