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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sly/1.6.1/sly.min.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5750ac980255f71ca29e7a2ade3c637&libraries=services"></script>

<title>Insert title here</title>

<style type="text/css">
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
	@FONT-FACE{
		font-family: NanumGothic;
		src:url("${pageContext.request.contextPath}/resources/font/NanumGothic.ttf");
	}
	view{
		width:100%;
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
		border-bottom: 1px solid;
		border-top: 1px solid;
		font-weight: lighter;
	}
	.all{
		width:900px;
		height:2600px;
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
	}
	.title{
		text-align: center;
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
		margin-top: 130px;
	}
	.info{
		margin-top: 30px;
	}
	.spanBorder{
		color: teal;
		border: 1px solid mediumseagreen;
		display:inline-block;
		line-height: 20px;
		width: 95px;
		text-align: center;
		margin-right: 15px;
	}
     .frame {
     	width: 100%;
        height: 150px;
        line-height: 150px;
        overflow: hidden;
    }
    .frame ul {
        list-style: none;
        margin: 0;
        padding: 0;
        height: 100%;
        font-size: 50px;
        margin: 0 auto;
        }
     .frame ul li {
        float: left;
        width: 170px;
        height: 100%;
        margin: 0 1px 0 0;
        padding: 0;
        background: #333;
        color: #ddd;
        text-align: center;
        cursor: pointer;
        }
      .imgs{
       	width: 170px;
        height: 150px;
        }
    .scrollbar { 
    	width: 100%; 
    	height: 10px; 
    	background-color: grey;
    	margin: 13px 0 13px 0;
    	}
	.scrollbar .handle {
		width: 100px; /* overriden if dynamicHandle: 1 */
		height: 100%;
		background: #222;
		}
	.sampleView{
		width:750px;
    	margin: 0 auto;
    	margin-top: 100px;
    	margin-bottom: 30px;
	}
	.view{
		width: 750px;
    	height: 700px;
	}
	.info ul>li{
		font-family: Daum_Regular;
	}
	.sly{
		width: 750px;
		margin: 0 auto;
	}
	.gui{
		font-family: BMJUA;
		font-size: 19px;
	}
	#map{
		margin: 0 auto;
		margin-top: 30px;
		width: 680px;
		height: 450px;
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
		
		<div class="titleBox">
			<p class="title">${one.title }</p>
		</div>
		
		<div class="sly">
			<div class="sampleView">
				<p class="gui">Sample Images</p>
				<img class="view" src="">
			</div>
			
			<div class="scrollbar">
				<div class="handle"></div>
			</div>
		
			<div class="frame" id="forceCentered">
	    		<ul class="slidee">
	    		</ul>
			</div>
		</div>
		
		<div class="contentsLine">
			<div class="contentsBox">
				<div class="contents"><p class="title">상세 내용</p>
					<div style="height: 85px;"></div>
				${one.contents }</div>
			</div>
					<div class="tags">
			<c:forEach items="${one.tags }" var="tag">
				<span class="tag_font" title="#${tag.tag }">#${tag.tag }</span>
			</c:forEach>
		</div>
			<div class="info">
				<ul>
					<li><span class="spanBorder">기업명</span> ${one.corporation }</li>
					<li><span class="spanBorder">작성 아이디</span> ${one.writer }</li>
					<li><span class="spanBorder">이메일</span> ${one.email }</li>
					<li><span class="spanBorder">연락처</span> ${one.corporate_phone }</li>
					<li><span class="spanBorder">주소</span> ${one.address } ${one.address_detail }</li>
				</ul>
			</div>
		</div>
		
		<div id="map">
		
		</div>
		
		<script>
	 var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	 var options = { //지도를 생성할 때 필요한 기본 옵션
	 	center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	 	level: 3 //지도의 레벨(확대, 축소 정도)
	 };
	
	 var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
 </script>
		
	 </div>
	</div>
 </view>
 <script>
 var sly = new Sly($('.frame'), {
     horizontal: 1, // required
     itemNav: 'forceCentered', // required
     activateMiddle:1,
     activateOn: 'click',
     smart: 1,
     mouseDragging: 1,
     touchDragging: 1,
     releaseSwing: 1,
     scrollBy: 1,
     speed: 300,
     elasticBounds: 1,
     dragHandle: 1,
     dynamicHandle: 1,
     clickBar: 1,
     scrollBar: $(".scrollbar"),
     activatePageOn: 'click',
     activeClass:'active'
 }, null).init();
 var num = ${one.num}
 var c = 0;
  $.ajax({
	 type:"POST",
	 url:"../tradeBoardFile/fileSelect",
	 data : {
		 num:num
	 } , success : function(data) {
			$(data).each(function() {
				$('.slidee').append('<li class="item"><img id="img'+(c++)+'" class="imgs" src="${pageContext.request.contextPath}/resources/upload/'+this.fileName+'"></li>'); 
				sly.reload();
				}) 
	 }
  })
  sly.on('active', function(eventName, activatedItemIndex){
   var src = $("#img"+activatedItemIndex).attr("src");
   $(".view").attr("src", src);
})

 </script>
</body>
</html>