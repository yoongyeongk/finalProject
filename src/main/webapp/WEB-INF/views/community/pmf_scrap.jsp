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
<script src="../resources/js/pmf_scrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hi!Project - scrap</title>
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
					<c:if test="${not empty list}">
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
					</c:if>
					<c:if test="${empty list}">
						<div id="noList">
							스크랩한 내용이 없습니다.
						</div>
					</c:if>
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