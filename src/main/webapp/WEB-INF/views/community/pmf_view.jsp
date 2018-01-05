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
<link rel="stylesheet" href="../resources/css/pmf/pmf_view_css.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		//clipboard copy
		function copyText(){
			var range = document.createRange();			//range ����
			var referenceNode = document.getElementById("email");
			range.selectNode(referenceNode);					//selectNode
			window.getSelection().addRange(range);		//getSelection�� ���� �߰�
			
			document.execCommand('copy');
		}
		
		$(".clipboard_copy").click(function(event){
			copyText();
		});
		
		
		//map
		
	});

</script>
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
					<td class="t_text" colspan="2">
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
					<td class="t_text" colspan="2">
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
						<td class="t_text" colspan="2">
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
				<input class="delete_btn" type="button" value="����" id="delete_btn">
				<input class="update_btn" type="button" value="����" id="update_btn">
		
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