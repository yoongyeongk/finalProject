<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(function(){
		var snums = [];
		
		$(".wrap_total").click(function(){
			clickedDiv = $(this);
			var snum = clickedDiv.attr("id");
			var result = 0;
			clickedDiv.toggleClass("click");	
			
			if(snums.length == 0){	//배열 크기가 0일 경우, 새롭게 추가
				snums.push(snum);
			}else{					//배열 크기가 0이 아닌 경우, 해당 번호가 있는지 확인 후 추가
				for(var i=0; i<snums.length; i++){
					if(snum != snums[i]){			//번호가 없다면, 새롭게 추가	
						result = 0;	
					}else {
						result = i;
					}			
					alert("result: "+result);
					if(result>0){
						snums.splice(i,0);			//번호가 있다면, 배열에서 제거						
					}else{
						snums.push(snum);
					}
				}
			}
			alert(snums);
		});
	});
</script>
<style>
	.click{
		background-color: rgb(46, 170, 145);
	}
</style>
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