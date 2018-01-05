 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
			$.ajax({
				type:'POST',
				url: '../pmf/majorKey',
				dataType: 'json',
				success: function(data){
					alert(data.length);
					
				}
			});
	});
</script>
</head>
<body>
	<select id="major_key">
	
	</select>
</body>
</html>