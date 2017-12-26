<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>

<style type="text/css">
	html{
		width: 100%;
		height: 100%;
	}
	.all{
		width: 1300px;
		height: 1250px;
		margin: 0 auto;
	}
	.box{
		width: 900px;
		height: 100px;
		margin: 0 auto;
		margin-bottom: 40px;
	}
	.tag{
		list-style: none;
		float: leftl;
		margin-left: 15px;
		display: inline-block;
	}
	.tagDel{
		padding: 0px 0px 0px 6px;
		cursor: pointer;
	}
	.tagColor{
		color: #005fc1;
		background-color: #f2f2f2;
	}
	#tagBox{
		margin-top: 10px;
		margin-left: 33px;
	}
	#title{
		width: 700px;
		height: 40px;
		border: 2px solid powderblue;
		border-radius: 8px;
	}
	#title:focus{
		border: 2px solid turquoise;
		  outline-offset:-2px;
	}
	#titleBox{
		padding-top: 25px;
		text-align: center;
	}
	#con{
		width: 900px;
		margin: 0 auto;
		
	}
	#conBox{
		margin: 0 auto;
		width: 800px;
	}
	#conBox:hover{
		outline: 2px solid #27b6ba;
	}
	#tagForm{
		padding-top: 10px;
		width: 800px;
		margin: 0 auto;
		margin-top:20px;
		border: 1px solid #c9c9c9;
	}
	#tagForm:hover{
		outline: 2px solid #27b6ba;
	}
	#addForm{
		position: relative; top: -1px; left: 20px;
	}
	#addInput{
		width: 350px;
		padding-left: 20px;
	}
	#text1{
		font-weight: bold; 
		margin-left: 12px; 
		margin-right: 30px;
		user-select:none;
	}
	.b{
		display: inline-block;
   	 	border: 1px solid #dcdede;
   	 	border-right: 1px solid #c0c3c6;
 		border-bottom: 1px solid #c0c3c6;
 		color: #606060;
   		text-decoration: none;
   		background-color: white;
	}
	#but{
		width: 800px;
		margin: 0 auto;
	}
	#fileBox{
		width: 800px;
		margin: 0 auto;
		border: 1px solid #c9c9c9;
  	 	padding-left: 34px;
    	padding-top: 15px;
	}
	.previewBox{
		width: 170px;
		height: 165px;
		display: inline-block;
		margin-right: 10px;
		margin-top:0;
	}
	.files{
		width: 80px;
		margin: 0 auto;
	}
	#imgInput0{
		display: none;
	}
	.move{
		width: 170px;
		margin: 0 auto;
		text-align: center;
		margin-top: 5px;
	}
	.preview{
		width: 170px;
		height: 130px;
		border: 1px solid powderblue;
	}
	.imgs{
		width: 170px;
		height: 130px;
	}
	.x{
		width: 25px;
		height: 25px;
	}
	.preview:hover{
		outline: 2px solid dodgerblue;
	}
	#infoBox{
		width: 800px;
		margin: 0 auto;
		border: 1px solid #c9c9c9;
	}
	#infoBox:hover{
		outline: 2px solid #27b6ba;
	}
	.in{
	    width: 555px;
  	 	margin: 0 auto;
    	height: 45px;
    	padding-top: 10px;
	}
	#min_price{
		padding-left: 12px;
		font-size: 16px;
	}
	#closing_date{
		width: 150px; 
		font-size: 16px;
	}
	.star{
		font-size:16px;
		color: orangered;
	}
	.lb{
		user-select:none;
		width: 90px;
		text-align: center;
	}
	#phone{
		padding-left: 12px;
		font-size: 16px;
		width: 280px;
	}
	.pb{
		width: 150px;
    	height: 30px;
    	float: right;
    	margin-right: 1px;
	}
	#buttonBox{
		margin: 0 auto;
		width: 500px;
		text-align:center;
	}
	#btn{
		background-color: #40a1ff;
		color: white;
		border: none;
		padding-right: 20px;
		width: 180px;
		height: 50px;
		
	}
	#v{
		width: 30px;
		height: 30px;
	}
</style>

<script type="text/javascript">
		var count = 0;
		var index = 1;
		var regNumber = /^[0-9]*$/;
		
	$(function() {

		$("#multi").change(function() {
			alert($(this).val())
		})
		
		$("#addTag").click(function() {
			var tag = $("#addInput").val();
			var regExp = /[\{\}\[\]\/?.;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi
			
			if(tag == '' || regExp.test(tag)){
				tag = tag.replace(regExp, "")
				alert("공백이나 특수문자는 입력할 수없습니다");
			}else if($(".tag").length < 8){
				var ar = tag.split(",");
					for(var i=0;i<ar.length;i++){
						if(count < 8){
							var t = "<div class='tag'  id='del"+count+"'>"+"<li>";
							t = t + "<span class='tagColor'>"+"#"+ar[i]+"</span>"+"<span class='tagDel' title='del"+count+"'>X</span></li>";
							t = t + "<input type='hidden' name='tag' class='tags' value='#"+ar[i]+"'>"+"</div>";
							$("#tagBox ul").append(t)
							$("#addInput").val("")
							count++;
						}
				}
			}else{
				alert("최대 8개까지만 추가됩니다");
			}
		})
		
		$("#tagBox").on("click",".tagDel",function(){
			var id = $(this).attr("title")
			$("#"+id).remove();
			count--;
		})
		
		  $("#addFile").click(function(){
			if($(".files").length < 8){
				$.post("../common/tradeWriteAjax?index="+index,function(form){
					$("#fileBox").append(form)
					index++;
				})
			}
		}) 
		
		$("#fileBox").on("click",".imgDel",function(){
			var id = $(this).attr("title");
			$("#"+id).remove();
			index--;
		})

		$("#infoBox").on("keyup","#phone",function(){
				if(!regNumber.test($(this).val())) {
				    alert('숫자만 입력해주세요.');
				    $(this).val("")
				}
		})
		
		$("#infoBox").on("keyup","#min_price",function(){
				if(!regNumber.test($(this).val())) {
				    alert('숫자만 입력해주세요.');
				    $(this).val("")
				}
		})
		
		$("#btn").click(function() {
		/* 	for(var i=0;i<$(".tags").length;i++){
			var t = document.getElementsByClassName("tags")[i].value;
			alert(t)
			} */
		})
		
	})
</script>
<script type="text/javascript">
$(function(){
	$("#fileBox").on("change",".files",function(){
		imgPreview(this)
	})
	
function imgPreview(f){
	var file = f.files; // files 를 사용하면 파일의 정보를 알 수 있음
	
	if(file[0].size > 1024 * 1024 * 10){
		// 큰 파일을 올리니까 브라우저가 다운되었음 -_-;;
		alert('10MB 이상의 파일은 안됩니다.');

		return;
	}	
	else if(file[0].type.indexOf('image') < 0){ // 선택한 파일이 이미지인지 확인
		alert('이미지 파일만 선택하세요.');

		return;
	}
//파일의 갯수만큼 반복
	for(var i=0; i<file.length; i++){
		
		var reader = new FileReader(); // FileReader 객체 사용
		reader.onload = function(rst){
			$('#preview'+f.title).html('<img class="imgs" src="' + rst.target.result + '">'); // append 메소드를 사용해서 이미지 추가
			// 이미지는 base64 문자열로 추가
			// 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
		}
		reader.readAsDataURL(file[i]); // 파일을 읽는다
	}
}

})
</script>
</head>
<body>
	<contents>
		<div class="all">
					<form action="./tradeBoardWrite" method="post" enctype="multipart/form-data">
				
				<div class="box" style="margin-top: 70px;">
					<div id="titleBox">
						<span class="star">*</span>
						<input type="text" name="title" id="title" placeholder="매매할 프로젝트의 제목" style="padding-left: 12px">
						<input type="hidden" name="writer" value="sson">
					</div>
				</div>
				
				<div id="con">
					<div id="conBox">
							<textarea style="width: 800px; height: 300px;  resize:vertical ;" name="contents" id="contents">&nbsp;&nbsp;</textarea>
					</div>
				</div>
				
					<div class="box" style="margin-bottom: 20px;">
						<div id="tagForm">
							<span id="text1">태그</span>
							<span id="addForm" style="color: #969696;">#</span>
								<input type="text" placeholder="태그를 추가하세요 (최대 8개)" id="addInput">
									<input type="button" id="addTag" class="b" value="추가">
									
								<div id="tagBox">
									<ul>
									</ul>
									</div>
								
							</div>
						</div> 
						
						<div class="box" style="height:auto;">
								<div id="but">
									<input type="button" id="addFile" class="b" value="이미지 추가">
									<h5 style="user-select:none; display: inline-block;"><span class="star">*</span> 샘플 이미지를 넣으세요. 최대 8개까지 추가됩니다.</h5>
								</div>
								
							<div id="fileBox">
							
								<div class="previewBox">
										<label for="imgInput0">
									<div class="preview" id="preview0">
										<img src="${pageContext.request.contextPath }/resources/images/tradeBoard/image+.png" style="width: 170px; height: 130px;">
									</div>
									<div class="move">
											<div class="b">이미지 선택</div>
											<input type="file" name="img" class="files" id="imgInput0" title="0" accept=".jpg,.png,.jpeg,.pmp">
									</div>
										</label>
								</div>
			
							</div>
						</div>
						
						<div class="box">
							<div id="infoBox">
								<div class="in">
									<div>
										<label for="phone" class="lb">연락처 <span class="star">*</span></label>
										<input type="tel"  id="phone" placeholder="ex) 01056807909">
										<input type="button" id="pc" value="번호인증" class="pb b">
									</div>
								</div>
								
								<div class="in">
									<div style="display: inline-block; float: left;">
										<label for="min_price" class="lb">최소 경매가 <span class="star">*</span></label>
										<input type="text" name="min_price" id="min_price" placeholder="ex) 1300000">
										<span id="p"></span>
									</div>
									
									<div style="display: inline-block; float: right;">
										<label for="closing_date" class="lb">마감일 <span class="star">*</span></label>
										<input type="date" name="closing_date" id="closing_date">
									</div>
								</div>
								
							</div>
						</div>
							<div id="buttonBox">
								<button id="btn">
									<img src="${pageContext.request.contextPath }/resources/images/tradeBoard/v.png" id="v">
									 등록하기
								</button>
							</div>
				</form>
		</div>
	</contents>
	<script>
		CKEDITOR.replace( 'contents' );
	</script>

</body>
</html>