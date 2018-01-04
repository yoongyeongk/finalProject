<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>

<style type="text/css">
	body{
		width: 100%;
		height: 100%;
	}
	.all{
		width: 1200px;
		height: 1500px;
		margin: 0 auto;
	}
	.box{
		width: 1100px;
		height: auto;
		margin: 0 auto;
	}
	#listBox{
		margin-top: 30px;
	}
	#tb{
		width: 950px;
		table-layout: fixed;
		border-left: none;
		border-right: none;
	}
	tr{
		border-bottom:1px solid #e1e1e1;
	}
	th{
		font-weight: normal;
	}
	#top>th{
		text-align: center;
    	height: 37px;
    	background: #fafafa;
    	border:0;
    	border-bottom: 1px solid #ddd;
    	border-top: 1px solid #ddd;
    	font-family: "Malgun Gothic", "Arial", sans-serif !important;
    	font-size: 13px;
    	color: #888;
	}
	.cell>th,td{
		height: 110px;
		overflow: hidden;
   		text-overflow: ellipsis;
    	white-space: nowrap;
    	vertical-align: top;
    	
	}
	.co{
		font-size: 14px;
		text-align: center;
	}
	.corporation{
		width: 191px;
	}
	.loc>a{
		font-size: 16px;
		text-decoration: none;
		color: black;
	}
	.loc>a:hover{
		color: black;
	}
	.t{
		padding-left: 12px;
	}
	.ct{
		text-align: center;
	}
	.price{
		font-size: 12px;
    	line-height: 20px;
    	font-family: "Malgun Gothic", "Arial", sans-serif;
    	color: #666;
	}
	.date{
		padding: 0;
    	font-size: 12px;
   		letter-spacing: -.03em;
    	color: #888;
	}
	.tags{
		border: none;
		border-radius:10px;
		background : darkturquoise;
		margin-right: 8px;
		padding: 0px 3px 0px 3px;
		text-decoration: none;
		display: inline-block;
    	margin-top: 5px;
	}
	.tags:hover{
		border: 1px solid darkturquoise;
		background: none;
		text-decoration: none;
	}
	.tags:hover >span{
		color:darkturquoise;
	}
	.tagSet{
		font-family: "Malgun Gothic", "Arial", sans-serif;
		font-size:13px;
		color: white;
		margin-left: 1px;
		margin-bottom: 5px;
	}
	.line{
		margin-top: 15px;
		white-space: normal;
	}
	.loc{
		padding: 27px 0px 25px 0px;
	}
	.outBox{
		width: 500px;
	}
	.searchBox {
		position:relative;
		display:inline-block;
		width:150px;
		height:40px;
		background:url('${pageContext.request.contextPath}/resources/images/tradeBoard/ico_select_arrow.png') right center no-repeat;
		background-color:#fff;
		margin-top: 100px;
		top:1px;
	}
	.searchBox .txt {
		display:block;
		width:150px;
		height:40px;
		padding-left:10px;
		line-height:40px;
		border:1px solid #ccc;
		text-align:left;
	}
	.searchBox label {
		overflow:hidden;
		position:absolute;
		width:0;
		height:0;
		line-height:0;
		text-indent:-9999px;
	}
	.searchBox select {
		appearance:none;
		-webkit-appearance:none;
		-moz-appearance:none;
		-o-appearance:none;
		position:absolute; left:0; top:0;
		display:block;
		width:150px;
		padding-left:10px;
		height:40px;
		opacity:0;
		filter: alpha(opacity=0);
		z-index:10;
	}
	 
	.searchBox.focus {
		border: 1px solid #66afe9;
		-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6); 
		box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6); /* focus효과*/
	}
	#search{
		width: 300px;
		height: 38px;
		padding-right: 43px;
		padding-left: 12px;
	}
	.searchInput{
		display: inline-block;
		width: 310px;
		height: 50px;
		margin: 0 auto;
	}
	#s{
		display: none;
	}
	.s_img{
		position: relative;
		top:-2;
		right: 50;
	}
	.pager{
		margin: 0 auto;
		background-color: red;
	}
	.list{
		cursor: pointer;
		display: inline-block;
		border: 1px solid black;
	}
	.outBox{
		width: 500px;
	}
	.searchBox {
		position:relative;
		display:inline-block;
		width:150px;
		height:40px;
		background:url('${pageContext.request.contextPath}/resources/images/tradeBoard/ico_select_arrow.png') right center no-repeat;
		background-color:#fff;
		margin-top: 100px;
		top:1px;
	}
	.searchBox .txt {
		display:block;
		width:150px;
		height:40px;
		padding-left:10px;
		line-height:40px;
		border:1px solid #ccc;
		text-align:left;
	}
	.searchBox label {
		overflow:hidden;
		position:absolute;
		width:0;
		height:0;
		line-height:0;
		text-indent:-9999px;
	}
	.searchBox select {
		appearance:none;
		-webkit-appearance:none;
		-moz-appearance:none;
		-o-appearance:none;
		position:absolute; left:0; top:0;
		display:block;
		width:150px;
		padding-left:10px;
		height:40px;
		opacity:0;
		filter: alpha(opacity=0);
		z-index:10;
	}
	 
	.searchBox.focus {
		border: 1px solid #66afe9;
		-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6); 
		box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6); /* focus효과*/
	}
	#search{
		width: 300px;
		height: 38px;
		padding-right: 43px;
	}
	.searchInput{
		display: inline-block;
		width: 310px;
		height: 50px;
		margin: 0 auto;
	}
	#s{
		display: none;
	}
	.s_img{
		position: relative;
		top:-2;
		right: 50;
	}
</style>

<script type="text/javascript">
$(function() {
	

	 $(".searchBox select").change(function () {
		var changeTxt = $(this).find("option:selected").text();
		$(this).parent().find(".txt").text(changeTxt);
	 });
	$(".searchBox select").focus(function () {
		$(this).parent().addClass("focus");
	});
	$(".searchBox select").blur(function () {
		$(this).parent().removeClass("focus");
	});


	$(".list").click(function(){
		var curPage = $(this).prop("title");
		var kind = '${pager.kind}';
		var search = '${pager.search}';
		
		$("#kind").val(kind);
		$("#search").val(search);
		$("#curPage").val(curPage);
		
		$("#f").submit();
	});
});
</script>
</head>
<body>
	<list>
		<div class="all">

			<div class="box">
				<div class="outBox">
					<form action="tradeBoardList" method="get" id="f">
						<input type="hidden" value="1" name="curPage"  id="curPage">
						<div class="searchBox">
							<span class="txt">Title</span>
							<label for="kind" class="screen_out">검색분류선택</label>
								<select name="kind" id="kind">
									<option selected="selected">Title</option>
									<option>Corporation</option>
								</select>
						</div>
							<div class="searchInput">
								<input type="text" name="search" id="search" value="${pager.search }">
							</div>
							<span class="s_img">
									<label for="s">
										<img src="${pageContext.request.contextPath }/resources/images/tradeBoard/search.jpg"
										style="width: 30px; height: 27px;">
										<button id="s">검색</button>
									</label>
								</span>
					</form>
				</div>
			</div>
				
			<div class="box">
				<div id="listBox">
					<table id="tb">
						<colgroup>
							<col width="20%">
							<col width="50%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<thead>
							<tr id="top">
								<th scope="col">기업명</th>
								<th scope="col">프로젝트 제목</th>
								<th scope="col">현재 경매가</th>
								<th scope="col">마감일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="dto">
								<tr class="cell">
									<th scope="row" class="co">
										<div class="loc">
											<div class="corporation">
												<span>
													${dto.corporation }
												</span>
											</div>
										</div>
									</th>
									<td class="title t"> <div class="loc"><a href="./tradeBoardView?num=${dto.num }">${dto.title }</a>
										<div class="line"> 
											
												<c:forEach items="${tags }" var="t">
													<c:if test="${dto.num eq t.num}">
														<a href="#" class="tags">
															<span class="tagSet">${t.tag }</span>
														</a>
													</c:if>
												</c:forEach>
											
										</div>
									</div>
									</td>
									
									<td class="ct price">
										<div class="loc">
											<fmt:formatNumber value="1000" type="currency" currencySymbol="￦"/>
										</div>
									</td>
									
									<td class="ct date">
										<div class="loc">
											  <div>~</div>
											<fmt:formatDate dateStyle="long"  value="${dto.closing_date }"/>
										</div>
									</td>
								</tr>
							</c:forEach>
					
						</tbody>
					</table>
				</div>
			</div>
			
				<div class="pager">
					<c:if test="${pager.curBlock gt 1}">
						<span class="list" title="${pager.startNum-1 }">이전</span>
					</c:if>
				
					<c:forEach  begin="${pager.startNum }" end="${pager.lastNum }" var="p">
							<span class="list" title="${p }">${p }</span>
					</c:forEach>
					
					<c:if test="${pager.curBlock lt pager.totalBlock }">
						<span class="list" title="${pager.lastNum+1 }">다음</span>
					</c:if>
				</div>
		</div>
		
	</list>
</body>
</html>