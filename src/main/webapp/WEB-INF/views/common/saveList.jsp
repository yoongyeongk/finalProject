<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${!empty list }">
	<ul>
	 <c:forEach items="${list }" var="dto">
			<li class="save_li" id="save_li${dto.save_num}">
				<a class="viewLink" href="javascript:void(0)" title="${dto.save_num }">
					<c:if test="${dto.save_num eq num_compare }">
						<span style="color:sienna;">[현재글]</span>
					</c:if>${dto.title }
				</a>
						<span class="w_date">${dto.reg_date }</span>
						<span class="list_x" title="save_li${dto.save_num}" id="${dto.save_num }">
						<img src="${pageContext.request.contextPath }/resources/images/tradeBoard/btn_close.gif">
					</span>
				</li>
	</c:forEach>
			</ul>
			
		<div class="pageBox">
			<c:if test="${pager.curBlock gt 1}">
				<span class="page" title="${pager.startNum-1 }">&lt; </span>
			</c:if>
			
			<c:forEach begin="${pager.startNum }" end="${pager.lastNum }" var="i">
				<span class="page" title="${i}">${i }</span>
			</c:forEach>
			
			<c:if test="${pager.curBlock lt pager.totalBlock}">
				<span class="page" title="${pager.lastNum+1 }"> &gt;</span>
			</c:if>
		</div>
	</c:when>

	<c:otherwise>
		<div style="margin:  0 auto; text-align: center; border: 1px solid">
			<p style="margin: 0;">저장된 게시물이 없습니다</p>
		</div>
	</c:otherwise>
</c:choose>
<script>
	function getCount() {
		totalCount = ${count}
	}
</script>