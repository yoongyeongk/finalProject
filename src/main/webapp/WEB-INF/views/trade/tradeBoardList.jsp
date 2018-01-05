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
<link href="${pageContext.request.contextPath }/resources/css/tradeBoardList.css" rel="stylesheet">

<script type="text/javascript">

$(function() {
	
	if("${pager.kind}" == "Title") {
		$("#kind option:eq(0)").prop("selected", true);
	}else{
		$("#kind option:eq(1)").prop("selected", true);
	}

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
		var search ="";
		var curPage = $(this).prop("title");
		var kind = '${pager.kind}';
		if('${pager.kind}' == 'Tag'){
			search = '#${pager.search}';
		}else{
			search = '${pager.search}';
		}
		$("#kind").val(kind);
		$("#search").val(search);
		$("#curPage").val(curPage);
		
		$("#f").submit();
	});
	
	$(".tags").on("click",function(){
		$("#kind").val(kind);
		$("#search").val($(this).children(".tagSet").prop("title"));
		$("#curPage").val("1");
		$("#f").submit();
	})
	
	if('${pager.kind}' == 'Tag'){
		$("#kind option:eq(0)").prop("selected", true);
		$("#search").val("#${pager.search}")
		}
	
	
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
							<span class="txt">${pager.kind }</span>
							<label for="kind" class="screen_out">검색분류선택</label>
								<select name="kind" id="kind">
									<option>Title</option>
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
									<td class="title t"> <div class="loc"><a href="./tradeBoardView?num=${dto.num }" on>${dto.title }</a>
										<div class="line"> 
											
												<c:forEach items="${tags }" var="t" varStatus="i">
													<c:if test="${dto.num eq t.num}">
														<a href="javascript:void(0)" class="tags" id="i${i.count }">
															#<span class="tagSet" title="#${t.tag }">${t.tag }</span>
														</a>
														<c:if test="${pager.search eq t.tag and pager.kind eq 'Tag'}">
															<script type="text/javascript">
																$("#i${i.count}").css("background-color","salmon")
																$("#i${i.count}").on("mouseover",function(){
																	$(this).css({"color":"salmon","background-color":"white" ,"border-color":"salmon"})
																});
																$("#i${i.count}").on("mouseout",function(){
																	$(this).css({"color":"white","background-color":"salmon"})
																});
															</script>
														</c:if>
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