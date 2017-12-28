<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		
		function fileUpload(files, drop_sec){
			var formdata = new FormData();
			
			for(var i=0; i<files.length; i++){
				formdata.append('file',files[i]);	//formdata�� ���� ������ �ϳ��� �߰��ϱ�(name,value)
			
			//progress bar ����
			var status = new createStatusbar(drop_sec);
			status.setFileNameSize(files[i].name, files[i].size);
			sendFileToServer(formdata,status);
			}
		}
		
		function sendFileToServer(formdata,status){
			//���� ������ ���� �� ����
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
				url: './fileUpload',
				data: formdata,
				contentType: false,
				processData: false,
				success: function(data){
					status.setProgress(100);
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
			this.abort = $("<div class='abort'>����</div>").appendTo(this.statusbar);
			
			drop_sec.after(this.statusbar);
			
			//���� �̸��� ����� ���ϴ� �޼���
			this.setFileNameSize = function(name,size){
				var sizeStr = "";
				var sizeKB = size/1024;
				if(parseInt(sizeKB) > 1024){
					var sizeMB = sizeKB/1024;	//1024KB���� Ŭ �� MB�� ��ȯ�ϱ�
					sizeStr = sizeMB.toFixed(2)+" MB";
				}else{
					sizeStr = sizeKB.toFixed(2)+" KB";
				}
				
				this.filename.html(name);
				this.size.html(sizeStr);
			}
			
			//progress bar�� �����ϴ� �޼���
			this.setProgress = function(progress){
				var progressBarWidth = progress*this.progressBar.width()/100;
				this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
				if(parseInt(progress) >= 100){
					this.abort.hide();
				}
			}
			
			//���� ������ �����ϴ� �޼���
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
				event.preventDefault();	//�ڵ����� ���� �����ϴ� �� ���ֱ�
				$(this).css("border","1px solid #ddd");
				var files = event.originalEvent.dataTransfer.files;
				
				if(files.length > 0){
					//fileUpload
					fileUpload(files, drop_sec);
				}
			}
		})
	});
</script>
<style type="text/css">
#dropzone {
	width: 500px;
	height: 100px;
	border: 1px solid #ddd;
	border-radius: 4px;
	color: gray;
	text-align: center;
	line-height: 100px;
	font-size: 20px;
}

.progressBar {
	width: 200px;
	height: 22px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 0px 10px 5px 5px;
	vertical-align: top;
}

.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 22px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #0ba1b5;
	border-radius: 3px;
}

.statusbar {
	border-top: 1px solid #A9CCD1;
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 250px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 13px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: top
}
</style>
</head>
<body>

	<h1>drag and drop</h1>
		
	<!-- drag zone -->
	<div id="dropzone">���ε��� ������ �巡�� �� �ּ���.</div>
	
</body>
</html>