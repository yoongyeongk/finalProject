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
		<input type="button" value="�ӽ�����" id="tempSave">
		<table class="t1">
			<tr>
				<td><input class="form-control" type="text" placeholder="������Ʈ ���븦 ������ �� �ִ� ������ ��� �� �ּ���."></td>
			</tr>

			<tr>
				<td class="t_label">������Ʈ �о�</td>
				<td>
					<select name="major_key">
						<optgroup label="��з�"></optgroup>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
				</td>
				<td>
					<select name="sub_key">
						<optgroup label="�Һз�"></optgroup>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
					</select>
				</td>
			</tr>

			<tr>
				<td>������</td>
			</tr>
			<tr>
				<td><textarea id="works"></textarea></td>
			</tr>
			<tr>
				<td>������Ʈ ��</td>
				<td><input type="text" id="project_name"></td>
			</tr>
			<tr>
				<td>�۾� ���� �Ⱓ</td>
				<td></td>
			</tr>
			<tr>
				<td>������Ʈ ����</td>
				<td><textarea id="project_detail"></textarea></td>
			</tr>
			<tr>
				<td>���� ÷��</td>
				<td><div id="dropzone">���ε��� ������ �巡�� �� �ּ���.</div></td>
			</tr>
			<tr>
				<td>�ٹ�����</td>
				<td>
					<select>
						<optgroup label="�ٹ������� ������ �ּ���"></optgroup>
						<option>������</option>
						<option>�İ�</option>
						<option>�����</option>
						<option>������</option>
						<option>��Ÿ</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>�з�(����)</td>
				<td>
					<select id="education_level">
						<option selected="selected">�ʿ� �з��� ������ �ּ���.</option>
						<option>����</option>
						<option>�ʴ���</option>
						<option>����</option>
					</select>
				</td>
				<td>���</td>
				<td>
					<select id="career">
						<option>�ʿ� ����� ������ �ּ���.</option>
						<option>����</option>
						<option>���</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>�޿�</td>
				<td>
					<select id="pay">
						<option>����</option>
						<option>��</option>
						<option>��</option>
					</select>
					<input type="number" id="pay_value"> ��
				</td>
			</tr>
		</table>
		<input type="button" value="���" id="submit">
		<input type="reset" value="���ۼ�">
	</form>	
	
</body>
</html>