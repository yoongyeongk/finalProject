<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.4.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

<link href="${pageContext.request.contextPath }/resources/css/tradeBoard.css" rel="stylesheet">
<script type="text/javascript">
		var count = 0;
		var regNumber = /^[0-9]*$/;
		
		
	$(function() {
		
		$("#tagForm").on("click","#addTag",function(){
			var tag = $("#addInput").val();
			var regExp = /[\{\}\[\]\/.;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi
			
			if(tag == '' || regExp.test(tag)){
				tag = tag.replace(regExp, "")
				alert("공백이나 특수문자는 입력할 수없습니다");
			}else if($(".tag").length < 8){
				var ar = tag.split(",");
					for(var i=0;i<ar.length;i++){
						if($(".tag").length < 8){
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
		
		$("#tagBox").on("click",".upDel",function(){
			if(confirm("기존 태그를 삭제하시겠습니까? 게시글에서도 삭제됩니다") == true){
				var num = parseInt(this.id);
				$.ajax({
					type:"POST",
					url:"${pageContext.request.contextPath}/tag/tagDelete",
					data:{
						num:num
					}, success : function(){
						
					}
				})
					
					var id = $(this).attr("title")
					$("#"+id).remove();
				
			}
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
	
		
	})
</script>

<script type="text/javascript">

	var sel_files = [];
	var i = 0;
	
$(function(){
		
	$("#fileBox").on("click",".imgDel",function(){
			var id = $(this).attr("title");
			$("#"+id).remove();
			i--;
		})
	
	$("#fileBox").on("click",".upImgDel",function(){
		if(confirm("기존 이미지를 삭제하시겠습니까? 게시글에서도 삭제됩니다") == true){
			var fnum = this.id
			$.post("../file/fileDelete?num="+fnum,function(){
				
			})
			var id = $(this).attr("title");
			$("#"+id).remove();
		}
	})
	
	$("#but").on("change","#f",function(){
		preview(this)
	})
		
	function preview (e) {
		sel_files = [];
		
		$(".previewBox").remove();
		
		i=0;
		var files = e.files;
		var filesAr = Array.prototype.slice.call(files);
		
		var index = 0;
		filesAr.forEach(function(f) {
			if(!f.type.match("image.*")){
				alert("업로드는 이미지만 가능합니다");
				return;
			}
			
			sel_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#default").remove();
				var html = '<div class="previewBox" id="imgDel'+i+'">'
				+'<div title="imgDel'+i+'" class="imgDel" style="position: absolute;">'
				+'<a href="javascpript:void(0)"  style="position: relative; left: 178px; top: 15px;">'
				+'<img alt="" src="${pageContext.request.contextPath }/resources/images/tradeBoard/x.png" class="x"></a></div>'
				+'<div class="preview" id="preview'+i+'">'
				+'<img src="'+e.target.result +'" style="width: 170px; height: 130px;"></div></div>'
					
				$("#fileBox").append(html);
				i++;
				
				
			}
			reader.readAsDataURL(f);
			
		})
	}

})
</script>
</head>
<body>
	<contents>
		<div class="all">
					<form action="./tradeBoard${form }" method="post" enctype="multipart/form-data" name="frm">
				
				<c:if test="${form eq 'Update'}">
					<input type="hidden" name="num" value="${param.num }">
				</c:if>
				
				<div class="box" style="margin-top: 70px;">
					<div id="titleBox">
						<span class="star">*</span>
						<input type="text" name="title" id="title" value="${one.title }" placeholder="매매할 프로젝트의 제목" style="padding-left: 12px">
						<input type="hidden" name="writer" value="sson" required="required">
					</div>
				</div>
				
				<div class="box" style="height: auto;">
				<div id="con">
					<div id="conBox">
							<textarea style="width: 800px; height: 300px;  resize:vertical ;" name="contents" id="contents">${one.contents }</textarea>
					</div>
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
										<c:if test="${form eq 'Update'}">
											<c:forEach items="${one.tags }" var="t" varStatus="i">
													<div class='tag'  id="del${i.index }">
														<li>
															<span class='tagColor'>${t.tag}</span>
															<span class='tagDel' title='del${i.index }'>X</span>
													<div class='tag'  id="uptag${i.index }">
														<li>
															<span class='upColor'>${t.tag}</span>
															<span class='upDel' title='uptag${i.index }' id="${t.tag_num }">X</span>
														</li>
													</div>
											</c:forEach>
										</c:if>
									</ul>
									</div>
								
							</div>
						</div> 
						
						<div class="box" style="height:auto;">
								<div id="but">
									<label for="f">
									<div class="move">
										<div class="select b">이미지 선택</div>
										<input type="file" id="f" name="img" multiple="multiple" style="display: none;" required="required">
									</div>
									</label>
									<h5 style="user-select:none; display: inline-block;"><span class="star">*</span> 샘플 이미지를 1개 이상 선택하세요.</h5>
								</div>
								
							<div id="fileBox">
								<c:if test="${form eq 'Update' }">
									<c:forEach items="${one.fileNames }" var="file" varStatus="f">
										<div class="upPreviewBox" id="upImgDel${f.index }">
											<div title="upImgDel${f.index }" id="${file.fnum }" class="upImgDel" style="position: absolute;">
												<a href="javascpript:void(0)"  style="position: relative; left: 178px; top: 15px;">
													<img alt="" src="${pageContext.request.contextPath }/resources/images/tradeBoard/x.png" class="x">
												</a>
											</div>
												<div class="preview" id="upPreview${f.index }">
													<img src="${pageContext.request.contextPath }/resources/upload/${file.fileName}" style="width: 170px; height: 130px;">
												</div>
											</div>
									</c:forEach>
								</c:if>
							</div>
						</div>
						
						<div class="box" style="height: auto">
							<div id="infoBox">
							
								<div class="in">
									<div>
										<label for="corporation" class="lb">기업명 <span class="star">*</span></label>
										<input type="text"  id="corporation" name="corporation" value="${one.corporation }" placeholder="ex) Together" required="required">
									</div>
								</div>
							
								<div class="in">
									<div>
										<label for="phone" class="lb">연락처 <span class="star">*</span></label>
										<input type="tel"  id="phone" name="corporate_phone" value="${one.corporate_phone }" placeholder="ex) 01056807909">
										<input type="button" id="pc" value="번호인증" class="pb b">
									</div>
								</div>
								
								<div class="in">
									<div style="display: inline-block; float: left;">
										<label for="min_price" class="lb">최소 경매가 <span class="star">*</span></label>
										<input type="text" name="min_price" id="min_price" value="${one.min_price }" placeholder="ex) 1300000" required="required">
									</div>
									
									<div style="display: inline-block; float: right;">
										<label for="closing_date" class="lb">마감일 <span class="star">*</span></label>
										<input type="date" name="closing_date" id="closing_date" value="${one.closing_date}" required="required">		
									</div>
								</div>
								
							</div>
						</div>
						
							<div id="buttonBox">
								<button id="btn" ng-disabled="frm.$error.required" >
									<img src="${pageContext.request.contextPath }/resources/images/tradeBoard/v.png" id="v">
									 <c:choose>
									 	<c:when test="${form eq 'Update' }">
									 		수정하기
									 	</c:when>
									 	<c:otherwise>
									 		등록하기
									 	</c:otherwise>
									 </c:choose>
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