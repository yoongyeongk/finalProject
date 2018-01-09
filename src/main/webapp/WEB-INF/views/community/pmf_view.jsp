<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Naver Map -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ux0BJ4MhrCheRnITqW_y&submodules=geocoder"></script>
<!-- BootStrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- CSS -->
	<link rel="stylesheet" href="../resources/css/pmf/pmf_view_css.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	function copyText(){
		var range = document.createRange();			//range 설정
		var referenceNode = document.getElementById("email");
		range.selectNode(referenceNode);					//selectNode
		window.getSelection().addRange(range);		//getSelection에 범위 추가
			
		document.execCommand('copy');
	}
	
	//list function
	function replyList(num,curPage){
		$.ajax({
			url : "../reply/pmfReplyList",
			type : "POST",
			data: {
				num: num,
				curPage: curPage
			},
			success : function(data) {
				$("#reply_sec").html(data);
			}
		});
	}

	function scrapStatus(){
		var ch;
		$.ajax({
			url: "../scrap/pmfCheck?num=${view.num}",
			type: "GET",
			async: false,
			success: function(data){
				if(data.trim != 0){
					ch = true;
					$("#scrap_btn").addClass("color-change");
				}else{
					ch = false;
				}
			}
		});
		
		return ch;
	}
	
	function scrapAdd(){
		$.ajax({
			url: "../scrap/pmfAdd",
			type: "POST",
			data: {
				scrapNum: '${view.num}'
			},
			success: function(data){
				if(data == 1){
					alert("게시글이 저장되었습니다.");
				}
			}
		});
	}
	
	function scrapRemove(){
		$.ajax({
			url: "../scrap/pmfDelete?num=${view.num}",
			type: "GET",
			success: function(data){
				alert(data);
			}
		});
	}
	
	$(function() {
		//알림창	
		var message = '${message}';
		if(message != ""){
			alert(message);
		}
	
		//수정
		$("#update_btn").click(function(){
			location.href = "./pmfUpdate?num="+${view.num};
		});
		
		//삭제
		$("#delete_btn").click(function(){
			location.href = "./pmfDelete?num="+${view.num};
		});
		
		//clipboard copy
		$(".clipboard_copy").click(function() {
			copyText();
		});

		//scrap
		var scrap = $(".scrap_btn");
		$(scrap).click(function(){
			//스크랩 여부 확인 후 목록에 추가 혹은 목록에서 제거
			var ch = scrapStatus();
			if(ch){
				scrapAdd();
			}else{
				scrapRemove();
			}
		});
		
		//scrap 상태 표시
		scrapStatus();
		
		//댓글
		var num = ${view.num};

		//1. list
		replyList(num,1);

		//2. write
		$(".reply_btn").click(function() {
			var writer = 'writer'; //'${member.nickname}';
			var contents = $(".replyzone").val();

			$.ajax({
				type : "POST",
				url : "../reply/pmfReplyWrite",
				data : {
					num : num,
					writer : writer,
					contents : contents
				},
				success : function(data) {
					alert(data.trim());
					$(".replyzone").val("궁금한 내용을 자유롭게 써 주세요.");
					replyList(num);
				}
			});
		});

		//map

		if ('${view.addr}' != '') {
			var addr = '${view.addr}';
			var addrResult;
			var etc;

			function addressParsing(addr) {
				var addrArray = addr.split(" ");
				for (var i = 0; i < addrArray.length; i++) {
					if (addrArray[i].endsWith("로")) {
						addrResult = addrArray[i];
						if (i != addrArray.length - 1) {
							etc = addrArray[i + 1];
						}
					}
				}
				addrResult = addrResult + " " + etc;
				return addrResult;
			}

			 var map = new naver.maps.Map('map',{
				 w: 800,
				 h: 350
			 });
		      var myaddress = addressParsing(addr);// 도로0명 주소나 지번 주소만 가능 (건물명 불가!!!!)
		      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
		          if (status !== naver.maps.Service.Status.OK) {
		              return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
		          }
		          var result = response.result;
		          // 검색 결과 갯수: result.total
		          // 첫번째 결과 결과 주소: result.items[0].address
		          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
		          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
		          map.setCenter(myaddr); // 검색된 좌표로 지도 이동
		          // 마커 표시=
		          var marker = new naver.maps.Marker({
		            position: myaddr,
		            map: map
		          });
		          // 마커 클릭 이벤트 처리
		          naver.maps.Event.addListener(marker, "click", function(e) {
		            if (infowindow.getMap()) {
		                infowindow.close();
		            } else {
		                infowindow.open(map, marker);
		            }
		          });
		          // 마크 클릭시 인포윈도우 오픈
		          var infowindow = new naver.maps.InfoWindow({
		              content: '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
		          });
		      });
		}
	});
</script>
</head>
<body>
	<h1>pmf board view</h1>
	<!-- header -->
	
	<!-- header 끝 -->
	
	<section id="main">
	
		<!-- 게시판 내용 -->	
		<section id="board_sec">
			<h1 class="title">${view.title}</h1>
			
			<table class="t_project">
				<tr>
					<td class="t_title" colspan="2">프로젝트 정보</td>
				</tr>
				<tr>
				<!-- 대분류 선택 시 소분류 내용 나오도록 만들기 -->
					<td class="t_label label1">프로젝트 분야</td>
					<td class="t_value">${view.major_key} > ${view.sub_key}</td>
				</tr>
				<tr>
					<td class="t_label label1">프로젝트 명</td>
					<td class="t_value">${view.project_name}</td>
				</tr>
				<tr>
					<td class="t_label label1">작업 예상 기간</td>
					<td class="t_value">${view.start_date} ~ ${view.end_date}</td>
				</tr>
				<tr>
					<td class="t_label" colspan="2">프로젝트 내용</td>
				</tr>
				<tr>
					<td class="t_text" colspan="2">
						${view.project_detail}
					</td>
				</tr>
				<c:if test="${not empty view.fileDTO}">
				<tr>
					<td class="t_label" colspan="2">첨부 파일</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="file_view">
							<c:forEach items="${view.fileDTO}" var="file">
							<a href="../../resources/pmf_file/${file.filename}">${file.oriname}</a>
							</c:forEach>
						</div>
					</td>
				</tr>
				</c:if>
				
				<tr>
					<td class="t_label" colspan="2">담당업무</td>
				</tr>
				<tr>
					<td class="t_text" colspan="2">
						${view.works}
					</td>
				</tr>	
			</table>
					
			<table class="t_workCondition">
				<tr>
					<td class="t_title" colspan="2">근무 조건</td>
				</tr>
				<tr>
					<td class="t_label label1">근무유형</td>
					<td class="t_value">${view.work_kind}</td>
				</tr>
				
				<c:if test="${view.education_level ne ''}">
				<tr>
					<td class="t_label label1">학력</td>
					<td class="t_value">${view.education_level}</td>
				</tr>
				</c:if>
				
				<c:if test="${view.career ne ''}">
				<tr>
					<td class="t_label label1">경력</td>
					<td class="t_value">${view.career}</td>
				</tr>
				</c:if>
				
				<tr>
					<td class="t_label label1">급여</td>
					<td class="t_value">
						<c:if test="${view.payment_kind ne '협의'}">
							${view.payment_kind} ${view.payment_value} 원
						</c:if>
						<c:if test="${view.payment_kind eq '협의'}">
							협의 후 결정
						</c:if>
					</td>
				</tr>
			</table>
			
			<c:if test="${not empty view.firm_info || not empty view.addr || not empty view.addr_detail}">
			<table class="t_firmInfo">
				<tr>
					<!-- 필요 시 추가 -->
					<td class="t_title" colspan="2">회사/단체 정보</td>
				</tr>
				<c:if test="${not empty view.firm_info}">
					<tr>
						<td class="t_label" colspan="2">상세 정보</td>
					</tr>
					<tr>
						<td class="t_text" colspan="2">
							${view.firm_info}
						</td>
					</tr>
				</c:if>
				
				<c:if test="${not empty view.addr}">
					<tr>
						<!-- 주소 찾기 -->
						<td class="t_label label1" rowspan="2">지역 정보</td>
						<td class="t_value">${view.addr} ${view.addr_detail}</td>
					</tr>
					<tr>
						<td>
							<div id="map" style="width: 670px; height: 350px;"></div>
						</td>
					</tr>
				</c:if>
			</table>
			</c:if>
				
			<table class="t_contactInfo">
				<tr>
					<td class="t_title" colspan="2">담당자 정보</td>
				</tr>
				<tr>
					<td class="t_label label1">담당자 id</td>
					<td class="t_value">
						<!-- 아이디 선택 시 메시지 보내기 / 주소록에 저장 -->
						<a href="#">${view.admin_id}</a>
					</td>	
				</tr>
				<tr>
					<td class="t_label label1">담당자 email</td>
					<td class="t_value">
						<span id="email">${view.admin_email}</span>
						<input type="button" class="clipboard_copy" value="클립보드 복사">
					</td>
				</tr>
				<tr>
					<td class="t_label label1">담당자 휴대번호</td>
					<td class="t_value">${view.admin_phone}</td>
				</tr>
			</table>	
			
			<table class="duration_sec">
				<tr>
					<td class="t_label label1">모집 기간</td>
					<td class="t_value">
						<c:if test="${view.duration_kind eq '상시 모집'}">
							${view.duration_kind}
						</c:if>
						<c:if test="${view.duration_kind ne '상시 모집'}">
							${view.duration_end}
						</c:if>
					</td>
				</tr>
			</table>
			
			<c:if test="${not empty view.document}">
			<table class="document_sec">
				<tr>
					<td class="t_title" colspan="2">제출 서류</td>
				</tr>
				<tr>
					<td colspan="2">
						${view.document}
					</td>
				</tr>
			</table>
			</c:if>
			
			<!-- 조건 걸기: 아이디와 글쓴이가 같을 때만 보이도록 -->
				<input class="delete_btn" type="button" value="삭제" id="delete_btn">
				<input class="update_btn" type="button" value="수정" id="update_btn">
		
			<!-- 담기버튼 하트나 별 모양으로 바꾸기 -->
			<button class="scrap_btn" id="scrap_btn"><span class="star glyphicon glyphicon-star"></span> 담기</button>
		
			<hr class="line">
		</section>
		<!-- 게시판 내용 끝 -->
		<span id="test"></span>
		
		<section id="reply">
			<div class="new_reply">
				<textarea class="replyzone form-control" draggable="false">궁금한 내용을 자유롭게 써 주세요.</textarea>
				<input type="button" class="reply_btn" value="댓글 등록">
			</div>
			<div class="reply_list">
			<table class="t_reply">
				<tr>
					<td class="td_r t_1">작성자</td>
					<td class="td_r t_2">내용</td>
					<td class="td_r t_3">작성 시간</td>
					<td class="td_r t_4"></td>
				</tr>
			</table>
			<div id="reply_sec"></div>
			<div id="reply_add" class="reply_add">더보기</div>
			</div>
		</section>
		
	</section>
	
	<!-- footer -->
	<!-- footer 끝 -->
</body>
</html>