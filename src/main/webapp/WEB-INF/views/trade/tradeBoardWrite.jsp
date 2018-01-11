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

<link href="${pageContext.request.contextPath }/resources/css/tradeBoardWrite.css" rel="stylesheet">
<script type="text/javascript">
		var count = 0;
		var regNumber = /^[0-9]*$/;
		
	$(function() {
	
		var editor = CKEDITOR.replace( 'contents' ,{height:'310px'});

		// The "change" event is fired whenever a change is made in the editor.
		editor.on( 'change', function( evt ) {
		    timeout();
		});
		
		
		$("#tagForm").on("click","#addTag",function(){
			var tag = $("#addInput").val();
			var regExp = /[\{\}\[\]\/.;:|\)*~`!^\-_+<>@\s\#$%&\\\=\(\'\"]/gi
			
			if(tag == '' || regExp.test(tag)){
				$("#addInput").val($("#addInput").val().replace(regExp, ""))
				$("#addTag").click()
			}else if($(".tag").length < 8){
				var ar = tag.split(",");

					for(var i=0;i<ar.length;i++){
						if($(".tag").length < 8 && ar[i] != ""){
							var t = "<div class='tag'  id='del"+count+"'>"+"<li>";
							t = t + "<span class='tagColor'>"+"#"+ar[i]+"</span>"+"<span class='tagDel' title='del"+count+"'>X</span></li>";
							t = t + "<input type='hidden' name='tag' class='tags' value="+ar[i]+">"+"</div>";
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
				$.post("../tag/tagDelete?num="+num)
					var id = $(this).attr("title")
					$("#"+id).remove();
			}
		})
		

		$("#infoBox").on("keyup","#phone",function(){
				var regPhone = /^[0-9]{3}[0-9]{4}[0-9]{4}$/
				if(!regNumber.test($(this).val())) {
				    $(this).val("")
				}else if (this.value.length > 11){
					$(this).val($(this).val().slice(0,-1))
				}
		})
		
		$("#infoBox").on("keyup","#min_price",function(){
				if(!regNumber.test($(this).val())) {
				    alert('숫자만 입력해주세요.');
				    $(this).val("")
				}
		})
		
		var rd = 0;
		var check = true; //번호인증체크. 현재 일부러 true로 설정함. 나중에 if ${form}이 Update일경우 true 아니면false
		
		$("#pc").click(function(){
			if(!check){
				if($("#phone").val().length == 11){
					$("#checkBox").css("display","block")
					var phone = $("#phone").val()
					$.ajax({
						type:"POST",
						url:"./tradeBoardCheck",
						data:{
							phone:phone
						},success : function(data){
							alert(data)
							rd = data
						}
					})
				}else{
					alert("올바른 번호를 입력해주세요")
				}
			}else{
				alert("인증되었습니다")
			}
		})
		
		$("#checkButton").click(function(){
			if($("#check").val() == rd){
				alert("인증되었습니다")
				check = true;
				$("#check").attr("readonly","readonly")
				$("#phone").attr("readonly","readonly")
			}else{
				alert("번호가 틀렸습니다 다시 시도하세요")
			}
		})
		
		$("#btn").click(function(){
			if($(".upPreviewBox").length > 0 || $(".previewBox").length > 0 && check == true){
				$(this).attr("type","")
			}else if (!check){
				$(this).attr("type","button")
				alert("번호 인증이 필요합니다")
			}else{
				$(this).attr("type","button")
				alert("이미지 1개이상 선택해주세요")
			}
			
		})
		
	})
</script>
<script type="text/javascript">
var timecheck = true;
var url = "../tradeSave/tradeSaveInsert";
var save_num = 0;
var saveCount = 'insert';
var totalCount = 0;
var minute = 300000;
var fnc;
var list = {
			call : function(id,curPage) {
				$.post("../tradeSave/saveList?writer="+id+"&curPage="+curPage+"&save_num="+save_num,function(data){
				$(".list").html(data.trim())
				getCount();
				$(".listCall span").html("("+totalCount+")")
			})	
		}
	}

	
function timeout() {
	 var writer = $("#writer").val();
	 var title = "";
	 var contents = "";
	 
	if(timecheck == true){
		timecheck = false;
		
		if(saveCount == 'insert'){
			 fnc = setTimeout(function() {
				  timecheck = true;
				  title = $("#title").val();
				  if(title == ''){
					  title="게시물 이름을 적어주세요";
				  }
				  contents = CKEDITOR.instances.contents.getData();
					$.ajax({
					  type:"POST",
					  url:url,
					  data: {
						  writer:writer,
						  title:title,
						  contents:contents
					  }, success : function(data) {
						save_num = data.save_num
						if(save_num == 0){
							alert("저장되지 않았습니다. 임시저장은 최대 50개까지 입니다.");
						}
							list.call('sson',1,save_num)
							saveCount ='up';
					}
				  })
			}, minute);
		}else{
				 fnc = setTimeout(function() {
				  timecheck = true;
				  title = $("#title").val();
				  if(title == ''){
					  title="게시물 이름을 적어주세요";
				  }
				  contents = CKEDITOR.instances.contents.getData();
				  url = "../tradeSave/tradeSaveUpdate";
					$.ajax({
					  type:"POST",
					  url:url,
					  data: {
						  save_num:save_num,
						  writer:writer,
						  title:title,
						  contents:contents
					  }, success : function(data) {
						  list.call('sson',1,save_num)
					}
				  })
			}, minute);
		}
	}
	
}
	
	function timeClear() {
		timecheck = true;
		clearTimeout(fnc);
	}
	
$(function() {
	
	list.call('sson',1,save_num)
	
	$("#over").css("display","none")
	$(".hideSet").css("display","none")
	
	$(".listCall").click(function() {
		if($("#over").css("display") == 'block'){
			$("#over").css("display","none")
		}else{
			$("#over").css("display","block ")
		}
	})
	
	$(".close").click(function() {
		$("#over").css("display","none")
	})
	
	$(".settingGUI").click(function() {
		if($(".hideSet").css("display") == 'block'){
			$(".hideSet").css("display","none")
		}else{
			$(".hideSet").css("display","block ")
		}
	})
	
	 $("#minBtn").click(function() {
			var minSet = $("#minute").val();
			if(minSet == 1){
				minute = 1000*60;
				timeClear()
			}else if(minSet == 3){
				minute = 1000*60*3;
				timeClear()
			}else if(minSet == 5){
				minute = 1000*60*5;
				timeClear()
			}else if(minSet == 10){
				minute = 1000*60*10;
				timeClear()
			}
		})
	
	$("#over").on("click",".list_x",function(){
		var title = $(this).attr("title");
		var num = this.id;

			$.post("../tradeSave/saveDelete?save_num="+num)
			$("#"+title).remove();
			saveCount='insert';
			url = "../tradeSave/tradeSaveInsert";
			list.call('sson',1,save_num)
	})
	
	$("#over").on("click",".page",function(){
		var curPage = $(this).attr("title");
		list.call('sson',curPage,save_num)
	})
	
	$("#over").on("click",".viewLink",function(){
		var getNum = this.title;
		$.post("${pageContext.request.contextPath }/tradeSave/saveOne?save_num="+getNum,function(data){
			$("#title").val(data.title)
			CKEDITOR.instances.contents.setData(data.contents)
		})
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
			$.post("../file/fileDelete?num="+fnum);
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
						<input type="text" name="title" id="title" value="${one.title }" placeholder="매매할 프로젝트의 제목"  onkeyup="timeout()" style="padding-left: 12px">
						<input type="hidden" name="writer" id="writer" value="sson" required="required">
					</div>
				</div>
				
					<div id="over">
						<div class="listBox">
							<div class="position">
								<div class="guide">임시 저장된 글을 불러올 수 있습니다</div>
								<span class="close">
									<img src="${pageContext.request.contextPath }/resources/images/tradeBoard/btn_x_close.gif">
								</span>
								<div class="list">
									
								</div>
								<div class="time_setBox">
									<div class="inBox">
										<a href="javascript:void(0)" class="settingGUI">
											<img src="${pageContext.request.contextPath }/resources/images/tradeBoard/btn_editchange.gif">
										</a>
									</div>
									
									<div class="hideSet">
										<div class="inBox txt">
											<p class="save_guide">시간설정에따라 글이 자동 저장되며 최대 50개까지 저장 됩니다.</p>
											<p class="save_guide sg">저장된 글은 저장일부터 한달 후에 삭제 됩니다.</p>
										</div>
										
										<div class="inBox ts">
											<div class="inner">
												<span>작성중인 글을</span>
													<select id="minute">
														<option>1</option>
														<option>3</option>
														<option selected="selected">5</option>
														<option>10</option>
													</select>
												<span>분마다 자동 저장</span>
												<input type="button" class="b" id="minBtn" value="확인">
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
					
							<div id="tempBox">
								<div class="listCall" style="float: right;">
									<a href="javascript:void(0)">임시 저장된 글<span></span></a>
								</div>
							</div>
					<div class="box" style="height: auto;">
							
					<div id="con">	
						<div id="conBox">
								<textarea style="width: 800px; height: 450px;  resize:vertical ;" name="contents" id="contents">${one.contents }</textarea>
						</div>
					</div>
					</div>
					
						
					<div class="box" style="margin-bottom: 20px;">
						<div id="tagForm">
							<span id="text1">태그</span>
							<span id="addForm" style="color: #969696;">#</span>
								<input type="text" placeholder="태그와 태그는 쉼표로 구분합니다. (최대 8개)" id="addInput">
									<input type="button" id="addTag" class="b" value="추가">
									
								<div id="tagBox">
									<ul>
										<c:if test="${form eq 'Update'}">
											<c:forEach items="${one.tags }" var="t" varStatus="i">
			
													<div class='tag'  id="uptag${i.index }">
														<li>
															<span class='upColor'>#${t.tag}</span>
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
										<input type="file" id="f" name="img" multiple="multiple" style="display: none;">
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
										<label for="corporation" class="lb">기업명 <span class="star">*</span></label>
										<input type="text"  id="corporation" name="corporation" value="${one.corporation }" placeholder="ex) Together" required="required">
								</div>
								
								<div class="in">
										<label for="phone" class="lb">연락처 <span class="star">*</span></label>
										<input type="tel"  id="phone" name="corporate_phone" value="${one.corporate_phone }" placeholder="ex) 01056807909">
										<input type="button" id="pc" value="번호인증" class="pb b">
								</div>
								
								<div class="in" id="checkBox" style="display: none;">
									<label for="check" class="lb">인증번호입력</label>
									<input type="text" id="check">
									<input type="button" id="checkButton" class="b" value="확인">
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
								<button id="btn" >
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

</body>
</html>