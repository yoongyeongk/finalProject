<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/pmf/pmf_list_css.css">
<link rel="stylesheet" href="../resources/css/header.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hi!Project - community</title>
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
		$(".paging_one").removeCss("currentPage");
		$(this).addCss("currentPage");
	});
});

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

</script>
</head>
<body>
<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
<!-- header 끝 -->

	<section id="main">
	
		<div class="list_wrap">
			<div id="move_wrap">
				<a class="pmf_move" href="${pageContext.request.contextPath}/pmf/pmfList">프로젝트 멤버 모집</a>
				<a href="${pageContext.request.contextPath}/trade/tradeBoardList?curPage=1">프로젝트 판매</a>
			</div>
			
			<a href="./pmfWrite" class="new">새 글 등록</a>

			<div id="pmfList_sec">
				<div id="search_bar">
					<select id="kind" name="kind">
						<option>전체</option>
						<option>제목</option>
						<option>프로젝트 분야</option>
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
	</section>

</body>
</html>