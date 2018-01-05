<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://cdn.ckeditor.com/4.8.0/basic/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		CKEDITOR.replace( 'editor1' );
	});
</script>
</head>
<body>
	<form action="./pdfTest" method="post">
	<textarea name="editor1" rows="10" cols="10">
		
	</textarea>
	<button>submit</button>
	</form>
	<c:if test="${not empty result}">
		${result}
	</c:if>
</body>
</html>