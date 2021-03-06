<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript">
	$(function(){
		var num;
		<c:forEach items="${list}" var="dto">
			num = ${dto.num};
		</c:forEach>
		
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
							}
						});
						replyList(num);
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
				}
			});
			replyList(num);
		});

		//6. reReply
		$(".tr_r").click(function(){
			var tr = $(this);
			var rnum = $(this).find(".t_4").attr("title");

			$(".reReply"+rnum).toggle();
		});
		
		//대댓글 등록
		$(".reReply_btn").click(function(){
			var rnum = $(this).attr("title");
			var contents = $(".reReply"+rnum).find(".replyzone").val();
			var ref = $(".ref"+rnum).val();
			$.ajax({
				type: "POST",
				url: "../reply/pmfReReply",
				data: {
					rnum: rnum,
					ref: rnum,
					writer: "${user.username}",
					nickname: "${user.nickname}",
					contents: contents
				},
				success: function(data){
					alert(data.trim());
				}
			});
			replyList(num);
		});
		
	});
</script>
<c:if test="${not empty list}">
<table id="oList" class="t_reply1">
	<c:forEach items="${list}" var="dto">
		<tr class="tr_r">
			<td class="td_r t_1">${dto.nickname}</td>
			<td class="td_r t_2 n_${dto.rnum}">
				<c:forEach begin="1" end="${dto.depth}">
				  ㄴ
				</c:forEach>
			${dto.contents}
			</td>
			<td class="td_r t_3">${dto.reg_date}</td>
			<c:if test="${user.username eq dto.writer}">
			<td class="td_r t_4" title="${dto.rnum}"> 
				<span class="r_update r_btn glyphicon glyphicon-pencil"></span>
				<span class="r_delete r_btn glyphicon glyphicon-remove"></span>
			</td>
			</c:if>
			
		</tr>
		
		<tr class="reReply${dto.rnum} re_reply" style="display: none;">
			<td colspan="4">
				<textarea class="replyzone form-control" draggable="false">궁금한 내용을 자유롭게 써 주세요.</textarea>
				<input type="button" class="reReply_btn" title="${dto.rnum}" value="댓글 등록">
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

