<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>

<style type="text/css">
	view{
		width:100%;
	}
	@FONT-FACE {
		font-family: BMJUA;
		src:url("${pageContext.request.contextPath}/resources/font/BMJUA_ttf.ttf");
	}
	@FONT-FACE{
		font-family: Daum_Regular;
		src:url("${pageContext.request.contextPath}/resources/font/Daum_Regular.ttf");
	}
	@FONT-FACE{
		font-family: NanumSquareB;
		src:url("${pageContext.request.contextPath}/resources/font/NanumSquareB.ttf");
	}
	@FONT-FACE{
		font-family: NanumSquareEB;
		src:url("${pageContext.request.contextPath}/resources/font/NanumSquareEB.ttf");
	}
	@FONT-FACE{
		font-family: NanumSquareR;
		src:url("${pageContext.request.contextPath}/resources/font/NanumSquareR.ttf");
	}
	p{
		margin: 0;
		padding: 0;
	}
	span{
		margin: 0;
		padding: 0;
	}
	ul{
		list-style: none;
		padding: 0;
		margin: 0;
		line-height: 50px;
	}
	.all{
		width:900px;
		height:1100px;
		margin: 0 auto;
		background-color: gold;
	}
	.line{
		width:830px;
		background-color: lightpink;
		margin: 0 auto;
		margin-top: 110px;
	}
	.tag_font{
		font-family: BMJUA;
		font-size: 19px;
		cursor: pointer;
		margin-right: 12px;
	}
	.titleBox{
		margin-top: 50px;
		text-align: center;
	}
	.title{
		line-height:50px;
		font-size: 24px;
		font-family: Daum_Regular;
		border-bottom: 4px solid #cccccc50;
	}
	.contentsLine{
		margin: 0 auto;
		width: 680px;
	}
	.contentsBox{
		margin-top: 100px;
		background-color: #cccccc38;
	}
	.info{
		margin-top: 30px;
	}
	.spanBorder{
		border: 2px solid black;
		display:inline-block;
		line-height: 20px;
		width: 95px;
		text-align: center;
		margin-right: 15px;
	}
</style>

<script type="text/javascript">
	$(function() {
		$(".tags").on("click",".tag_font",function(){
			var search = $(this).prop("title")
			$("#search").val(search)
			$("#kind").val("Title")
			$("#f").submit()
		})
	})
</script>
</head>
<body>
  <view>
	<div class="all">
		<form action="./tradeBoardList?curPage=1&kind=Title" method="get" id="f">
			<input type="hidden" value="" name="search" id="search">
			<input type="hidden" value="" name="kind" id="kind">
		</form>
	 <div class="line">
		<div class="tags">
			<c:forEach items="${one.tags }" var="tag">
				<span class="tag_font" title="#${tag.tag }">#${tag.tag }</span>
			</c:forEach>
		</div>
		
		<div class="titleBox">
			<p class="title">${one.title }</p>
		</div>
		
		<div class="contentsLine">
			<div class="contentsBox">
				<div class="contents">${one.contents }</div>
			</div>
			
			<div class="info">
				<ul>
					<li><span class="spanBorder">기업명</span> ${one.corporation }</li>
					<li><span class="spanBorder">작성 아이디</span> ${one.writer }</li>
					<li><span class="spanBorder">이메일</span> ${one.email }</li>
					<li><span class="spanBorder">연락처</span> ${one.corporate_phone }</li>
				</ul>
			</div>
		</div>
		
		
		<div class="imgBox">
			
		</div>
	 </div>
	</div>
 </view>
</body>
</html>