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