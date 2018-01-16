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
<script type="text/javascript" src="./locale/ko.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainScheduleCss.css">
<script type="text/javascript">
$(document).ready(function() {

	var eventDay;
	var tCheck = false;
	
	function onchangeDay(yy,mm,dd){		
		$("#event").html(yy+"년 "+mm+"월 "+dd+"일");
		eventDay = new Date(yy, mm, dd);
	};
	//view 페이지 ajax 함수
	function scheduleList(day){
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/schedule/mainScheduleList.schedule",
			data: {
				start_date : day,
				tid: 'choa',//${dto.id}
				type: 'list'
			},
			success: function(data){
				$("#eventDetail").html(data);
			}
		});
	};
	
	//write 폼 input value 함수
	function dayEventValue(day){
		$("#startDate").val(day);
	};
	
	//write 제약 조건
	//이미 예약된 시간 예약 불가 (클릭 막기)
	function reserveCheck(day){
		$.ajax({
			type: "POST",
			url: "../schedule/mainScheduleList.schedule",
			data: {
				start_date: day,
				tid: 'choa',//${dto.id}
				type: 'check'
			},
			success: function(data){
				var reservList = data.trim().split(";");
				var tTable = document.getElementsByClassName("tTable");
				var ableTimes = new Array();
				
				//기존의 값 불러서 비교값 형식에 맞게 변환 -> 배열에 넣기
				for(var i=0; i<tTable.length; i++){				
					ableTimes.push(tTable[i].innerHTML.replace(":00",""));
				}
				
				//DB에서 불러온 시간과 비교하여 같으면 disable 상태로 바꾸고 css 변환
				for(var j=0; j<reservList.length-1; j++){	
					for(var i=0; i<ableTimes.length; i++){
						if(reservList[j] == ableTimes[i]){
							//true: 예약된 시간
							var disAbled = tTable[i];
							$(disAbled).addClass("disAbledTime");
							$(".disAbledTime").off("click");
						}
					}
				}
			}
		});
	}
	//휴무 시 예약 불가
	function trainerHoliday(day){
		$.ajax({
			type: "POST",
			url: "../schedule/trainerHolidayCheck.schedule",
			data: {
				tid: 'choa'
			},
			success: function(data){
				var reservList = data.trim().split(";");
				
				if(reservList != ""){
					for(var i=0; i<reservList.length-1; i++){
						if(reservList[i] == day){
							$("#holidayNotice").show();
							$("#addForm").hide();
							$("#eventDetail").html('<p class="text-info">해당 날짜에 스케쥴이 없습니다.</p>');
						}
					}
				}
			}	
		})
	}
	
	//현재 날짜보다 이전 날짜는 예약 불가
	function notReserveDate(){
		alert("예약은 하루 전까지만 가능합니다.");
		//$("#eventAdd").html("예약 가능한 날짜를 선택해주세요."); 내용 수정하기
	}
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev',
			center: 'title',
			right: 'next'
		},
		dayClick: function(date, allDay, jsEvent, view){
			var yy = date.format("YYYY");
			var mm = date.format("MM");
			var dd = date.format("DD");
			var day = date.format("YYYY-MM-DD");
			
			onchangeDay(yy,mm,dd);
			//view 페이지 ajax 함수
			$(".tTable").removeClass("disAbledTime");
			$("#startTime").val("");
			$("#addForm").show();
			$("#holidayNotice").hide();
			
			/* //트레이너 휴무 확인 함수
			trainerHoliday(day);
			 */
			//start_time value 함수
			$(".tTable").on("click",function(){
				var reservTime = $(this).text();
				var reserve = reservTime.replace(":00","");
				
				if($("#startTime").val() == reserve){
					$("#startTime").val("");	
					$(".tTable").removeClass("selectTime");
				}else{
					$("#startTime").val(reserve);
				}	
				
				$(this).addClass("selectTime");
			}); 
			
			if(date > new Date()){	//현재 날짜보다 이후 날짜를 클릭했을 때
				//write form input value 함수
				dayEventValue(day);
				reserveCheck(day);
			}else{	//현재 날짜보다 이전 날짜를 클릭했을 때
				notReserveDate();	
			}
			scheduleList(day);
			
			//트레이너 휴무 확인 함수
			trainerHoliday(day);
			
		},
		selectable: true,
		selectHelper: true,
		defaultDate: new Date(),
		lang: "ko",
		navLinks: false, // can click day/week names to navigate views
		editable: false,
		eventLimit: true, // allow "more" link when too many events
		businessHours: true,
		//데이터 부분 어떻게 넣을지 다시 써보고 Test 해보기
		eventSources: [
			{
				url: "../schedule/mainScheduleJson.schedule",
				type: "POST",
				data: {
					tid: "choa"
				},
				error: function(xhr,status,error){
					alert(error);
				}
			}
		],
		businessHours:[
			{
				title: 'weekend',
				dow: [1,2,3,4,5],
				constraint: 'businessHours',
				overlap: false,
				dayclick: false
			}
		]
	});
	
});

</script>
</head>
<body>
<section class="row">
	<div class="col-md-1"></div>
	
	<div class="cal_sec col-md-7">
	<div id='calendar'></div>
	<div class="notice_div">공지사항 내용 적기</div>
	</div>
	
	<div id="event_Sec" class="col-md-3">
	<div id="event"></div>
	
	<div id="eventDetail">
	<!-- 일정 불러오기 -->
		<p class="text-info">일정을 확인하고 싶은 날짜를 클릭해주세요.</p> 
	</div>
	
	<div id="eventAdd">
	<!-- 일정등록 -->
	<form id="addForm" action="../schedule/mainScheduleWrite.schedule" method="post">
		<div id="notice"><p>상담 예약을 원하시면 작성해주세요.</p></div>
		
		<input class="start_date form-control" type="date" readonly="readonly" id="startDate" name="start_date">
		
		<div id="timeTable" class="time_table">
		<p style="font-weight: bold;">예약시간</p>
			<span class="tTable">9:00</span> |
			<span class="tTable">11:00</span> |
			<span class="tTable">13:00</span> |
			<span class="tTable">15:00</span> |
			<span class="tTable">17:00</span>
		<input type="hidden" id="startTime" name="start_time">
		</div>
		
		<div class="read_only">
			<input class="form-control read_sec" type="text" readonly="readonly" name="center" value="choa">	<!-- ${dto.center} -->
			<input class="form-control read_sec" type="text" readonly="readonly" value="초아" name="nickname">	<!-- ${dto.nickname} -->
			<input type="hidden" name="tid" value="yoga00002">	<!-- ${dto.id} -->
		</div>
		
		<div id="reserve_form" class="reserve_form">
		<p class="des_sec">예약자 이름</p><input class="form-control input_sec" type="text" name="name">
		<p class="des_sec">휴대폰 번호</p><input class="form-control input_sec" type="tel" name="tel">
		</div>
		
		<div id="btn_wrap"><button id="btn" class="submit_btn fc-next-button fc-button fc-state-default fc-corner-right">예약하기</button></div>
	</form>
	<div id="holidayNotice" style="display: none;"><p>해당일은 트레이너의 휴무일로 예약이 불가능합니다.</p></div>
	</div>
	</div>
	
	<div class="col-md-1"></div>
</section>
</body>
</html>