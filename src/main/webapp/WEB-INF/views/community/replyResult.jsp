<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(function(){
		//3. update
		$(".r_update").click(function(){
			var re_btn = $(this);
			var rnum = $(this).parent().attr("title");
			event.stopPropagation();
			event.preventDefault();
			//ajax 페이지로 이동하기 전에 권한 확인할 것
			$.ajax({
				type: "GET",
				url: "../reply/pmfReplyUpdate?rnum="+rnum,
				success: function(data){
					$(".n_"+rnum).html(data);
					$(re_btn).click(function(){
						var contents = $(".contents_"+rnum).val();
						$.ajax({
							type: "POST",
							url: "../reply/pmfReplyUpdate",
							data: {
								rnum: rnum,
								contents: contents
							},
							success: function(data){
								alert(data.trim());
								location.reload();
							}
						});
					});
				}
			});
		});

		//4. delete
		$(".r_delete").click(function(){
			var rnum = $(this).parent().attr("title");
			event.stopPropagation();
			event.preventDefault();
			$.ajax({
				type: "GET",
				url: "../reply/pmfReplyDelete?rnum="+rnum,
				success: function(data){
					alert(data.trim());
					location.reload();
				}
			});
		});

		//6. reReply
		$(".tr_r").click(function(){
			var tr = $(this);
			var rnum = $(this).find(".t_4").attr("title");
			$(this).after('<tr class="reReply'+rnum+' re_reply"><td colspan="4"><textarea class="replyzone form-control" draggable="false">궁금한 내용을 자유롭게 써 주세요.</textarea><input type="button" class="reply_btn btn'+rnum+'" value="댓글 등록"></td></tr>');
			
			//대댓글 등록
			$(".btn"+rnum).click(function(){
				var contents = $(".reReply"+rnum).find(".replyzone").val();
				var ref = $(".ref"+rnum).val();
				$.ajax({
					type: "POST",
					url: "../reply/pmfReReply",
					data: {
						rnum: rnum,
						ref: rnum,
						writer: "writer",	//'${member}'
						contents: contents
					},
					success: function(data){
						alert(data.trim());
						location.reload();
					}
				});
			})
			
			//재클릭 시 닫힘
			$(tr).click(function(){
				$(".reReply"+rnum).remove();
			});
		});
		
	});
</script>
<c:if test="${not empty list}">
<table id="oList" class="t_reply1">
	<c:forEach items="${list}" var="dto">
		<tr class="tr_r">
			<td class="td_r t_1">${dto.writer}</td>
			<td class="td_r t_2 n_${dto.rnum}">
				<c:forEach begin="1" end="${dto.depth}">
				  ㄴ
				</c:forEach>
			${dto.contents}
			</td>
			<td class="td_r t_3">${dto.reg_date}</td>
			<td class="td_r t_4" title="${dto.rnum}"> 
				<span class="r_update r_btn glyphicon glyphicon-pencil"></span>
				<span class="r_delete r_btn glyphicon glyphicon-remove"></span>
			</td>
		</tr>
		<input type="hidden" class="ref${dto.rnum}" value="${dto.ref}">
	</c:forEach>
</table>
</c:if>
<c:if test="${empty list}">
<table id="noList" class="t_reply1">
	<tr>
		<td class="td_r" colspan="4">댓글이 존재하지 않습니다. 댓글을 등록해주세요.</td>
	</tr>
</table>
</c:if>

