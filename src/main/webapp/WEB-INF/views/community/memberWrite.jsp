<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>member find board</h1>
	
	<form action="" method="post">
		<input type="button" value="임시저장" id="tempSave">
		<table class="t1">
			<tr>
				<td><input class="form-control" type="text" placeholder="프로젝트 내용를 설명할 수 있는 제목을 등록 해 주세요."></td>
			</tr>

			<tr>
				<td class="t_label">프로젝트 분야</td>
				<td>
					<select name="major_key">
						<optgroup label="대분류"></optgroup>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
				</td>
				<td>
					<select name="sub_key">
						<optgroup label="소분류"></optgroup>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
				</td>
			</tr>

			<tr>
				<td>담당업무</td>
			</tr>
			<tr>
				<td><textarea id="works"></textarea></td>
			</tr>
			<tr>
				<td>프로젝트 명</td>
				<td><input type="text" id="project_name"></td>
			</tr>
			<tr>
				<td>작업 예상 기간</td>
				<td></td>
			</tr>
			<tr>
				<td>프로젝트 내용</td>
				<td><textarea id="project_detail"></textarea></td>
			</tr>
			<tr>
				<td>파일 첨부</td>
				<td><div id="dropzone">업로드할 파일을 드래그 해 주세요.</div></td>
			</tr>
			<tr>
				<td>근무유형</td>
				<td>
					<select>
						<optgroup label="근무유형을 선택해 주세요"></optgroup>
						<option>정규직</option>
						<option>파견</option>
						<option>계약직</option>
						<option>정규직</option>
						<option>기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>학력(선택)</td>
				<td>
					<select id="education_level">
						<option selected="selected">필요 학력을 선택해 주세요.</option>
						<option>무관</option>
						<option>초대졸</option>
						<option>대졸</option>
					</select>
				</td>
				<td>경력</td>
				<td>
					<select id="career">
						<option>필요 경력을 선택해 주세요.</option>
						<option>무관</option>
						<option>경력</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>급여</td>
				<td>
					<select id="pay">
						<option>협의</option>
						<option>월</option>
						<option>일</option>
					</select>
					<input type="number" id="pay_value"> 원
				</td>
			</tr>
		</table>
		<input type="button" value="등록" id="submit">
		<input type="reset" value="재작성">
	</form>	
	
</body>
</html>