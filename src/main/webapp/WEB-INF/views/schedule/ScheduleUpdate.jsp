<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 수정페이지</title>
<style type="text/css">
#sTimeBox,#lTimeBox{
display:  inline-block;}
.updateform{
display: inline-block;
margin: 0 auto;
}
.cal_nav{
		margin: 0 auto;
		margin-top: 50px;
		height: 20px;
		margin-bottom: 5px;
	}
#sch_title{
width: 100%;
}
.basic_input{
border-style: none;
background-color: #f5f5f6;
padding-left: 20px;
padding: 10px;
margin-bottom: 10px;
}
#submitBtn{
background-color: rgb(22,160,133);
color: white;
font-weight: bold;
}
.part2 {
display : inline-block;
border-bottom: blue solid 1px;
margin-bottom: 10px;
font-size: 0.8em;
font-weight: bold;
}
#sch_contents{
border-style: none;
background-color: #f5f5f6;
margin-bottom: 10px;
}
.sch_colors{
display : inline-block;
margin-bottom: 10px;
} 
</style>
</head>
<body>
<div class="cal_nav"></div>
<div class="col-md-4"></div>
 <div class="updateform col-md-8">
<h1>일정 수정게시판</h1>
<form action="../schedule/scheduleUpdatePOST" method="post">
			<input type="hidden" name="id" value="${view.username}">	
			<input type="hidden" name="schnum" value="${view.schnum}">	
				<table class="addT">
								<tr>
								<td><input required="required" type="text" class="basic_input" id="sch_title"
									name="title" value="${view.title}" placeholder="제목입력해주세요."></td>
							</tr>
								<tr>
								<td><input required="required" class="basic_input" type="date" id="startDay"
									name="startday" value="${view.startday}"> - 
								<input type="date" class="basic_input" id="lastDay"
									name="lastday" value="${view.lastday}"></td>
							</tr>
							<tr class="part2"><td colspan="4">일정 상세정보</td></tr>
								<tr>
								<td class="label2">기존 시간 ${view.start_time} ~ ${view.last_time}</td></tr>
								<tr>
								<td>
										<div id="sTimeBox" class="sTime_box">일정 시간
										<select class="basic_input" id="startTime" name="start_time" required="required" value="${view.start_time}">
											<c:forEach begin="9" end="21" var="i" varStatus="num">
												<option id="sTime${num.count}" class="s_time">${i}:00</option>
											</c:forEach>
										</select>
									</div>
									<div id="lTimeBox" class="lTime_box">
											<select class="basic_input" id="lastTime" name="last_time" required="required" value="${view.last_time}">
											<c:forEach begin="9" end="21" var="i" varStatus="num">
												<option id="lTime${num.count}"  class="l_time">${i}:00</option>
											</c:forEach>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td class="label2">세부 내용</td></tr>
									<tr>
								<td><textarea rows="6" cols="80"
								required="required" id="sch_contents"
									name="pro_contents">${view.pro_contents}</textarea></td>
							</tr>
						<tr><td class="sch_colors"> 일정 색상 
						초록<input type="radio" name="color" checked="checked" value="rgb(22,160,133)">
						빨강<input type="radio" name="color" value="rgb(255,0,0)">
						노랑<input type="radio" name="color" value="rgb(225,225,54)">
						파랑<input type="radio" name="color" value="rgb(3,0,102)">
						갈색<input type="radio" name="color" value="rgb(130,0,0)">
						검정<input type="radio" name="color" value="rgb(0,0,0)">
						</td></tr>
<!-- 							<tr>
							<td class="label2">참석자 </td>
							</tr>
							<tr>
							<td><input type="text" id="partner"
									name="partner"></td>
							</tr> -->
						</table>

							<button id="submitBtn" class="btn">등록하기</button>
</form>
</div> 
</body>
</html>