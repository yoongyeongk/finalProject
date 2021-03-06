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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hi!project - write form</title>
<script type="text/javascript">
$(function(){
	function fileUpload(files, drop_sec){
		var formdata = new FormData();
		
		for(var i=0; i<files.length; i++){
			formdata.append('file',files[i]);	//formdata에 받은 파일을 하나씩 추가하기(name,value)
		
		//progress bar 생성
		var status = new createStatusbar(drop_sec);
		status.setFileNameSize(files[i].name, files[i].size);
		sendFileToServer(formdata,status);
		}
	}
	
	var cnt = 0;
	var fileArray = [];		//새로 올린 filename을 담아둘 배열
	
	function sendFileToServer(formdata,status){
		//파일 서버로 전송 및 저장
		var jqxhr = $.ajax({
			xhr: function(){
				var xhrobj = $.ajaxSettings.xhr();
				if(xhrobj.upload){
					xhrobj.upload.addEventListener('progress',function(event){
						var percent = 0;
						var position = event.loaded || event.position;
						var total = event.total;
						if(event.lengthComputable){
							percent = Math.ceil(position / total*100);
						}
						status.setProgress(percent);
					}, false);
				}
				return xhrobj;
			},
			type: 'POST',
			url: '../test/fileUpload',
			data: formdata,
			contentType: false,
			processData: false,
			success: function(data){
				status.setProgress(100);		//상태 100으로 설정
				//fileDTO 객체에 값 넣기
				cnt++;
				fileArray.push(data.filename);
				$("#fileSec").append('<div id="file'+cnt+'"></div>');
				$("#file"+cnt).append('<input type="hidden" name="filename" value="'+data.filename+'">');
				$("#file"+cnt).append('<input type="hidden" name="oriname" value="'+data.oriname+'">');
				$("#file"+cnt).append('<input type="hidden" name="size" value="'+data.filesize+'">');
			}
		});
		
		status.setAbort(jqxhr);
	}
	
	var rowCount = 0;
	function createStatusbar(drop_sec){
		
		rowCount++;
		var row = "odd";
		if(rowCount % 2 == 0){
			row = "even";
		}
		
		this.statusbar = $("<div class='statusbar "+row+"'></div>");
		this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
		this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
		this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
		this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
		this.delF = $('<span id="del'+cnt+'" class="deleteArray delfile">삭제</span>').appendTo(this.statusbar);
		this.delF.hide();
		
		$("#fileSec").append(this.statusbar);
		
		//파일 이름과 사이즈를 구하는 메서드
		this.setFileNameSize = function(name,size){
			var sizeStr = "";
			var sizeKB = size/1024;
			if(parseInt(sizeKB) > 1024){
				var sizeMB = sizeKB/1024;	//1024KB보다 클 때 MB로 전환하기
				sizeStr = sizeMB.toFixed(2)+" MB";
			}else{
				sizeStr = sizeKB.toFixed(2)+" KB";
			}
			
			this.filename.html(name);
			this.size.html(sizeStr);
		}
		
		//progress bar를 생성하는 메서드
		this.setProgress = function(progress){
			var progressBarWidth = progress*this.progressBar.width()/100;
			this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
			if(parseInt(progress) >= 100){
				this.abort.hide();
				this.delF.show();
			}
		}
		
		//파일 전송을 중지하는 메서드
		this.setAbort = function(jqxhr){
			var sb = this.statusbar;
			this.abort.click(function(){
				jqxhr.abort();
				sb.hide();
			});
		}
	}
	
	var drop_sec = $("#dropzone");
	$(drop_sec).on({
		dragenter: function(event){
			event.stopPropagation();
			event.preventDefault();
			$(this).css("border","2px solid gray");
		},
		dragleave: function(event){
			event.stopPropagation();
			event.preventDefault();
			$(this).css("border","1px solid #ddd");
		},
		dragover: function(event){
			event.stopPropagation();
			event.preventDefault();
		},
		drop: function(event){
			event.preventDefault();	//자동으로 파일 실행하는 것 없애기
			$(this).css("border","1px solid #ddd");
			var files = event.originalEvent.dataTransfer.files;
			
			if(files.length > 0){
				//fileUpload
				fileUpload(files, drop_sec);
			}
		}
	})
	
	//DB에 없는 파일 삭제하기 - 배열에서 파일명 AJAX로 넘기고, 제거
	$("#fileSec").on("click",".deleteArray",function(){
		var delArray = $(this);
		var index = $(delArray).attr("id").replace("del","")*1;
		var filename = fileArray[index];
		//파일 이름 찾아서 데이터에서 삭제하기
		$.ajax({
			type: "POST",
			url: "../pmfFile/fileDelete",
			data:{
				filename: filename
			},
			success: function(data){
				$(delArray).parent().remove();		//div 삭제 처리
				index = index+1;
				$("#file"+index).remove();			//input 삭제 처리
			}
		});
	});

	//CKEditor
	//name 각 DB 항목에 맞게 변경하기
	CKEDITOR.replace( 'project_detail' );
	CKEDITOR.replace( 'works' );
	CKEDITOR.replace( 'firm_info' );
	CKEDITOR.replace( 'document' );
	
	//주소검색
	$(".find_addr").postcodifyPopUp();
	
	//select box option
	var major_key = "IT/인터넷";
	$("#major_key").on({
		change: function(){
			major_key = $(this).val();
			$("#sub_key").html('<option disabled="disabled">소분류</option>')
			$.ajax({
				type:'POST',
				url: '../pmf/subKey',
				dataType: 'json',
				data: {
					major_key: major_key
				},
				success: function(data){
					for(var i=0; i<data.length; i++){
						$("#sub_key").append('<option>'+data[i]+'</option>');
					}
				}
			});
		}
	});

	//pay value
	$("#payment_kind").change(function(){
		var payKind = $("#payment_kind").val();
		if(payKind != "협의"){
			$("#pay_value").html('<input class="form-control payValue" type="number" id="payment_value" name="payment_value"> 원');
		}else{
			$("#pay_value").html('');
		}
	});
	
	//마감일
	$("#duration").change(function(){
		var dKind = $("#duration").val();
		if(dKind != "상시 모집"){
			$("#dura_end").html('<input type="date" name="duration_end" class="date_select selectBox fRight form-control">');
		}else{
			$("#dura_end").html('');
		}
	});
	
	//작업예상기간 end_date 설정
	$(".start_date").change(function(){
		var start_date = $(this).val();
		$(".end_date").attr("min",start_date);
	});
	
	//form submit
	//임시저장
	$("#tempSave").click(function(){
		var sDate = $(".start_date").val();
		var eDate = $(".end_date").val();
		if(!sDate || !eDate){
			alert("작업예상기간은 필수사항입니다.");
		}else{
			$("#temp_value").val(1);
			$("#frm").submit();	//임시저장 시 테이블에 저장
		}
	});
	
	//등록
	$("#submit_btn").click(function(){
		$("#frm").submit();
	});
});
</script>
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
			<input type="hidden" value="${user.username}" name="writer">
			
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