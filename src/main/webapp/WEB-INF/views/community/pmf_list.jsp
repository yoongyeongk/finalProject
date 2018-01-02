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
		var message = ${message};
		if(message != ""){
			alert(message);
		}
		
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
	});
</script>
<style type="text/css">
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
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
    border: 1px solid #ccc;
    border-bottom: none;
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
    margin-right: 1px;
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
}

#content_wrap{
	border: 1px solid #ccc;
    width: 800px;
    height: 600px;
    background-color: #ccc;
}
</style>
</head>
<body>
<!-- header -->
<!-- header 끝 -->

<section id="main">
	<a href="./pmfWrite">새 글 등록</a>

	<div class="tab">
		<button class="tablinks" onclick="openList(event, 'London')">London</button>
		<button class="tablinks" onclick="openList(event, 'Paris')">Paris</button>
	</div>

	<div id="content_wrap">
		<div id="London" class="tabcontent">
			<h3>London</h3>
			<p>London is the capital city of England.</p>
		</div>

		<div id="Paris" class="tabcontent">
			<h3>Paris</h3>
			<p>Paris is the capital of France.</p>
		</div>
	</div>
</section>
	
</body>
</html>