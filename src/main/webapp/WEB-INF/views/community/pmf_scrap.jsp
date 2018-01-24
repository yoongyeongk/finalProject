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
			//modal로 띄우기
			$("#modal").show();
		});
		
		$("#modal").click(function(){
			$(this).hide();
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
			
			<table class="t_head">
				<tr class="project_name">
					<td>프로젝트 명</td>
				</tr>
				<tr class="duration">
					<td>일정 정보</td>
				</tr>
				<tr class="work">
					<td>직무 내용</td>
				</tr>
				<tr class="work_detail">
					<td>직무 상세 내용</td>
				</tr>
				<tr class="condition">
					<td>직무유형 / 급여</td>
				</tr>
				<tr class="experience">
					<td>자격사항</td>
				</tr>
				<tr class="host">
					<td>단체명</td>
				</tr>
				<tr class="addr">
					<td>위치</td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
			
			<!-- 비교 테이블 추가 -->
			<table class="t_compare">
				<tr class="project_name">
					<td>project_1</td>
				</tr>
				<tr class="duration">
					<td>2017-12-28 ~ 2018-01-31</td>
				</tr>
				<tr class="work">
					<td>직무 내용 test</td>
				</tr>
				<tr class="work_detail">
					<td>직무 상세 내용</td>
				</tr>
				<tr class="condition">
					<td>프리랜서 / 회사 내규</td>
				</tr>
				<tr class="experience">
					<td>학력 무관 / 경력 3년 이하</td>
				</tr>
				<tr class="host">
					<td>Together</td>
				</tr>
				<tr class="addr">
					<td>강남구 역삼동</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="상세보기">
					</td>
				</tr>
			</table>
			
		</div>
	</div>

	</section>
</body>
</html>