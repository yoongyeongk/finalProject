<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src='http://momentjs.com/downloads/moment.js'></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@3.6.2/dist/fullcalendar.min.js'></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@3.6.2/dist/fullcalendar.min.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@3.6.2/dist/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script type="text/javascript" src="../resources/fullCal/locale/ko.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	 $('#partadd').on('click', function(){
		 var nickname = $('#partner').val();
		 var mynick =$('#mynick').val();
         $.ajax({
             type: 'POST',
             url: '../users/usersNickCheck',
             data: {
            	 nickname : nickname,
                 mynick : mynick
             },
             success: function(data){
                 if(data.result == nickname && data.result != mynick){
                   alert('추가가능한 닉네임입니다.');
                	var text = document.getElementById("partner").value;
                	 var plusUl = document.createElement('input');
                	 var plus = document.createElement('div');
                	 var jbBtn= document.createElement("input");
                	 
                	 plusUl.style.display="none";
                	 plusUl.className="addnick";
                	 plusUl.setAttribute("name", "nickname");
                	 plusUl.setAttribute("value", text);
                	 
                	 plus.style.display="inline-block";
                	 plus.innerHTML = text;   
                	 
                	 
                	 jbBtn.type="button";
                	 jbBtn.className = "delete";
                	 jbBtn.value="X";
                	 document.getElementById('nick').appendChild(plusUl);
                	 document.getElementById('nick').appendChild(plus);
                	 document.getElementById('nick').appendChild(jbBtn);
                	 
					$(".delete").click(function() {
						plusUl.remove();
						plus.remove();
						jbBtn.remove();
					});
                 }else if(data.result == mynick){
                	 alert('본인닉네임입니다.');
                 }
                 else{
                	 alert('등록되어있지않은 닉네임입니다.');
                 }
             },
             error:function(){
                 alert("에러입니다");
         }
         });    //end ajax    
     });    //end on    	
	$(function(){
		var message = '${message}';
		if(message != ""){
			alert(message);
		}
	//get the modal
	var modal = $(".modal");
	
	//get the open button
	var btn = $("#myBtn");
	
	//get the close button
	var closeBtn = $(".close");
	
	//close modal
	$(closeBtn).click(function(){
		$(modal).hide();
	});
	
	//start_date option: 현재 날짜보다 이전 날짜는 선택 금지
	$(document).ready(function(){
		var today = new Date();
		var fmtToday = today.getFullYear()+"-"+(today.getMonth()+1)+"-"+(today.getDate()+1);
		$("#startDay").attr("min",fmtToday);
	});
	//close modal when clicks outside
	window.onclick = function(event){
		if(event.target == modal){
			modal.style.display = "none";
		}
	}
	
	//calendar
	$('#calendar').fullCalendar({
		header: {
			left: 'prev',
			center: 'title',
			right: 'today,next'
		},
		dayClick: function(date, allDay, jsEvent, view){
			var yy = date.format("YYYY");
			var mm = date.format("MM");
			var dd = date.format("DD");
		 	var day = date.format("YYYY-MM-DD");
		 	
			openList(day); 
		},
		selectable: true,
		selectHelper: true,
		defaultDate: new Date(),
		lang: "ko",
		navLinks: false, // can click day/week names to navigate views
		editable: false,
		eventLimit: true,
		eventSources:[
			{
				url: "../schedule/ScheduleJson",
				type: "POST",
				dataType : "json",
				data: {
					//나중에 멤버로 받아오기 
					username: '${user.username}'
					},
				error: function(xhr,status,error){
					alert(error);
				}
			},
		],
		eventRender: function(event, element){
			
			var start = new Date(event.start);
			var end = new Date(event.end);
		}
	});
	

	function openList(day){
		$("#myModal").show();
		$("#list_sec").show();
		$(".listClose").show();
		
 		$.ajax({
			type: "POST",
			url: "../schedule/ScheduleDayJson",
			data: {
				startday: day,
				lastday : day,
				//나중에 멤버로 받아오기 
				username: '${user.username}',
				type: 'list'
			},
			success: function(data){
				$("#list_sec").html(data);
			},
			error: function(xhr,status,error){
				alert(error);
			} 
		});		
	}
	$(".listClose").click(function(){
		$("#myModal").hide();
		$(".listClose").hide();
		$("#list_sec").hide();
	});
	$("#startTime").change(function(){
		alert($(this).val());
	});
	});
});

</script>
<style type="text/css">
#list_sec{
	display: none;
	width: 100%;
}
	body {
	
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}
	#calendar {
		max-width: 650px;
		margin-top: 10px;
	}
 	.cal_nav{
		margin: 0 auto;
		margin-top: 50px;
		height: 20px;
		margin-bottom: 5px;
	}

	#title{
	font-size: 1.7em;
    color: #212121;
    height: 28px;
    position: relative;
    top: 2px;
    width: 100%;
    margin-bottom: 20px;
    box-shadow: 0px 5px 10px rgb(213,213,213);
	}
	.sch_input{
	width: 45%;
border-style: none;
background-color: #f5f5f6;
padding-bottom: 10px;
padding-top: 10px;
margin-bottom: 10px;
}
	.label2{
	padding-top : 10px;
	border-radius: 10px;
	}
	.addT{
	margin-top : 5%;
	height :200px;
	}
 	.modal {
    display: none; /* Hidden by default */
    z-index: 999; /* Sit on top */
    padding-top:5%; /* Location of the box */  
    width: 100%; /* Full width */
    height: 100%; /* Full height */
}

/* Modal Content */
.modal_content {
     background-color: #F6F6F6; 
    margin: auto;
    padding: 20px;
   border: 2px double #16A085;
    border-radius: 8px; 
    width: 25%;
    box-shadow: 0 4px 8px 0 rgba(170, 170, 170, 0.42), 0 6px 20px 0 #888;
   -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.8s;
    animation-name: animatetop;
    animation-duration: 0.8s 
} 
/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}
#startTime,#lastTime{
	width: 100%;
	padding: 2px;
	border-radius: 4px;
	padding-top: 5px;
	padding-bottom: 4px;
	font-size: 0.7em;
}
#lTime{
	width: 100%;
	padding: 2px;
	border-radius: 4px;
	padding-bottom: 7px;
	font-size: 0.7em;
}
.sTime_box{
	display: inline-block;
	width: 45%;
	margin-right: 4px;
}
.lTime_box{
	display: inline-block;
	width: 45%;
}
#submitBtn{
	width: 50%;
	height: 35px;
	font-size: 1em;
	font-weight: 600;
	border-radius: 5px;
	margin-top: 10px;
	margin-bottom : 10px;
	margin : 0 auto;
	display: block;
	background-color: #e7e7e7; 
}
#submitBtn:hover{
	background: #ddd;
}
/* .fc-event, .fc-event:hover {
background-color: rgb(22,160,133);
border-color: rgb(22,160,133);
}
 */
</style>
</head>
<body>
<div class="col-md-3"></div>
		<div class="col-md-8">
	<div class="cal_nav">			
		</div>		
		<div class="col-md-7">
			<div style="width: 100%" id='calendar'></div>
		</div>
		<div class="cal_nav col-md-5">

	<form class="event_form" action="../schedule/ScheduleWrite" method="post">
					<!-- 	//나중에 멤버로 받아오기  --> 
			<input type="hidden" name="username" value="${user.username}">	
		 			<input type="hidden" id="mynick" name="mynick" value="${user.nickname}">
				<table class="addT">
								<tr colspan="4">
								<td><input required="required" type="text" id="title" placeholder="프로젝트 명"
									name="title"></td>
							</tr>
								<tr>
								<td><input required="required" class="sch_input" type="date" id="startDay"
									name="startday">
								<input type="date" class="sch_input" id="lastDay"	name="lastday"></td>
							</tr>
									<tr>
								<td><textarea rows="3" cols="40"
								required="required" id="contents"
									name="pro_contents" placeholder="세부내용을 작성해주세요."></textarea></td>
							</tr>
							<tr>
								<td class="label2">일정 시간 </td></tr>
								<tr>
								<td>
									<div id="sTimeBox" class="sTime_box">
										<select id="startTime" name="start_time" required="required">
											<c:forEach begin="9" end="21" var="i" varStatus="num">
												<option id="sTime${num.count}" class="s_time">${i}:00</option>
											</c:forEach>
										</select>
									</div>
									<div id="lTimeBox" class="lTime_box">
											<select id="lastTime" name="last_time" required="required">
											<c:forEach begin="9" end="21" var="i" varStatus="num">
												<option id="lTime${num.count}"  class="l_time">${i}:00</option>
											</c:forEach>
										</select>
									</div>
								</td>
							</tr>
						<tr>
							<td class="label2"><input type="text" id="partner"
									name="nickinput" placeholder = "참석자 닉네임 입력">
									<input id="partadd" type="button" value="추가"><br>
							</td></tr>
						</table>
							 <div id="nick" style="display: inline-block;"></div>						
						<table>
						<tr><td class="label2">일정 배경 색상</td><tr>
						<tr><td>
						초록<input type="radio" name="color" checked="checked" value="rgb(22,160,133)">
						빨강<input type="radio" name="color" value="rgb(255,0,0)">
						노랑<input type="radio" name="color" value="rgb(225,225,54)">
						파랑<input type="radio" name="color" value="rgb(3,0,102)">
						갈색<input type="radio" name="color" value="rgb(130,0,0)">
						검정<input type="radio" name="color" value="rgb(0,0,0)">
						</td></tr>
						</table>
							<button type="submit" id="submitBtn" class="btn">등록하기</button>
						</form>
		</div>
		</div>
		<!--  색상 : rgb(22,160,133) -->
	<!-- Modal -->
	<div id="myModal" class="modal">		
		<!-- Modal Content -->
		<div class="modal_content">		
			<!-- close button -->
			<span class="close">&times;</span>			
			<div id="list_sec">
			</div>
		</div>
		
	</div>
	
</body>
</html>