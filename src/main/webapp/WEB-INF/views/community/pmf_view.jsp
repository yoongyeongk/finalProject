<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		/* $(".clipboard_copy").click(function(event){
			var copyValue = $("#email").text();
			event.copyValue.select();
			
			try{
				document.execCommand("copy");
				alert("copy");
			} catch(err){
				alert("error");
			}
		}) */
		
	})
	function selectElementText(event){
		var range = document.createRange();
		range.selectNodContents(event);
		var selection = window.getSelection();
		selection.removeAllRanges();
		selection.addRange(range);
	}
</script>
<style type="text/css">
*{
	font-family: HanSans;
}
.title{
	text-align: center;
    margin-bottom: 20px;
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
.t_value{
	padding-left: 20px;
	font-size: 13px;
}
.clipboard_copy{
	margin-left: 15px;
}
.update_btn, .delete_btn{
	width: 100px;
    height: 35px;
    font-size: 14px;
    font-weight: 600;
    float: right;
    margin: 0 0 50px 10px;
    color: rgb(255, 255, 255);
    text-align: center;
    border-radius: 4px;
    background-color: rgb(22, 160, 133);
    border: solid 1px rgb(22, 160, 133);
}
.line{
	margin: 0 auto;
	width: 100%;
	border-top: 3px solid #eee;
}

/* reply section */
#reply{
	margin: 0 auto;
    width: 800px;
}
.new_reply{
	width: 800px;
}
.replyzone{
	width: 715px;
    padding: 10px;
    margin: 0px;
    display: inline-block;
    height: 100px !important;
    font-size: 12px;
}
.reply_btn{
	width: 75px;
    height: 100px;
    float: right;
    border: 1px solid #ccc;
    border-radius: 3px;
    color: white;
    font-weight: 600;
    background-color: #ccc;
}
.t_reply{
	border: none;
    margin-top: 30px;
    font-size: 12px;
}
.td_r{
	border: none;
    border-top: solid #eee 1px;
    border-bottom: solid #eee 1px;
    text-align: center;
}
.t_1{
	width: 100px;
}
.t_2{
	width: 600px;
}
.t_3{
	width: 100px;
	text-align: right;
	padding-right: 20px;
}
.reply_add{
	width: 800px;
    margin: 0 auto;
    height: 40px;
    background-color: #eee;
    text-align: center;
    line-height: 40px;
    margin-bottom: 50px;
    font-weight: 600;
}
.reply_add:HOVER {
	border: 2px solid #ddd;
	cursor: pointer;
}
</style>
</head>
<body>
	<h1>pmf board view</h1>
	<!-- header -->
	
	<!-- header �� -->
	
	<section id="main">
	
		<!-- �Խ��� ���� -->	
		<section id="board_sec">
			<h1 class="title">${view.title}</h1>
			
			<table class="t_project">
				<tr>
					<td class="t_title" colspan="2">������Ʈ ����</td>
				</tr>
				<tr>
				<!-- ��з� ���� �� �Һз� ���� �������� ����� -->
					<td class="t_label label1">������Ʈ �о�</td>
					<td class="t_value">${view.major_key} > ${view.sub_key}</td>
				</tr>
				<tr>
					<td class="t_label label1">������Ʈ ��</td>
					<td class="t_value">${view.project_name}</td>
				</tr>
				<tr>
					<td class="t_label label1">�۾� ���� �Ⱓ</td>
					<td class="t_value">${view.start_date} ~ ${view.end_date}</td>
				</tr>
				<tr>
					<td class="t_label" colspan="2">������Ʈ ����</td>
				</tr>
				<tr>
					<td colspan="2">
						${view.project_detail}
					</td>
				</tr>
				<c:if test="${not empty view.fileDTO}">
				<tr>
					<td class="t_label" colspan="2">÷�� ����</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="file_view">
							<c:forEach items="${view.fileDTO}" var="file">
							<a href="../../resources/pmf_file/${file.filename}">${file.oriname}</a>
							</c:forEach>
						</div>
					</td>
				</tr>
				</c:if>
				
				<tr>
					<td class="t_label" colspan="2">������</td>
				</tr>
				<tr>
					<td colspan="2">
						${view.works}
					</td>
				</tr>	
			</table>
					
			<table class="t_workCondition">
				<tr>
					<td class="t_title" colspan="2">�ٹ� ����</td>
				</tr>
				<tr>
					<td class="t_label label1">�ٹ�����</td>
					<td class="t_value">${view.work_kind}</td>
				</tr>
				
				<c:if test="${view.education_level ne ''}">
				<tr>
					<td class="t_label label1">�з�</td>
					<td class="t_value">${view.education_level}</td>
				</tr>
				</c:if>
				
				<c:if test="${view.career ne ''}">
				<tr>
					<td class="t_label label1">���</td>
					<td class="t_value">${view.career}</td>
				</tr>
				</c:if>
				
				<tr>
					<td class="t_label label1">�޿�</td>
					<td class="t_value">
						<c:if test="${view.payment_kind ne '����'}">
							${view.payment_kind} ${view.payment_value} ��
						</c:if>
						<c:if test="${view.payment_kind eq '����'}">
							���� �� ����
						</c:if>
					</td>
				</tr>
			</table>
			
			<c:if test="${not empty view.firm_info || not empty view.addr || not empty view.addr_detail}">
			<table class="t_firmInfo">
				<tr>
					<!-- �ʿ� �� �߰� -->
					<td class="t_title" colspan="2">ȸ��/��ü ����</td>
				</tr>
				<c:if test="${not empty view.firm_info}">
					<tr>
						<td class="t_label" colspan="2">�� ����</td>
					</tr>
					<tr>
						<td colspan="2">
							${view.firm_info}
						</td>
					</tr>
				</c:if>
				
				<c:if test="${not empty view.addr}">
					<tr>
						<!-- �ּ� ã�� -->
						<td class="t_label label1" rowspan="2">���� ����</td>
						<td class="t_value">${view.addr} ${view.addr_detail}</td>
					</tr>
					<tr>
						<td>
							<div class="map_sec">�����ֱ�<!-- map --></div>
						</td>
					</tr>
				</c:if>
			</table>
			</c:if>
				
			<table class="t_contactInfo">
				<tr>
					<td class="t_title" colspan="2">����� ����</td>
				</tr>
				<tr>
					<td class="t_label label1">����� id</td>
					<td class="t_value">
						<!-- ���̵� ���� �� �޽��� ������ / �ּҷϿ� ���� -->
						<a href="#">${view.admin_id}</a>
					</td>	
				</tr>
				<tr>
					<td class="t_label label1">����� email</td>
					<td class="t_value"><span id="email">${view.admin_email}</span><input type="button" class="clipboard_copy" value="Ŭ������ ����"></td>
				</tr>
				<tr>
					<td class="t_label label1">����� �޴��ȣ</td>
					<td class="t_value">${view.admin_phone}</td>
				</tr>
			</table>	
			
			<table class="duration_sec">
				<tr>
					<td class="t_label label1">���� �Ⱓ</td>
					<td class="t_value">
						<c:if test="${view.duration_kind eq '��� ����'}">
							${view.duration_kind}
						</c:if>
						<c:if test="${view.duration_kind ne '��� ����'}">
							${view.duration_end}
						</c:if>
					</td>
				</tr>
			</table>
			
			<c:if test="${not empty view.pmfDocumentDTO}">
			<table class="document_sec">
				<tr>
					<td class="t_title" colspan="2">���� ����</td>
				</tr>
				<tr>
					<td colspan="2">
						<ul>
							<c:forEach items="${view.pmfDocumentDTO}" var="document">
								<li>${document.contents}</li>
							</c:forEach>
						</ul>
					</td>
				</tr>
			</table>
			</c:if>
			
			<!-- ���� �ɱ�: ���̵�� �۾��̰� ���� ���� ���̵��� -->
				<input class="update_btn" type="button" value="����" id="update_btn">
				<input class="delete_btn" type="button" value="����" id="delete_btn">
		
			<!-- ����ư ��Ʈ�� �� ������� �ٲٱ� -->
			<input class="save_btn" type="button" value="���" id="save_btn">
		
			<hr class="line">
		</section>
		<!-- �Խ��� ���� �� -->
		
		
		<section id="reply">
			<div class="new_reply">
				<form action="../reply/pmfReplyWrite" method="post">
					<input type="hidden" name="num" value="${view.num}">
					<input type="hidden" name="writer" value="writer"><!-- ȸ�� ���̵� �������� ���� ��� -->
					<textarea name="contents" class="replyzone form-control" draggable="false">�ñ��� ������ �����Ӱ� �� �ּ���.</textarea>
					<input type="button" class="reply_btn" value="��� ���">
				</form>
			</div>
			<div class="reply_list">
				<table class="t_reply">
					<tr>
						<td class="td_r t_1">writer</td>
						<td class="td_r t_2">contents</td>
						<td class="td_r t_3">OO�� ��</td>
					</tr>
					<tr>
						<td class="td_r t_1">writer</td>
						<td class="td_r t_2">contents</td>
						<td class="td_r t_3">OO�� ��</td>
					</tr>
					<tr>
						<td class="td_r t_1">writer</td>
						<td class="td_r t_2">contents</td>
						<td class="td_r t_3">OO�� ��</td>
					</tr>
					<tr>
						<td class="td_r t_1">writer</td>
						<td class="td_r t_2">contents</td>
						<td class="td_r t_3">OO�� ��</td>
					</tr>
					<tr>
						<td class="td_r t_1">writer</td>
						<td class="td_r t_2">contents</td>
						<td class="td_r t_3">OO�� ��</td>
					</tr>
				</table>
				
				<div class="reply_add">������</div>
			</div>
		</section>
		
	</section>
	
	<!-- footer -->
	<!-- footer �� -->
</body>
</html>