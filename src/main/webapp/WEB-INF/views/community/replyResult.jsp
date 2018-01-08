<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(function(){
		//3. update
		$(".r_update").click(function(){
			alert("update");
		});

		//4. delete
		$(".r_delete").click(function(){
			alert("delete");
		});
		
		//5. paging
		var curPage = ${curPage};
		//$(".t_reply").attr("id",curPage);
		
		//paging
		$(".reply_add").click(function() {
			//var curPage = $(".t_reply").attr("id")*1;
			alert(curPage);
			curPage = curPage + 1*1;
			$.ajax({
				url: "../reply/pmfReplyList",
				type: "POST",
				data: {
					num: number,
					curPage: curPage
				},
				success: function(data){
					$("#reply_sec").html(data);
				}
			});
		});
	});
</script>
<c:if test="${not empty list}">
	<c:forEach items="${list}" var="dto">
		<tr>
			<td class="td_r t_1">${dto.writer}</td>
			<td class="td_r t_2">${dto.contents}</td>
			<td class="td_r t_3">${dto.reg_date}</td>
			<td class="td_r t_4" title="${dto.num}">
				<span class="r_update r_btn glyphicon glyphicon-pencil"></span>
				<span class="r_delete r_btn glyphicon glyphicon-remove"></span>
			</td>
		</tr>
	</c:forEach>
</c:if>
<c:if test="${empty list}">
	<tr>
		<td class="td_r" colspan="4">댓글이 존재하지 않습니다. 댓글을 등록해주세요.</td>
	</tr>
</c:if>

