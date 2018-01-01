<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.ckeditor.com/4.8.0/basic/ckeditor.js"></script>
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
	
	//CKEditor
	//name �� DB �׸� �°� �����ϱ�
	CKEDITOR.replace( 'editor1' );
	CKEDITOR.replace( 'editor2' );
	CKEDITOR.replace( 'editor3' );
	CKEDITOR.replace( 'editor4' );
});
</script>
<style type="text/css">
*{
	font-family: HanSans;
}
table{
	border: solid #ccc 1px;
	border-collapse: collapse;
	margin-bottom: 30px;
    width: 800px;
}
td{
	border: solid #ccc 1px;
	height: 35px;
}
#board_sec{
	width: 800px;
    margin: 0 auto;
    margin-top: 25px;
    margin-bottom: 25px;
}
.title{
	width: 720px;
    display: inline-block;
    margin-right: 15px;
    margin-bottom: 40px;
    height: 45px;
    font-size: 18px;
    
}
#tempSave{
	width: 60px;
    height: 30px;
    font-size: 12px;
    font-weight: 600;
    float: right;
    margin: 5px 0;
    color: rgb(255, 255, 255);
    text-align: center;
    border-radius: 4px;
    background-color: rgb(26, 188, 156);
    border: solid 1px rgb(26, 188, 156);
}
.t_title{
	height: 40px;
    text-align: center;
    font-size: 14px;
    font-weight: 600;
    background-color: #eaeaea;
}
.t_label{
	text-align: center;
    height: 35px;
    margin: 10px 0;
    font-size: 13px;
}
.label1{
	width: 150px;
}
.selectBox{
	width: 300px;
	height: 30px;
	margin-left: 2px;
    font-size: 12px;
    display: inline-block;
}
.fRight{
	float: right;
}
.start_date{
	width: 300px;
	height: 30px;
    font-size: 12px;
    display: inline-block;
    margin-right: 15px;
    margin-left: 2px;
}
.end_date{
	width: 300px;
    height: 30px;
    font-size: 12px;
    display: inline-block;
    float: right;
    margin-right: 2px;
}
textarea {
	width: 800px;
	font-size: 12px;
}

/* drag and drop */
#dropzone {
	width: 600px;
	height: 100px;
	border: 1px solid #ddd;
	border-radius: 4px;
	color: gray;
	text-align: center;
	line-height: 100px;
	font-size: 15px;
	margin: 0 auto;
	margin-top: 10px;
	margin-bottom: 10px;
}
.progressBar {
	width: 200px;
	height: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 10px;
	vertical-align: middle;
}
.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 20px;
	font-size: 12px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #0ba1b5;
	border-radius: 3px;
}
.statusbar {
	border-top: 1px solid #A9CCD1;
	min-height: 20px;
	width: 99%;
	vertical-align: middle;
}
.statusbar:nth-child(odd) {
	background: #EBEFF0;
}
.filename {
	display: inline-block;
	vertical-align: middle;
	width: 300px;
	font-size: 12px;
	text-align: center;
}
.filesize {
	display: inline-block;
	vertical-align: middle;
	font-size: 12px;
	text-align: center;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 40px;
}
.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: HanSans;
	font-size: 12px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: middle;
}

/* --------------------------------------- */
.payValue{
	margin-left: 20px;
	width: 300px;
    height: 30px;
    font-size: 12px;
	display: inline-block;
}

.addr{
	width: 550px;
    display: inline-block;
    height: 30px;
    margin-left: 2px;
}
#find_addr{
	float: right;
    margin: 5px 0;
    width: 90px;
    font-size: 12px;
}
.addr_detail{
	width: 550px;
	height: 30px;
	margin-left: 2px;
	font-size: 12px;
}

.submit_btn, .reset_btn{
	width: 100px;
    height: 35px;
    font-size: 14px;
    font-weight: 600;
    float: right;
    margin: 0 0 50px 10px;
    color: rgb(255, 255, 255);
    text-align: center;
    border-radius: 4px;
    background-color: rgb(26, 188, 156);
    border: solid 1px rgb(26, 188, 156);
}
.contact_form{
	width: 99.5%;
	height: 30px;
	font-size: 12px;
	margin-left: 2px;
}
.project_name{
	width: 99.5%;
	height: 30px;
	font-size: 12px;
	margin-left: 2px;
}
.date_select{
	margin-right: 2px;
}
</style>
</head>
<body>
	<h1>member find board</h1>
	<!-- header -->
	
	<!-- header �� -->
	
	<section id="main">
	
		<!-- �Խ��� ���� -->	
		<section id="board_sec">
		<form action="" method="post">
			<input class="title form-control" type="text" placeholder="������Ʈ ���븦 ������ �� �ִ� ������ ����� �ּ���.">
			<input type="button" value="�ӽ�����" id="tempSave">
			
			<table class="t_project">
				<tr>
					<td class="t_title" colspan="2">* ������Ʈ ����</td>
				</tr>
				<tr>
				<!-- ��з� ���� �� �Һз� ���� �������� ����� -->
					<td class="t_label label1">������Ʈ �о�</td>
					<td>
						<select class="form-control selectBox" name="major_key">
							<optgroup label="��з�"></optgroup>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
						<select class="form-control selectBox fRight" name="sub_key">
							<optgroup label="�Һз�"></optgroup>
							<option>a</option>
							<option>b</option>
							<option>c</option>
							<option>d</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="t_label label1">������Ʈ ��</td>
					<td><input type="text" id="project_name" class="project_name form-control"></td>
				</tr>
				<tr>
					<td class="t_label label1">�۾� ���� �Ⱓ</td>
					<td><input type="date" id="" class="start_date form-control"> ~ <input type="date" id="" class="end_date form-control"></td>
				</tr>
				<tr>
					<td class="t_label" colspan="2">������Ʈ ����</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="editor1" rows="10" draggable="false" class="form-control" id="project_detail"></textarea>
					</td>
				</tr>
				<tr>
					<td class="t_label" colspan="2">���� ÷��</td><!-- �巡�׾ص�� �κ� css, js �߰��ϱ� -->
				</tr>
				<tr>
					<td colspan="2">
						<div id="dropzone">���ε��� ������ �巡���� �ּ���.</div>
					</td>
				</tr>
				<tr>
					<td class="t_label" colspan="2">������</td>
				</tr>
				<tr>
					<td colspan="2">
						<!-- ������ �߰� -->
						<textarea name="editor2" rows="10" draggable="false" class="form-control" id="works"></textarea>
					</td>
				</tr>	
			</table>
					
			<table class="t_workCondition">
				<tr>
					<td class="t_title" colspan="2">�ٹ� ����</td>
				</tr>
				<tr>
					<td class="t_label label1">* �ٹ�����</td>
					<td>
						<select class="form-control selectBox" id="work_kind">
							<optgroup label="�ٹ������� ������ �ּ���"></optgroup>
							<option>������</option>
							<option>�����</option>
							<option>�İ�</option>
							<option>��������</option>
							<option>��Ÿ</option>
						</select>
					</td>
				</tr>
				<tr>
				<!-- �з�/��� �ʿ�ø� â �߰��� �� �ֵ��� ��ư ����� -->
					<td class="t_label label1">�з�</td>
					<td>
						<select class="form-control selectBox" id="education_level">
							<option selected="selected">�ʿ� �з��� ������ �ּ���.</option>
							<option>����</option>
							<option>�ʴ���</option>
							<option>����</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="t_label label1">���</td>
					<td>
						<select class="form-control selectBox" id="career">
							<option>�ʿ� ����� ������ �ּ���.</option>
							<option>����</option>
							<option>���</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="t_label label1">* �޿�</td>
					<td style="font-size: 12px">
						<select class="form-control selectBox" id="pay">
							<option>����</option>
							<!-- ��/�� ������ ��� input â �߰� �ϱ� -->
							<option>��</option>
							<option>��</option>
						</select>
						<!-- �ݾ� ���� �ɱ� - �ִ� / �ּҰ� -->
						<input class="form-control payValue" type="number" id="pay_value" maxlength="10" max="99999999999" min="1"> ��
					</td>
				</tr>
			</table>
			
			<table class="t_firmInfo">
				<tr>
					<!-- �ʿ� �� �߰� -->
					<td class="t_title" colspan="2">ȸ��/��ü ����</td>
				</tr>
				<tr>
					<td class="t_label" colspan="2">�� ����</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="editor3" rows="10" draggable="false" class="form-control" id="firm_detail"></textarea>
					</td>
				</tr>
				<tr>
					<!-- �ּ� ã�� -->
					<td class="t_label label1" rowspan="2">���� ����</td>
					<td>
						<!-- �ּ� �˻� API -->
						<input type="text" id="addr" class="addr form-control"><input type="button" id="find_addr" value="�ּ� ã��">
					</td>
				</tr>
				<tr>
					<td>
						<!-- �� �ּ� �Է¶� -->
						<input type="text" id="addr_detail" class="addr_detail form-control" placeholder="�� �ּҸ� �Է��� �ּ���.">
					</td>
				</tr>
			</table>
				
			<table class="t_contactInfo">
				<tr>
					<td class="t_title" colspan="2">* ����� ����</td>
				</tr>
				<tr>
					<td class="t_label label1">����� id</td>
					<td>
						<input type="text" name="contact_id" class="contact_form form-control">
					</td>	
				</tr>
				<tr>
					<td class="t_label label1">����� email</td>
					<td>
						<!-- ����� email - Ŭ������ ���� ���  -->
						<input type="text" class="contact_form form-control">
					</td>
				</tr>
				<tr>
					<td class="t_label label1">����� �޴��ȣ</td>
					<td>
						<!-- ����� �޴��ȣ -->
						<input type="text" class="contact_form form-control">
					</td>
				</tr>
			</table>	
			
			<table class="duration_sec">
				<tr>
					<td class="t_title" colspan="2">* ���� �Ⱓ</td>
				</tr>
				<tr>
					<td class="t_label label1">�Ⱓ ����</td>
					<td>
						<select class="form-control selectBox" id="duration">
							<option>������ ����</option><!-- �Ⱓ ���� �� �߰� â ���� -->
							<option>��� ����</option>
						</select>
						<input type="date" class="date_select selectBox fRight form-control">
					</td>
				</tr>
			</table>
			<table class="document_sec">
				<tr>
					<td class="t_title" colspan="2">���� ����</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="editor4" rows="5" draggable="false" class="form-control" id="document"></textarea>
					</td>
				</tr>
			</table>
			<input class="submit_btn" type="button" value="���" id="submit">
			<input class="reset_btn" type="reset" value="���ۼ�">
		</form>	
		</section>
		<!-- �Խ��� ���� �� -->
		
	</section>
	
	<!-- footer -->
	<!-- footer �� -->
</body>
</html>