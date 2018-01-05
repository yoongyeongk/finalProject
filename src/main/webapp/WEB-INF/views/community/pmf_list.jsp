<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		var message = '${message}';
		if(message != ""){
			alert(message);
		}
	});
	
	function openList(evt, cityName) {
	    var i, tabcontent, tablinks;
	    tabcontent = document.getElementsByClassName("tabcontent");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }
	    tablinks = document.getElementsByClassName("tablinks");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	    }
	    document.getElementById(cityName).style.display = "block";
	    evt.currentTarget.className += " active";
	}
</script>
<style type="text/css">
body{
	font-family: HanSans;
	opacity: 0.9;
}
.list_wrap{
	margin: 0 auto;
	margin-top: 50px;
	width: 1000px;
}
.new{
	width: 80px;
	height: 30px;
	float: right;
	text-align: center;
	line-height: 27px;
	font-size: 12px;
	font-weight: 600;
	color: white;
	margin-bottom: 20px;
	background-color: rgb(22, 160, 133);
    border: solid 1px rgb(22, 160, 133);
    border-radius: 4px;
}
a:hover{
	text-decoration: none;
	color: white;
}
/* Style the tab */
.tab {
    overflow: hidden;
}

/* Style the buttons inside the tab */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    width: 100px;
    padding: 10px;
    transition: 0.3s;
    font-size: 15px;
    letter-spacing: -1px;
    font-weight: 600;
    border: 1px solid #cccccc38;
    border-bottom: none;
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
    margin-right: 1px;
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #cccccc38;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #cccccc38;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
}

#content_wrap{
    width: 100%;
    height: 600px;
    background-color: #cccccc38;
}

/* pmf list div */
#search_bar{
	text-align: center;
    margin-top: 30px;
    margin-bottom: 30px;
}
#search_bar select{
	width: 100px;
    height: 30px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 14px;
}
.search{
	width: 300px;
    height: 30px;
    border-radius: 3px;
    border: solid 1px #ccc;
}
.search_btn{
	width: 60px;
    height: 27px;
    text-align: center;
    line-height: 13px;
    border-radius: 3px;
    background-color: rgb(22, 160, 133);
    border: solid 1px rgb(22, 160, 133);
    color: white;
}
}
#listCall{
	padding-top: 30px;
}

.t_list{
	border: solid 1px #ccc;
	border-left: none;
	border-right: none;
	width: 950px;
	margin: 0 auto;
	border-collapse: collapse;
	letter-spacing: -1px;
}
.t_list th,.t_list td{
	border: solid 1px #ccc;
	border-left: none;
	border-right: none;
	text-align: center; 
	vertical-align: middle;
}
.t_list td{
	height: 35px;
}
.t_list th{
	height: 40px;
	background-color: white;
}
.td_1{
	width: 50px;
}
.td_2{
	width: 120px;
}
.td_3{
	width: 350px;
}
.td_4{
	width: 120px;
}
.td_5{
	width: 120px;
}
.td_6{
	width: 70px;
}
.td_7{
	width: 90px;
}
.td_8{
	width: 60px;
}
.t_font{
	font-size: 12px;
}
/* myMenu div */
#btn_wrap{
	text-align: right;
    padding-right: 15px;
    margin-bottom: 10px;
}
.compare_btn{
	width: 100px;
    height: 40px;
    border-radius: 3px;
    background-color: rgb(94, 94, 94);
    border: 1px solid rgb(94, 94, 94);
    color: white;
    font-weight: 600;
}
.wrap_total{
	width: 300px;
    background-color: rgba(26, 188, 156, 0.39);
    border-radius: 3px;
    height: 120px;
    margin: 20px 12px;
    float: left;
}
.wrap_1{
	width: 80px;
    height: 100%;
    display: inline-block;
    padding: 10px 5px 10px 10px;
    float: left;
}
.image{
	background-color: white;
    width: 60px;
    height: 60px;
    margin-top: 15px;
    margin-bottom: 5px;
}
.d-day{
    text-align: left;
    font-size: 11px;
}
.wrap_2{
	width: 220px;
    height: 100%;
    display: inline-block;
    float: right;
    padding-left: 15px;	
}
.project_title{
	font-size: 15px;
    font-weight: 600;
    margin-top: 8px;
    margin-bottom: 18px;
    text-align: center;
}
.works_list ul{
	-webkit-padding-start: 25px;
    -webkit-margin-before: -10px;
    -webkit-margin-after: 5px;
}
.works_list li{
	margin-bottom: 5px;
}
.tag_list{
	font-size: 13px;
}

/* 페이징 */
.paging{
	text-decoration: none;
    width: 327px;
    margin: 0 auto;
}
.paging_move{
	width: 45px;
}
.paging li{
	list-style: none;
    float: left;
    padding: 4px;
    width: 35px;
    margin: 30px 3px;
    height: 30px;
    border-radius: 5px;
    background-color: rgb(244, 244, 244);
    text-align: center;
    font-size: 13px;
}

.paging li a{
	color: black;
}

</style>
</head>
<body>
<!-- header -->
<!-- header 끝 -->

	<section id="main">
		<div class="list_wrap">
			<a href="./pmfWrite" class="new">새 글 등록</a>

			<div class="tab">
				<button class="tablinks active"
					onclick="openList(event, 'pmfList')">멤버 모집</button>
				<button class="tablinks" onclick="openList(event, 'myMenu')">마이
					메뉴</button>
			</div>

			<div id="content_wrap">
				<div id="pmfList" class="tabcontent">
					<p>검색 / 담기 버튼 / 페이징</p>
					<div id="pmfList_sec">
						<div id="search_bar">
							<select name="kind">
								<option>전체</option>
								<!-- tags, title, major_key, sub_key, works... -->
								<option>제목</option>
								<!-- title -->
								<option>프로젝트 분야</option>
								<!-- major_key -->
							</select> <input type="text" class="search" name="search"> <input
								type="button" class="search_btn" value="검색">
						</div>
						<div id="listCall">
							<!-- 확인용 - 레이아웃 확인 후 listTable로 옮기기 -->
								<table class="t_list">
									<tr>
										<th class="td_1"><input type="checkbox" id="total_ch" class="save_ch"></th>
										<th class="td_2">프로젝트 명</th>
										<th class="td_3">제목</th>
										<th class="td_4">지원요건</th>
										<th class="td_5">프로젝트 분야</th>
										<th class="td_6">마감일</th>
										<th class="td_7">진행 수준</th>
										<th class="td_8">조회수</th>
									</tr>
									<c:forEach items="${list}" var="dto">
									<tr>
										<td><input type="checkbox" class="save_ch"></td>
										<td>${dto.project_name}</td>
										<td><a href="./pmfView?num=${dto.num}">${dto.title}</a></td>
										<td>${dto.work_kind}</td>
										<td class="t_font">
											<c:forTokens items="${dto.major_key}" delims="/" var="key">
											${key}
											</c:forTokens>
											<br>
											<c:forTokens items="${dto.sub_key}" delims="/" var="key">
											${key}
											</c:forTokens>
											</td>
										<td class="t_font">~ ${dto.end_date}</td>
										<td>진행 수준</td>
										<td>${dto.hit}</td>
									</tr>
									</c:forEach>
								</table>
							<!-- 여기까지 -->
								<ul class="paging">
								<li class="paging_move"><a href="#"><</a></li>
								<c:forEach begin="1" end="5" var="i">
									<li class="paging_one"><a href="#">${i}</a></li>
								</c:forEach>
								<li class="paging_move"><a href="#">></a></li>
								</ul>
						</div>
					</div>
				</div>

				<div id="myMenu" class="tabcontent">
					<p>무한 스크롤</p>
					<div id="myMenu_sec">
						<div id="btn_wrap">
							<input type="button" class="compare_btn" value="비교하기">
						</div>
						<div id="saveCall">
						
							<!-- 확인용 - 레이아웃 확인 후 listBox로 옮기기 -->
							<div class="wrap_total">
								<div class="wrap_1">
									<div class="image">이미지</div>
									<p class="d-day">D-O</p>
								</div>
								<div class="wrap_2">
									<p class="project_title">project name</p>
									<div class="works_list">
										<ul>
											<li>list1</li>
											<li>list2</li>
										</ul>
									</div>
									<div class="tags_list">
										<%-- <c:forEach items="" var="tag"> --%>
										<a href="#">#tag1</a> <a href="#">#tag2</a>
										<%-- </c:forEach>  --%>
									</div>
								</div>
							</div>
							
							<div class="wrap_total">
								<div class="wrap_1">
									<div class="image">이미지</div>
									<p class="d-day">D-O</p>
								</div>
								<div class="wrap_2">
									<p class="project_title">project name</p>
									<div class="works_list">
										<ul>
											<li>list1</li>
											<li>list2</li>
										</ul>
									</div>
									<div class="tags_list">
										<%-- <c:forEach items="" var="tag"> --%>
										<a href="#">#tag1</a> <a href="#">#tag2</a>
										<%-- </c:forEach>  --%>
									</div>
								</div>
							</div>
							
							<div class="wrap_total">
								<div class="wrap_1">
									<div class="image">이미지</div>
									<p class="d-day">D-O</p>
								</div>
								<div class="wrap_2">
									<p class="project_title">project name</p>
									<div class="works_list">
										<ul>
											<li>list1</li>
											<li>list2</li>
										</ul>
									</div>
									<div class="tags_list">
										<%-- <c:forEach items="" var="tag"> --%>
										<a href="#">#tag1</a> <a href="#">#tag2</a>
										<%-- </c:forEach>  --%>
									</div>
								</div>
							</div>
							<!-- 여기까지 -->
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>