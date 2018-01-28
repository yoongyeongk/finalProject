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
				$("#reply_sec").append(data);
			}
		});
	}

	//scrap
	var snum = 0;
	function scrapStatus(){
		var ch;
		$.ajax({
			url: "../scrap/pmfCheck?num=${view.num}",
			type: "GET",
			async: false,
			success: function(data){
				if(data.trim() != 0){
					ch = true;
					snum = data.trim();
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
					$("#scrap_btn").addClass("color-change");
				}
			}
		});
	}
	
	function scrapRemove(){
		$.ajax({
			url: "../scrap/pmfDelete?snum="+snum,
			type: "GET",
			success: function(data){
				alert(data.trim());
				$("#scrap_btn").removeClass("color-change");
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
			location.href = "./pmfUpdate?num=${view.num}";
		});
		
		//삭제
		$("#delete_btn").click(function(){
			location.href = "./pmfDelete?num=${view.num}";
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
			if(!ch){
				scrapAdd();
			}else{
				scrapRemove();
			}
		});
		
		//scrap 상태 표시
		$(window).on("load", function(){
			if(scrapStatus()){
				$("#scrap_btn").addClass("color-change");
			}			
		});
		
		//댓글
		var num = '${view.num}'*1;

		//1. list
		replyList(num,1);

		//2. write
		$(".reply_btn").click(function() {
			var writer = '${user.username}';
			var nickname = '${user.nickname}';
			var contents = $(".replyzone").val();

			$.ajax({
				type : "POST",
				url : "../reply/pmfReplyWrite",
				data : {
					num : num,
					writer : writer,
					nickname : nickname,
					contents : contents
				},
				success : function(data) {
					alert(data.trim());
					$(".replyzone").val("궁금한 내용을 자유롭게 써 주세요.");
					replyList(num);
				}
			});
		});

		//3. paging
		var curPage = $(".reply_add").attr("title")*1;
		$(".reply_add").click(function() {
			curPage = curPage + 1*1;
			$.ajax({
				url: "../reply/pmfReplyList",
				type: "POST",
				data: {
					num: num,
					curPage: curPage
				},
				success: function(data){
					$("#reply_sec").append(data);
					$(".reply_add").attr("title",curPage);
					
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