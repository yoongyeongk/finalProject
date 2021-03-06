<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE htm>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/tradeBoardList.css" rel="stylesheet">

<script type="text/javascript">

$(function() {
	
	if("${pager.kind}" == "Title") {
		$("#kind option:eq(0)").prop("selected", true);
	}else if("${pager.kind}" == "Update"){
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
<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
<!-- header 끝 -->

	<section id="main">
	
	<list>
		<div class="all">
			<div id="move_wrap">
				<a class="pmf_move" href="${pageContext.request.contextPath}/pmf/pmfList">프로젝트 멤버 모집</a>
				<a href="${pageContext.request.contextPath}/trade/tradeBoardList?curPage=1">프로젝트 판매</a>
			</div>

			<div class="list_wrap">
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
				
				<div class="outBox" style="vertical-align: middle; margin-top: 36px; float: right;">
					<a href="./tradeBoardWrite" class="b" id="write">
					<img src="${pageContext.request.contextPath }/resources/images/tradeBoard/ico-btn-write.gif" >
					 글쓰기</a>
					 <a href="./tenderList?curPage=1&writer=${user.username }" class="b" id="tenderList">입찰목록</a>
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
								<th scope="col">최소<em>/현재 경매가</em></th>
								<th scope="col">마감일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="dto" varStatus="l">
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
									<td class="title t"> <div class="loc"><a href="./tradeBoardView?num=${dto.num }&writer=${user.nickname}&curPage=${param.curPage}">${dto.title }</a>
										<div class="line"> 
											
												<c:forEach items="${tags }" var="t" varStatus="i">
													<c:if test="${dto.num eq t.num}">
														<c:choose>
															<c:when test="${pager.search eq t.tag and pager.kind eq 'Tag'}">
																<a href="javascript:void(0)" class="tags scolor" id="i${i.count }">
																	#<span class="tagSet" title="#${t.tag }">${t.tag }</span>
																</a>
														</c:when>
															<c:otherwise>
																<a href="javascript:void(0)" class="tags" id="i${i.count }">
																	#<span class="tagSet" title="#${t.tag }">${t.tag }</span>
																</a>
															</c:otherwise>
														</c:choose>
													</c:if>
												</c:forEach>
											
										</div>
									</div>
									</td>
									
									<td class="ct price">
										<div class="loc">
											<fmt:formatNumber value="${dto.min_price }" type="currency" currencySymbol="￦"/> /
											<div>
												<fmt:formatNumber value="${dto.present_price }" type="currency" currencySymbol="￦"/>
											</div>
										</div>
										
									</td>
									
									<td class="ct date">
										<div class="loc">
											  <div>~</div>
											<fmt:formatDate dateStyle="long"  value="${dto.closing_date}"/>
											<c:forEach items="${date }" var="dt" varStatus="d">
												<c:if test="${d.count eq l.count }">
													<c:choose>
														<c:when test="${dt > 0 }">
															<p>(${dt }일 남음)</p>
														</c:when>
														<c:otherwise>
															<p style="color: orangered;">[마감]</p>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach>
										</div>
									</td>
								</tr>
							</c:forEach>
					
						</tbody>
					</table>
					
				<div class="pager">
					<c:if test="${pager.curBlock gt 1}">
						<span class="list" title="${pager.startNum-1 }">이전</span>
					</c:if>
				
					<c:forEach  begin="${pager.startNum }" end="${pager.lastNum }" var="p">
							<c:choose>
								<c:when test="${param.curPage eq p}">
									<span class="list" id="selected" title="${p }">${p }</span>
								</c:when>
								<c:otherwise>
									<span class="list" title="${p }">${p }</span>
								</c:otherwise>
							</c:choose>
							
					</c:forEach>
					
					<c:if test="${pager.curBlock lt pager.totalBlock }">
						<span class="list" title="${pager.lastNum+1 }">다음</span>
					</c:if>
				</div>
			
				</div>
				</div>
	
			</div>
		</div>
		
	</list>
	</section>
</body>
</html>