<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 수정페이지</title>
 <style type="text/css">
#sTimeBox,#lTimeBox{
display:  inline-block;}
.updateform{
margin : 0 auto;
display: inline-block;
}

#sch_title{
width: 100%;
}
.basic_input{
border-style: none;
background-color: #f5f5f6;
padding-left: 10px;
padding: 10px;
margin-bottom: 10px;
}
.updateBtn{
margin-top : 15px;
background-color: #f5f5f6;
color: rgb(22,160,133);
font-weight: bold;
width: 35%;
    border-radius:4px;
    border-style: none;
    height: 35px;
}
.updateBtn:hover{
	background: rgb(22,160,133);
	color: white;
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
#ck-button {
    margin:1.2px;
    background-color:#EFEFEF;
    border-radius:4px;
    border:1px solid #D0D0D0;
    overflow:auto;
    float:left;
}
#ck-button label {
    float:left;
    width:3.6em;
}
#ck-button label span {
margin : 0 auto;
    text-align:center;
    padding:3px 0px;
        font-weight: lighter;
    display:block;
}
#ck-button label input {
    position:absolute;
}
#ck-button input:checked + span {
    font-weight: bold;
   color: white;
}
input[class="ss2"]{
display: none;
}
#partner{
margin-top: 10px;
border-bottom-color: nany;
}
#nick{
margin-bottom: 20px;
}
#partadd{
background-color: rgb(22,160,133);
height: 150%;
	border-radius: 10px;
border-style: none;
color: white;
}
.partner{
border-style :none;
background-color : #e7e7e7;
padding-bottom: 7px;
padding-top: 7px;
}
.delete{
border-style :none;
border-radius: 10px;
color: rgb(210,255,195);
font-size : small;
background-color: gray;
text-align: center;
}
.delete2{
border-style :none;
border-radius: 10px;
color: rgb(210,255,195);
font-size : small;
background-color: gray;
text-align: center;
}
</style>
<script type="text/javascript">	
$(document).ready(function () {
	$(".delete2").click(function() {
		var delete2=$(this).attr("title");
			 $('.updada'+delete2).remove();
			 $(this).remove();	 
	});
	
	 $('#partadd').on('click', function(){
		 var nickname = $('#partner').val();
		 var mynick =$('#mynick').val();
		 var updada =$('.updada').val();
		 var check = true;
		 $('.updada').each(function() {	
				var j = $(this).val();
				if(nickname==j){
					check=false;
					alert('추가된 참석자 입니다.');
				}
			});
		 $('.addnick').each(function() {
			var i=$(this).val();
			if(nickname==i){
				check=false;
				alert('추가된 참석자 입니다.');
			}
		});
		 if(check){
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
                	 //컨트롤러에 넘겨서 닉네임 확인하는 부분 
                	 plusUl.style.display="none";
                	 plusUl.className="addnick";
                	 plusUl.setAttribute("name", "nickname");
                	 plusUl.setAttribute("value", text);
                	 //화면에 나타낼 부분
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
                 }else{
                	 
                	 alert('등록되어있지않은 닉네임입니다.');
                 }
             },
             error:function(){
                 alert("에러입니다");
         }
         });    //end ajax    
		 }
     });    //end on 

 	$("#backBtn").click(function(){
				window.self.close();
		});
	$("#submitBtn").click(function(){
 		
 		$("#frm").submit();
 		
          /*   opener.location.reload();
            window.close(); */
 
}); 
	
	});	
</script> 
</head>
<body>
 <div style="display: inline-block; margin-top: 25px; margin-left: 15px;">
<form action="../schedule/scheduleUpdatePOST" method="post" id="frm">	
 <div class="updateform col-md-12">			
  <input type="hidden" id="host" name="host" value="${view.host}">	
 <input type="hidden" id="num" name="num" value="${view.num}">	
			<input type="hidden" id="schnum" name="schnum" value="${view.schnum}">	
				<input type="hidden" name="username" value="${user.username}">	
		 			<input type="hidden" id="mynick" name="mynick" value="${user.nickname}">
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
							<tr>
								<td class="label2">세부 내용</td></tr>
									<tr>
								<td><textarea rows="8" cols="45"
								required="required" id="sch_contents"
									name="pro_contents">${view.pro_contents}</textarea></td>
							</tr></table>
													


 <table  class="addT">	
 <tr class="part2"><td colspan="3">일정 상세정보</td></tr>
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
 							<tr><td>참석자 추가</td></tr><tr>
							<td class="label2"><input type="text" class="partner" id="partner"
									name="nickinput" placeholder = "참석자 닉네임 입력">
									<input id="partadd" type="button" value="추가">
									
							</td></tr>
							<tr>
							<td>
									<c:forEach items="${nick}" var="nickname" varStatus="i">
									<div class="updada" name="nick_update" style="display: inline-block;">
									<span  class="updada${i.index}">${nickname.nickname}</span>
 									 <input type="hidden" class="updada" value="${nickname.nickname}">
							<%-- 		 <input type="button" class="delete2" title="${i.index}" value="X"/></div>		 --%>	 
									</c:forEach>										
									</td></tr>
									
								<tr><td><div id="nick" style="display: inline-block;"></div></td></tr>
								
							<tr class="colorpart"><td> 일정 색상</td></tr><tr><td>
							<div id="ck-button" style="background-color: rgb(22,160,133)"><label>
						<input type="radio" name="color"class="ss2" checked="checked" value="rgb(22,160,133)">
						<span>green</span></label></div>					
						<div id="ck-button" style="background-color: rgb(255,0,0)"><label>
						<input type="radio" name="color" class="ss2" value="rgb(255,0,0)">
						<span>red</span></label></div>
						<div id="ck-button" style="background-color: rgb(225,225,54)"><label>
						<input type="radio" name="color" class="ss2" value="rgb(225,225,54)">
						<span>yellow</span></label></div>
						<div id="ck-button" style="background-color:rgb(3,0,102)"><label>
						<input type="radio" name="color" class="ss2" value="rgb(3,0,102)">
						<span>blue</span></label></div>
						<div id="ck-button" style="background-color:rgb(130,0,0)"><label>
						<input type="radio" name="color" class="ss2"  value="rgb(130,0,0)">
						<span>brown</span></label></div>
						<div id="ck-button" style="background-color:rgb(0,0,0)"><label>
						<input type="radio" name="color" class="ss2" value="rgb(0,0,0)">
						<span>black</span></label></div>
						</td></tr>
						<tr><td>
						<input type="button" id="submitBtn" class="updateBtn" value="수정하기">
						<input type="button" id="backBtn" class="updateBtn" value="취소하기">
						</td></tr>
						</table>
 	</div> 
</form>
</div> 
</body>
</html>