<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		var message = '${message}';
		if(message != ""){
			alert(message);
		}
	});
	
	function openList(evt, cityName) {
	    var i, tabcontent, tablinks;
	    tabcontent = document.getElementsByClassName("tabcontent");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	    }
	    tablinks = document.getElementsByClassName("tablinks");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].className = tablinks[i].className.replace(" active", "");
	    }
	    document.getElementById(cityName).style.display = "block";
	    evt.currentTarget.className += " active";
	}
</script>
<style type="text/css">
body{
	font-family: HanSans;
	opacity: 0.9;
}
.list_wrap{
	margin: 0 auto;
	margin-top: 50px;
	width: 1000px;
}
.new{
	width: 80px;
	height: 30px;
	float: right;
	text-align: center;
	line-height: 30px;
	font-size: 12px;
	font-weight: 600;
	color: white;
	margin-bottom: 20px;
	background-color: rgb(26, 188, 156);
    border: solid 1px rgb(26, 188, 156);
    border-radius: 4px;
}
a:hover{
	text-decoration: none;
	color: white;
}
/* Style the tab */
.tab {
    overflow: hidden;
}

/* Style the buttons inside the tab */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    width: 100px;
    padding: 10px;
    transition: 0.3s;
    font-size: 17px;
    font-weight: 600;
    border: 1px solid #cccccc38;
    border-bottom: none;
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
    margin-right: 1px;
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #cccccc38;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #cccccc38;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
}

#content_wrap{
    width: 100%;
    height: 600px;
    background-color: #cccccc38;
}

/* pmf list div */
#search_bar{
	text-align: center;
    margin-top: 30px;
}
#listCall{
	padding-top: 30px;
}

.t_list{
	border: solid 1px #ccc;
	border-left: none;
	border-right: none;
	width: 900px;
	margin: 0 auto;
	border-collapse: collapse;
}
.t_list th,.t_list td{
	border: solid 1px #ccc;
	border-left: none;
	border-right: none;
	text-align: center; 
	vertical-align: middle;
}
.t_list td{
	height: 35px;
}
.t_list th{
	height: 40px;
	background-color: white;
}
.td_1{
	width: 50px;
}
.td_2{
	width: 120px;
}
.td_3{
	width: 350px;
}
.td_4{
	width: 120px;
}
.td_5{
	width: 120px;
}
.td_6{
	width: 70px;
}
.td_7{
	width: 90px;
}
.td_8{
	width: 50px;
}
/* myMenu div */
#btn_wrap{
	text-align: right;
    padding-right: 15px;
    margin-bottom: 10px;
}
.compare_btn{
	width: 100px;
    height: 40px;
    border-radius: 3px;
    background-color: rgb(94, 94, 94);
    border: 1px solid rgb(94, 94, 94);
    color: white;
    font-weight: 600;
}
.wrap_total{
	width: 300px;
    background-color: rgba(26, 188, 156, 0.39);
    border-radius: 3px;
    height: 120px;
    margin: 20px 12px;
    float: left;
}
.wrap_1{
	width: 80px;
    height: 100%;
    display: inline-block;
    padding: 10px 5px 10px 10px;
    float: left;
}
.image{
	background-color: white;
    width: 60px;
    height: 60px;
    margin-top: 15px;
    margin-bottom: 5px;
}
.d-day{
    text-align: left;
    font-size: 11px;
}
.wrap_2{
	width: 220px;
    height: 100%;
    display: inline-block;
    float: right;
    padding-left: 15px;	
}
.project_title{
	font-size: 15px;
    font-weight: 600;
    margin-top: 8px;
    margin-bottom: 18px;
    text-align: center;
}
.works_list ul{
	-webkit-padding-start: 25px;
    -webkit-margin-before: -10px;
    -webkit-margin-after: 5px;
}
.works_list li{
	margin-bottom: 5px;
}
.tag_list{
	font-size: 13px;
}
</style>
</head>
<body>
<!-- header -->
<!-- header �� -->

	<section id="main">
		<div class="list_wrap">
			<a href="./pmfWrite" class="new">�� �� ���</a>

			<div class="tab">
				<button class="tablinks active"
					onclick="openList(event, 'pmfList')">��� ����</button>
				<button class="tablinks" onclick="openList(event, 'myMenu')">����
					�޴�</button>
			</div>

			<div id="content_wrap">
				<div id="pmfList" class="tabcontent">
					<p>�˻� / ��� ���� �� ����Ʈ / ��� ��ư / ����¡</p>
					<div id="pmfList_sec">
						<div id="search_bar">
							<select name="kind">
								<option>��ü</option>
								<!-- tags, title, major_key, sub_key, works... -->
								<option>����</option>
								<!-- title -->
								<option>������Ʈ ����</option>
								<!-- major_key -->
							</select> <input type="text" class="search" name="search"> <input
								type="button" class="search_btn" value="�˻�">
						</div>
						<div id="listCall">
							<!-- Ȯ�ο� - ���̾ƿ� Ȯ�� �� listTable�� �ű�� -->
								<table class="t_list">
									<tr>
										<th class="td_1"><input type="checkbox" id="total_ch" class="save_ch"></th>
										<th class="td_2">������Ʈ ��</th>
										<th class="td_3">����</th>
										<th class="td_4">�������</th>
										<th class="td_5">������Ʈ ����</th>
										<th class="td_6">������</th>
										<th class="td_7">���� ����</th>
										<th class="td_8">��ȸ��</th>
									</tr>
									<tr>
										<td><input type="checkbox" class="save_ch"></td>
										<td>������Ʈ ��</td>
										<td>����</td>
										<td>�������</td>
										<td>������Ʈ ����</td>
										<td>������</td>
										<td>���� ����</td>
										<td>��ȸ��</td>
									</tr>
								</table>
							<!-- ������� -->
						</div>
					</div>
				</div>

				<div id="myMenu" class="tabcontent">
					<p>���� ��ũ��</p>
					<div id="myMenu_sec">
						<div id="btn_wrap">
							<input type="button" class="compare_btn" value="���ϱ�">
						</div>
						<div id="saveCall">
						
							<!-- Ȯ�ο� - ���̾ƿ� Ȯ�� �� listBox�� �ű�� -->
							<div class="wrap_total">
								<div class="wrap_1">
									<div class="image">�̹���</div>
									<p class="d-day">D-O</p>
								</div>
								<div class="wrap_2">
									<p class="project_title">project name</p>
									<div class="works_list">
										<ul>
											<li>list1</li>
											<li>list2</li>
										</ul>
									</div>
									<div class="tags_list">
										<%-- <c:forEach items="" var="tag"> --%>
										<a href="#">#tag1</a> <a href="#">#tag2</a>
										<%-- </c:forEach>  --%>
									</div>
								</div>
							</div>
							
							<div class="wrap_total">
								<div class="wrap_1">
									<div class="image">�̹���</div>
									<p class="d-day">D-O</p>
								</div>
								<div class="wrap_2">
									<p class="project_title">project name</p>
									<div class="works_list">
										<ul>
											<li>list1</li>
											<li>list2</li>
										</ul>
									</div>
									<div class="tags_list">
										<%-- <c:forEach items="" var="tag"> --%>
										<a href="#">#tag1</a> <a href="#">#tag2</a>
										<%-- </c:forEach>  --%>
									</div>
								</div>
							</div>
							
							<div class="wrap_total">
								<div class="wrap_1">
									<div class="image">�̹���</div>
									<p class="d-day">D-O</p>
								</div>
								<div class="wrap_2">
									<p class="project_title">project name</p>
									<div class="works_list">
										<ul>
											<li>list1</li>
											<li>list2</li>
										</ul>
									</div>
									<div class="tags_list">
										<%-- <c:forEach items="" var="tag"> --%>
										<a href="#">#tag1</a> <a href="#">#tag2</a>
										<%-- </c:forEach>  --%>
									</div>
								</div>
							</div>
							<!-- ������� -->
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>