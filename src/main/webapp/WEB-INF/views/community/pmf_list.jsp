<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		var message = ${message};
		if(message != ""){
			alert(message);
		}
	});
</script>
</head>
<body>
	<a href="./pmfWrite">새 글 등록</a>

</body>
</html>