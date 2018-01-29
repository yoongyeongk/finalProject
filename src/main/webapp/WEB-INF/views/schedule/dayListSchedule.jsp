<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <style>
#modalchang{
    min-width: 200px;
    min-height: 156px;
}
.tete{
width: 100%;
height: 10px;
}
.updateBtn,#deleteBtn,#partnerdeleteBtn{
border-style: none;
color: white;
background-color: black;
width: 47%;
margin-top: 5px;
margin-bottom: 5px;
}

.maimy{
font-weight :bolder;
font-size: 1.5em;}
#day_sc{
margin: 0 auto;
text-align: center;
}
#setset{
font-size: 2.4em;
text-align: center;
}
#pro_text{
border : lightgray 1px solid;

}
</style>
<script type="text/javascript">
$(function() {
	 $('#color').each(function() {
		 var i=$(this).val();
	$('.maimy').css('color', i);
	$('.tete').css('background-color', i);	
		});
	 
	$(".deleteBtn").click(function(){
		var schedule_num = $(this).val();
		$.ajax({
			type: "GET",
			url: "./scheduleDelete",  
			data:{
				schnum: schedule_num,
			},
			success: function(){
				//opener.location.reload();
				location.reload();
			}
		});
	});
	$(".partnerdeleteBtn").click(function(){
		var pnum =$(this).val();
		var num = $("#num").val();
		$.ajax({
			type: "GET",
			url: "./SchdulepartDelete",  
			data:{
				pnum: pnum,
				num : num
			},
			success: function(){
				//opener.location.reload();
				location.reload();
			}
		});
	});
	
	$(".updateBtn").click(function () {
		var num =  $("#num").val();
		window.open("./ScheduleUpdate?num="+num,"", "width=400, height=620, top=200, left=300");
	});	
});
</script>
<div id="modalchang">
<div class="tete"></div>
    <c:if test="${not empty list}">
    <c:forEach items="${list}" var="dto">
<div class="maimy"style="text-align: center;">TITLE : ${dto.title}</div>
<input type="hidden" value="${dto.num}" name="num" id="num">
<input type="hidden" value="${dto.username}" name="username">
<input type="hidden" value="${dto.schnum}" name="schnum" id="schnum">
<input type="hidden" value="${dto.color}" name="color" id="color">
	<table id="day_sc">
		<tr>
		<td> 	 주최자 : </td>
		 <c:if test="${dto.username ne dto.host}">
    <td>    ${dto.host}</td>
    </c:if>
    	 <c:if test="${dto.username eq dto.host}">
    <td> 본인[ ${dto.host} ] </td>
    </c:if>
        </tr>
	<tr><td>기간</td>
	<td>${dto.startday} ~ ${dto.lastday}</td>
	</tr>
	<tr><td>시간</td>
    	<td>${dto.start_time}~${dto.last_time}
    	</td></tr>
    	<tr><td>설명</td>
	<td><textarea readonly rows="3" cols="25" id="pro_text">${dto.pro_contents}</textarea></td>
	</tr> 

        
	<c:if test="${not empty nick}">
 	<tr><td>참석자 : </td>
 
    <td><c:forEach items="${nick}" varStatus="status" var="nickname">

	    <c:if test="${nickname.nickname ne user.nickname}">
    	${status.count}.${nickname.nickname} &nbsp  <input type="hidden" value="${nickname.nickname}" name="nicknaming" id="nicknaming">
    </c:if>
    	<c:if test="${nickname.nickname eq user.nickname}">
    		${status.count}.본인[${nickname.nickname}]
        <input type="hidden" value="${nickname.pnum}" id="partnerpnum" >
        </c:if>  
    </c:forEach>
    </td>
    
	</tr>
	</c:if>
    	
       	<tr><td colspan="2"><button class="updateBtn">수정</button>
       	
       	<c:choose>
       	<c:when test="${dto.num eq dto.schnum}" >
       	<button value="${dto.schnum}" id="deleteBtn" class="deleteBtn">삭제</button>
       	</c:when>
       	       	<c:when test="${dto.num ne dto.schnum}" >
        	<c:forEach items="${nick}" var="nickname">
        	<c:if test="${user.nickname eq nickname.nickname}">
       	<button id="partnerdeleteBtn" value="${nickname.pnum}" class="partnerdeleteBtn">삭제 
       	 </button>
       	 </c:if>
       	</c:forEach>
       	</c:when>
       	</c:choose>
       	
 
    	 </td></tr>
	</table>
    	  </c:forEach>
    	  </c:if>
    	  
    	  <c:if test="${empty list}">
 <div id="setset"><br>일정을 추가해주세요.</div></c:if>
  <div class="tete"></div>
  </div>