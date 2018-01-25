<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/css/pmf/pmf_scrap_css.css">
<link rel="stylesheet" href="../resources/css/header.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hi!Project - scrap</title>
<script type="text/javascript">
	$(function(){
		var snums = [];
		
		//div 클릭 처리 - 비교하기
		$(".wrap_total").click(function(){
			clickedDiv = $(this);
			var snum = clickedDiv.attr("id");
			var result = 0;
			clickedDiv.toggleClass("click");	
			
			if(snums.length == 0){	//배열 크기가 0일 경우, 새롭게 추가
				snums.push(snum);
			}else{	
				var check = true;
				//배열 크기가 0이 아닌 경우, 해당 번호가 있는지 확인 후 추가
				for(var i=0; i<snums.length; i++){
					if(snum == snums[i]){			//번호가 없다면, 새롭게 추가	
						snums.splice(i,1);
						check = false;			
						break;
					}			
				}
				if(check){
					snums.push(snum);
				}
			}
		});
		
		//div 클릭 처리 2 - 원본 글 보기
		$(".wrap_total").dblclick(function(){
			var num = $(this).data("num");
			
			location.href = "../pmf/pmfView?num="+num;
		});
		
		//비교하기 버튼 클릭 시
		$(".compare_btn").click(function(){
			if(snums.length > 1 && snums.length < 5){
				//ajax로 배열 보내서 데이터 받아오기
				$.ajax({
					type: "POST",
					url: "./pmfViews",
					data:{
						snums: snums.toString()
					},
					success: function(data){
						$("#compare_result").html(data);
						snums.splice(0,snums.length);
						$(".wrap_total").removeClass("click");
					}
				});

				//modal로 띄우기
				$("#modal").show();
				$("#option_sec").hide();
				
			}else if(snums.length > 4){
				alert("4개까지만 비교가 가능합니다.");
			}else{
				alert("비교할 항목을 두 가지 이상 선택해 주세요.");
			}
		});
		
		//modal close
		$("#modal").click(function(){
			$(this).hide();
			$("#option_sec").hide();
		});
		
		//option 추가
		$("#option_btn").click(function(){
			event.stopPropagation();
			event.preventDefault();
			$("#option_sec").toggle();
		});
		
		//체크박스 클릭 시 전파 방지
		$(".check").click(function(){
			event.stopPropagation();
		});
		
		//option 변경사항 적용
		$("#submit").click(function(){
			event.stopPropagation();
	        $(".compare_tr").hide();
			
			$('.check:checked').each(function() { 
		        var id = $(this).attr("id");
		        
				$("."+id).show();
		   	});
		});
		
		//초기화
		$("#reset").click(function(){
			event.stopPropagation();
		});
		
		//원본 글 보기 버튼 클릭 이벤트
		$("#compare_result").on("click", ".view_btn",function(){
			event.stopPropagation();
			var num = $(this).data("value");
			
			location.href = "../pmf/pmfView?num="+num;
		});
	});
</script>
<style>
	.click{
		background-color: rgb(46, 170, 145);
	}
</style>
</head>
<body>
<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
<!-- header 끝 -->

	<section id="main">
		<div class="list_wrap">
			<div id="myMenu_sec">
				<div id="btn_wrap">
					<input type="button" class="compare_btn" value="비교하기">
				</div>
				<div id="scrapCall">
					<c:forEach items="${list}" var="dto">
						<div class="wrap_total" id="${dto.snum}" data-num="${dto.pmfBoardDTO.num}">
							<div class="wrap_1">
								<div class="image">이미지</div>
								<c:if test="${dto.pmfBoardDTO.duration_kind != '상시 모집'}">
									<c:if test="${not empty dto.fin}">
										<p class="d-day">${dto.fin}</p>
									</c:if>
								</c:if>
								<c:if test="${dto.pmfBoardDTO.duration_kind == '상시 모집'}">
									<p class="d-day">상시모집</p>
								</c:if>
							</div>
							<div class="wrap_2">
								<p class="project_title">${dto.pmfBoardDTO.project_name}</p>
								<div class="works_list">
									<ul>
										<li>list1</li>
										<li>list2</li>
									</ul>
								</div>
								<div class="tags_list">
									<%-- <c:forEach items="" var="tag"> --%>
									<a href="#">#tag1</a> <a href="#">#tag2</a>
									<%-- </c:forEach>  --%>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

	<!-- modal -->
	<div id="modal" style="display: none">
		<div id="modalSec">
			
			<div id="option_wrap">
				<span id="option_btn" class="glyphicon glyphicon-option-horizontal"></span>
			</div>
			
			<div id="compare_wrap">
			<table class="t_head">
				<tr class="project_name">
					<td>프로젝트 명</td>
				</tr>
				<tr class="compare_tr duration">
					<td>일정 정보</td>
				</tr>
				<tr class="compare_tr work">
					<td>직무 내용</td>
				</tr>
				<tr class="compare_tr work_detail">
					<td>직무 상세 내용</td>
				</tr>
				<tr class="compare_tr condition">
					<td>직무유형 / 급여</td>
				</tr>
				<tr class="compare_tr experience">
					<td>자격사항</td>
				</tr>
				<tr class="compare_tr host">
					<td>단체명</td>
				</tr>
				<tr class="compare_tr addr">
					<td>위치</td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
			
			<!-- 비교 테이블 추가 -->
			<div id="compare_result"></div>
			</div>
		</div>
		
		<div id="option_sec">
				<p class="option_head">비교 조건 추가</p>
				<form action="#" id="option_frm">
					<p class="option_p">
						일정 정보
						<input type="checkbox" id="duration" class="check" checked="checked">
					</p>
					<p class="option_p">
						직무 내용
						<input type="checkbox" id="work" class="check" checked="checked">
					</p>
					<p class="option_p">
						직무 상세 내용
						<input type="checkbox" id="work_detail" class="check">
					</p>
					<p class="option_p">
						단체명
						<input type="checkbox" id="host" checked="checked" class="check">
					</p>
					<p class="option_p">
						자격사항
						<input type="checkbox" id="experience" class="check">
					</p>
					<p class="option_p">
						위치 정보
						<input type="checkbox" id="addr" class="check">
					</p>
					<p class="option_p">
						근무 유형/급여
						<input type="checkbox" id="condition" class="check">
					</p>
				
				<input type="button" id="submit" value="변경사항 적용">
				<input type="reset" id="reset" value="초기화">
				</form>
			</div>
	</div>

	</section>
</body>
</html>