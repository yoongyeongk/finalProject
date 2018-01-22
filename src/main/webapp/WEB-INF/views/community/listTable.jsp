<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(function(){
		//전체선택, 해제
		var totalCh = $("#total_ch");
		$(totalCh).click(function(){
			if($(totalCh).prop("checked")){
				$(".ch_one").prop("checked",true);
			}else{
				$(".ch_one").prop("checked",false);
			}
		});
		
		var scrap_num = new Array();
		var ch = $(".save_ch");
		$(ch).click(function(){
			ch = $(this);
			scrap_num = scrapCheck(ch, scrap_num);
		});
	
		//담기 버튼 클릭 이벤트
		$(".scrap_btn").click(function(){
			$.ajax({
				url:"../scrap/pmfAdd",
				type: "POST",
				data: {
					scrapNum: scrap_num.toString()
				},
				success: function(data){
					if(data == 1){
						alert("게시글이 스크랩되었습니다.");
					}else{
						alert("일시적인 오류로 스크랩 할 수 없습니다. 잠시 후 다시 시도하세요.");
					}
					$(".ch_one").prop("checked",false);
					location.reload();
				}
			});
		});
	
	});
	
	//functions
	
	//체크박스 관련
	function scrapCheck(ch, scrap_num) {
		if($(ch).attr("id") != "total_ch"){
			var num = $(ch).attr("title")*1;
			
			if($(ch).prop("checked")){
				scrap_num.push(num);
				
			}else if(!$(ch).prop("checked")){
				var index = scrap_num.indexOf(num);
				scrap_num.splice(index,1);
			}
		}else{
			if($(ch).prop("checked")){
				//배열 전부 비우고 값 전부 넣기
				scrap_num.splice(0,scrap_num.length);
				var chs = document.getElementsByClassName("ch_one");
				for(var i=0; i<chs.length; i++){
					scrap_num.push(chs[i].title*1);
				}
			}else{
				scrap_num.splice(0,scrap_num.length);
			}
		}
		
	return scrap_num;
	}

</script>
	<table class="t_list">
		<tr>
			<th class="td_1"><input type="checkbox" id="total_ch" class="save_ch"></th>
			<th class="td_2">프로젝트 명</th>
			<th class="td_3">제목</th>
			<th class="td_4">지원요건</th>
			<th class="td_5">프로젝트 분야</th>
			<th class="td_6">마감일</th>
			<th class="td_7">진행 수준</th>
			<th class="td_8">조회수</th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td><input type="checkbox" class="save_ch ch_one" title="${dto.num}"></td>
				<td>${dto.project_name}</td>
				<td><a href="./pmfView?num=${dto.num}">${dto.title}</a></td>
				<td>${dto.work_kind}</td>
				<td class="t_font">
					<c:forTokens items="${dto.major_key}" delims="/" var="key">
						${key}
					</c:forTokens> 
					<br> 
					<c:forTokens items="${dto.sub_key}" delims="/" var="key">
						${key}
					</c:forTokens>
				</td>
				<td class="t_font">~ ${dto.duration_end}</td>
				<td>진행 수준</td>
				<td>${dto.hit}</td>
			</tr>
		</c:forEach>
	</table>
	<button class="scrap_btn">
		<span class="glyphicon glyphicon-star"></span>담기
	</button>