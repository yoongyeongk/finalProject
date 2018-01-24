<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sly/1.6.1/sly.min.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5750ac980255f71ca29e7a2ade3c637&libraries=services"></script>
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/tradeBoardView.css" rel="stylesheet">
<script type="text/javascript">
var bidding_price = ${tender.bidding_price}
var regNumber = /^[0-9]*$/
var playAlert = '';
	  playAlert = setInterval(function() {
	    var num = ${param.num}
	    var writer = '${user.nickname}'
		  $.ajax({
	    	type:'POST',
	    	url:'price',
	    	data : {
	    		num:num,
	    	} , success : function(data) {
				$("#pr").html('￦'+data.present_price)
			}
	    })
	  }, 2000);
	  
	  
	$(function() {
		if(bidding_price == 0){
			("#bidding_price").val("")
		}else{
			$("#bidding_price").val(bidding_price)
		}
		
		$(".tags").on("click",".tag_font",function(){
			var search = $(this).prop("title")
			$("#search").val(search)
			$("#kind").val("Title")
			$("#f").submit()
		})
	
		$("#bidding_price").on("focusout",function(){
			$(this).val($(this).val().replace(/\,/g,""))
		
			if($(this).val() % 10000 != 0){
				alert("10000 단위만 입력 가능합니다.")
				$(this).val("")
			}
		})
		
		$("#corporate_phone").on("keyup",function(){
			if(!regNumber.test($(this).val())) {
			    $(this).val("")
			}else if (this.value.length > 11){
				$(this).val($(this).val().slice(0,-1))
			}
		})
		
		$(".submit").click(function() {
			var p_price = ${one.present_price };
			var b_price = $("#bidding_price").val()
			
			if(p_price < b_price){
				document.frm.submit()
			}else{
				alert("금액이 경매가보다 작습니다")
			}
		})//click
		
		if('${tender.writer}' == ''){
		}else{
			$(".pack").attr("readonly" , "readonly")
		}
		
		
		
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
					<li><span class="spanBorder">주소</span> ${one.address }, ${one.address_detail }</li>
				</ul>
			</div>
		</div>
		
		<div id="map"></div>
					<c:if test="${one.close eq 0 }">
						<button type="button" class="md" data-toggle="modal" data-target="#myModal">입찰하기</button>
					</c:if>
					<c:if test="${one.close eq 1 }">
						<button type="button" class="b md">마감됐습니다</button>
					</c:if>
					
					<!-- The Modal -->
					<div class="modal fade" id="myModal">
					  <div class="modal-dialog">
					    <div class="modal-content">
					
					      <!-- Modal Header -->
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					      </div>
					
					      <!-- Modal body -->
					      <div class="modal-body">
					        <div class="price">현재 경매가 : <b id="pr">￦${one.present_price }</b></div>
						        <div class="auctionBox">
						        		<form action="./tradeBoardAC" method="post" name="frm">
						        			<input type="hidden" name="writer" value="${user.nickname }">
											<input type="hidden" name="num" value="${param.num }">
								        	<ul class="auctionUL">
								        		<li><span class="auctionSpan">이름 </span> <input type="text" name="name" value="${tender.name }" id="name" class="pack" required="required"></li>
								        		<li><span class="auctionSpan">연락처 </span> <input type="text" name="corporate_phone" value="${tender.corporate_phone }" id="corporate_phone" required="required"></li>
								        		<li><span class="auctionSpan">기업명 </span> <input type="text" name="corporation" value="${tender.corporation }" class="pack"  id="corporation" required="required"></li>
								        		<li><span class="auctionSpan">입찰가 </span> <input type="text" name="bidding_price" id="bidding_price" required="required"></li>
								        	</ul>
									      <div class="position">
									        	<input type="button" class="submit" value="등록">
									      </div>
						        		</form>
						        </div>
					      </div>

					      <!-- Modal footer -->
					      <div class="modal-footer">
					      </div>
					
					    </div>
					  </div>
					</div>
		
	 </div>
	</div>
 </view>
 <script>
 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
 mapOption = {
     center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
     draggable:false,
     level: 3 // 지도의 확대 레벨
 };  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new daum.maps.MapTypeControl();

//지도에 컨트롤을 추가해야 지도위에 표시됩니다
//daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('${one.address} '+'${one.address_detail}', function(result, status) {

 // 정상적으로 검색이 완료됐으면 
  if (status === daum.maps.services.Status.OK) {

     var coords = new daum.maps.LatLng(result[0].y, result[0].x);

     // 결과값으로 받은 위치를 마커로 표시합니다
     var marker = new daum.maps.Marker({
         map: map,
         position: coords
     });

     // 인포윈도우로 장소에 대한 설명을 표시합니다
     var infowindow = new daum.maps.InfoWindow({
         content: '<div style="width:150px;text-align:center;padding:6px 0;">${one.corporation}</div>'
     });
     infowindow.open(map, marker);

     // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
     map.setCenter(coords);
 } 
 
});    
 </script>
		
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