<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>Home</title>
<script type="text/javascript">
	$(function(){
		var drop_sec = $("#dropzone");
		
		function fileUpload(files){
			var formdata = new FormData();
			
			for(var i=0; i<files.length; i++){
				formdata.append('file',files[i]);	//formdata에 받은 파일을 하나씩 추가하기(name,value)
			}
			
			$.ajax({
				type: 'POST',
				url: '../test/fileUpload',
				data: formdata,
				dataType: 'json',
				contentType: false,
				processData: false,
				success: function(data){
					$(drop_sec).html(data.oriname);
					$(drop_sec).html(data.filename);
				}
			})
		}
		
		$(drop_sec).on({
			dragenter: function(event){
				event.stopPropagation();
				event.preventDefault();
				$(this).css("border","2px solid gray");
			},
			dragleave: function(event){
				event.stopPropagation();
				event.preventDefault();
				$(this).css("border","1px solid #ddd");
			},
			dragover: function(event){
				event.stopPropagation();
				event.preventDefault();
			},
			drop: function(event){
				event.preventDefault();	//자동으로 파일 실행하는 것 없애기
				$(this).css("border","1px solid #ddd");
				var files = event.originalEvent.dataTransfer.files;
				
				if(files.length > 0){
					//fileUpload
					fileUpload(files);
				}
			}
		})
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
