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
	<link rel="stylesheet" href="../resources/css/header.css">
<!-- js -->
	<script src="../resources/js/pmf_view.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hi!Project - view</title>
</head>
<body>
	<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
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
							<c:forEach items="${view.fileDTO}" var="file" varStatus="i">
							<c:if test="${i.count%2 == 1}">
								<div class='statusbar odd'>
									<div class='filename'>${file.oriname}</div>
									<div class='filesize'>${file.filesize}</div>
									<div class='progressBar'></div>
									<a href="../pmfFile/fileDownload?fnum=${file.fnum}" class="download">다운로드</a>
								</div>
							</c:if>
							<c:if test="${i.count%2 == 0}">
								<div class='statusbar even'>
									<div class='filename'>${file.oriname}</div>
									<div class='filesize'>${file.filesize}</div>
									<div class='progressBar'></div>
									<a href="../pmfFile/fileDownload?fnum=${file.fnum}" class="download">다운로드</a>
								</div>
							</c:if>
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
			
			<c:if test="${user.username eq view.writer}">
				<input class="delete_btn" type="button" value="삭제" id="delete_btn">
				<input class="update_btn" type="button" value="수정" id="update_btn">
			</c:if>
		
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
				<tr class="t_reply_tr">
					<td class="td_r t_1">작성자</td>
					<td class="td_r t_2">내용</td>
					<td class="td_r t_3">작성 시간</td>
					<td class="td_r t_4"></td>
				</tr>
			</table>
			<div id="reply_sec"></div>
			<div id="reply_add" class="reply_add" title="1">더보기</div>
			</div>
		</section>
		
	</section>
	
	<!-- footer -->
	<!-- footer 끝 -->
</body>
</html>