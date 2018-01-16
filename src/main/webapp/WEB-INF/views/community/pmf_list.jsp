<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/pmf/pmf_list_css.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		var message = '${message}';
		if(message != ""){
			alert(message);
		}
		
		var curPage = 1;
		var kind = $("#kind").val();
		var search = "";
		callList(curPage,kind,search);
		callScrap();
		
		//검색
		$(".search_btn").click(function(){
			search = $("#search").val();
			callList(curPage,kind,search);
		});
		
		//페이징
		$(".paging_one").click(function(){
			curPage = $(this).html();
			search = $("#search").val();
			callList(curPage,kind,search);
		});
	});
	
	//functions
	//tab function 수정하기 - '내 글 보기' 탭 추가
	function openList(evt, menuName) {
	    var i, tabcontent, tablinks;
	    tabcontent = document.getElementsByClassName("tabcontent");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }
	    tablinks = document.getElementsByClassName("tablinks");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	    }
	    document.getElementById(menuName).style.display = "block";
	    evt.currentTarget.className += " active";
	}
	
	function callList(curPage,kind,search){	
		$.ajax({
			type: "POST",
			url: "./pmfList",
			data: {
				kind: kind,
				search: search,
				curPage: curPage
			},
			success: function(data){
				$("#listCall").html(data);
			}
		});
	}
	
	function callScrap(){
		$.ajax({
			type: "POST",
			url: "../scrap/pmfList",
			data: {
				nickname: "nickname"
			},
			success: function(data){
				$("#scrapCall").html(data);
			}
		});
	}
</script>
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
				<button class="tablinks" onclick="openList(event, 'myMenu')">마이 메뉴</button>
			</div>

			<div id="content_wrap">
				<div id="pmfList" class="tabcontent">
					<p>검색  / 페이징</p>
					<div id="pmfList_sec">
						<div id="search_bar">
							<select id="kind" name="kind">
								<option>전체</option>
								<!-- tags, title, major_key, sub_key, works... -->
								<option>제목</option>
								<!-- title -->
								<option>프로젝트 분야</option>
								<!-- major_key -->
							</select> 
							<input type="text" id="search" class="search"> 
							<input type="button" class="search_btn" value="검색">
						</div>
						
						<div id="listCall"></div>
						
						<ul class="paging">
							<li class="paging_move"><</li>
							<c:forEach begin="1" end="5" var="i">
								<li class="paging_one">${i}</li>
							</c:forEach>
							<li class="paging_move">></li>
						</ul>
					</div>
				</div>

				<div id="myMenu" class="tabcontent">
					<p>무한 스크롤</p>
					<div id="myMenu_sec">
						<div id="btn_wrap">
							<input type="button" class="compare_btn" value="비교하기">
						</div>
						<div id="scrapCall"></div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>