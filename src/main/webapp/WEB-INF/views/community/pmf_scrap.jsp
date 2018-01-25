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
		
		$(".compare_btn").click(function(){
			//ajax로 배열 보내서 데이터 받아오기
			$.ajax({
				type: "POST",
				url: "./pmfViews",
				data:{
					snums: snums.toString()
				},
				success: function(data){
					$("#compare_wrap").append(data);
				}
			});
			
			//modal로 띄우기
			$("#modal").show();
		});
		
		$("#modal").click(function(){
			$(this).hide();
		});
		
		//option 추가
		$("#option_btn").click(function(){
			event.stopPropagation();
			event.preventDefault();
			$("#option_sec").toggle();
		});
		
		$(".check").click(function(){
			event.stopPropagation();
		});
		
		$("#submit").click(function(){
			event.stopPropagation();
	        $(".compare_tr").hide();
			
			$('.check:checked').each(function() { 
		        var id = $(this).attr("id");
		        
				$("."+id).show();
		   	});
		});
		
		$("#reset").click(function(){
			event.stopPropagation();
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
						<div class="wrap_total" id="${dto.snum}">
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