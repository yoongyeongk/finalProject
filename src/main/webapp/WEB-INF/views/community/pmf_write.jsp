<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.ckeditor.com/4.8.0/basic/ckeditor.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script src="../resources/js/pmf_write.js"></script>
<link rel="stylesheet" href="../resources/css/pmf/pmf_write_css.css">
<link rel="stylesheet" href="../resources/css/header.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hi!project - write form</title>
</head>
<body>
	<!-- header -->
	<c:import url="../temp/header.jsp"></c:import>
	<!-- header 끝 -->
	
	<section id="main">
	
		<!-- 게시판 내용 -->	
		<section id="board_sec">
		<form action="./pmfWrite" method="post" id="frm">
			<input class="title form-control" name="title" type="text" placeholder="프로젝트 내용를 설명할 수 있는 제목을 등록해 주세요.">
			<input type="button" value="임시저장" id="tempSave">
			<input type="hidden" value="0" name="temp" id="temp_value">
			<input type="hidden" value="writer" name="writer">
			
			<p class="des">* 표시된 항목은 필수항목입니다.</p>
			<table class="t_project">
				<tr>
					<td class="t_title" colspan="2">* 프로젝트 정보</td>
				</tr>
				<tr>
				<!-- 대분류 선택 시 소분류 내용 나오도록 만들기 -->
					<td class="t_label label1">프로젝트 분야</td>
					<td>
						<select class="form-control selectBox" name="major_key" id="major_key">
							<option disabled="disabled">대분류</option>
							<c:forEach items="${major_key}" var="key">
								<option>${key}</option>
							</c:forEach>
						</select>
						<select class="form-control selectBox fRight" name="sub_key" id="sub_key">
							<option disabled="disabled">소분류</option>
							<c:forEach items="${sub_key}" var="key">
								<option>${key}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="t_label label1">프로젝트 명</td>
					<td><input type="text" id="project_name" name="project_name" class="project_name form-control"></td>
				</tr>
				<tr>
					<td class="t_label label1">작업 예상 기간</td>
					<td><input type="date" name="start_date" class="start_date form-control"> ~ <input type="date" name="end_date" class="end_date form-control"></td>
				</tr>
				<tr>
					<td class="t_label" colspan="2">프로젝트 내용</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="project_detail" rows="10" draggable="false" class="form-control" id="project_detail"></textarea>
					</td>
				</tr>
				<tr>
					<td class="t_label" colspan="2">파일 첨부</td>
			
				</tr>
				<tr>
					<td colspan="2">
						<div id="dropzone">업로드할 파일을 드래그해 주세요.</div>
						<div id="fileSec"></div>
					</td>
				</tr>
				<tr>
					<td class="t_label" colspan="2">담당업무</td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- 에디터 추가 -->
						<textarea rows="10" draggable="false" class="form-control" id="works" name="works"></textarea>
					</td>
				</tr>	
			</table>
			
			<table class="t_workCondition">
				<tr>
					<td class="t_title" colspan="2">근무 조건</td>
				</tr>
				<tr>
					<td class="t_label label1">* 근무유형</td>
					<td>
						<select class="form-control selectBox" id="work_kind"  name="work_kind">
							<optgroup label="근무유형을 선택해 주세요"></optgroup>
							<option>정규직</option>
							<option>계약직</option>
							<option>파견</option>
							<option>프리랜서</option>
							<option>기타</option>
						</select>
					</td>
				</tr>
				<tr>
				<!-- 학력/경력 필요시만 창 추가할 수 있도록 버튼 만들기 -->
					<td class="t_label label1">학력</td>
					<td>
						<select class="form-control selectBox" id="education_level" name="education_level">
							<option>무관</option>
							<option>초대졸</option>
							<option>대졸</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="t_label label1">경력</td>
					<td>
						<select class="form-control selectBox" id="career" name="career">
							<option>무관</option>
							<option>경력</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="t_label label1">* 급여</td>
					<td style="font-size: 12px">
						<select class="form-control selectBox" id="payment_kind" name="payment_kind">
							<option>협의</option>
							<!-- 월/일 선택할 경우 input 창 뜨게 하기 -->
							<option>월</option>
							<option>일</option>
						</select>
						<!-- 금액 조건 걸기 - 최대 / 최소값 -->
						<span id="pay_value"></span>
					</td>
				</tr>
			</table>
			
			<table class="t_firmInfo">
				<tr>
					<!-- 필요 시 추가 -->
					<td class="t_title" colspan="2">회사/단체 정보</td>
				</tr>
				<tr>
					<td class="t_label" colspan="2">상세 정보</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="firm_info" rows="10" draggable="false" class="form-control" id="firm_detail"></textarea>
					</td>
				</tr>
				<tr>
					<!-- 주소 찾기 -->
					<td class="t_label label1" rowspan="2">지역 정보</td>
					<td>
						<!-- 주소 검색 API -->
						<input type="text" id="addr" class="postcodify_address find_addr addr form-control" name="addr"><input type="button" id="find_addr" class="find_addr" value="주소 찾기">
					</td>
				</tr>
				<tr>
					<td>
						<!-- 상세 주소 입력란 -->
						<input type="text" id="addr_detail" class="postcodify_details addr_detail form-control" name="addr_detail" placeholder="상세 주소를 입력해 주세요.">
					</td>
				</tr>
			</table>
				
			<table class="t_contactInfo">
				<tr>
					<td class="t_title" colspan="2">* 담당자 정보</td>
				</tr>
				<tr>
					<td class="t_label label1">담당자 id</td>
					<td>
						<input type="text" name="admin_id" class="contact_form form-control">
					</td>	
				</tr>
				<tr>
					<td class="t_label label1">담당자 email</td>
					<td>
						<!-- 담당자 email - 클립보드 복사 기능  -->
						<input type="text" name="admin_email" class="contact_form form-control">
					</td>
				</tr>
				<tr>
					<td class="t_label label1">담당자 휴대번호</td>
					<td>
						<!-- 담당자 휴대번호 -->
						<input type="text" name="admin_phone" class="contact_form form-control">
					</td>
				</tr>
			</table>	
			
			<table class="duration_sec">
				<tr>
					<td class="t_title" colspan="2">* 모집 기간</td>
				</tr>
				<tr>
					<td class="t_label label1">기간 선택</td>
					<td>
						<select class="form-control selectBox" id="duration" name="duration_kind">
							<option>상시 모집</option>
							<option>마감일 선택</option>
						</select>
						<span id="dura_end"></span>
					</td>
				</tr>
			</table>
			<table class="document_sec">
				<tr>
					<td class="t_title" colspan="2">제출 서류</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="document" rows="5" draggable="false" class="form-control" id="document"></textarea>
					</td>
				</tr>
			</table>
			<input class="submit_btn" type="button" value="등록" id="submit_btn">
			<input class="reset_btn" type="reset" value="재작성">
		</form>	
		</section>
		<!-- 게시판 내용 끝 -->
		
	</section>
	
	<!-- footer -->
	<!-- footer 끝 -->
</body>
</html>