<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
<script src='http://momentjs.com/downloads/moment.js'></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@3.6.2/dist/fullcalendar.min.js'></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@3.6.2/dist/fullcalendar.min.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@3.6.2/dist/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script type="text/javascript" src="./locale/ko.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev',
			center: 'title',
			right: 'next'
		},
		defaultDate: new Date(),
		lang: "ko",
		navLinks: false, // can click day/week names to navigate views
		editable: false,
		eventLimit: true, // allow "more" link when too many events
		//데이터 부분 어떻게 넣을지 다시 써보고 Test 해보기	
		eventSources: [
			{
				url: "../workout/workoutJson.workout",
				type: "POST",
				data: {
					mid: "${sessionScope.member.id}"
				},
				error: function(xhr,status,error){
					alert(error);
				}
			}
		],
		
		eventRender: function(event, element){
			var contents = new Array();
			contents = event.content;
			
			//element.append('<div class="content"> '+contents.join("<br>")+'<br>강사명: '+event.nickname+'</p></div>');
			element.find('.fc-title').append('<div class="content"> '+contents+'<br>강사명: '+event.nickname+'</p></div>');
		}
	});
	
});

</script>
<style type="text/css">
	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 12px;
	}

	#calendar {
		max-width: 800px;
		margin: 0 auto;
	}
	.fc-time{
		display: none;
	}
</style>
</head>
<body>
<section class="row">
	<div id='calendar' class="col-sm-10 col-md-10 col-xs-10"></div>
</section>
</body>
</html>