<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>Home</title>
<script type="text/javascript">
	$(function(){
		var drop_sec = $("#dropzone");
		
		
	});
</script>
<style type="text/css">
#dropzone{
	width: 500px;
	height: 100px;
	border: 1px solid #ddd;
	border-radius: 4px;
	background-color: yellow;
	color: gray;
	text-align: center;
	font-size: 20px; 
}
</style>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<h1>drag and drop test2</h1>

<!-- drag zone -->
<div id="dropzone">Drag and Drop Files Here</div>



<a href="test/dadTest">drag and drop</a>
<a href="test/payTest">pay</a>
<a href="test/pdfTest">pdf view</a>
<a href="test/googleTest">google drive</a>

</body>
</html>
