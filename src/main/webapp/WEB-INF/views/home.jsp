<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="notice/noticeList">notice list</a>
<a href="qna/qnaList">qna list</a>
	<c:if test="${member eq null}">
		<a href="member/memberJoin">join</a>
		<a href="member/memberLogin">login</a>
	</c:if>
	
	<c:if test="${member ne null}">
		<a href="member/memberLogout">logout</a>
	</c:if>
	

	<a href="./trade/tradeBoardList"> T List</a>
	<a href="./trade/tradeBoardWrite">T Write</a>
	<a href="./trade/tradeBoardUpdate?num=7">T Update</a>
</body>
</html>
