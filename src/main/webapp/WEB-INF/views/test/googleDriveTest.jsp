 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
/* function getSelectionText(){
	var selectedText = "";
	if(window.getSelection){
		selectedText = window.getSelection().toString();
	}
	return selectedText;
}

document.addEventListener("mouseup", function(){
	var thetext = getSelectionText();
	if(thetext.length > 0){
		alert(thetext);
	}
}, false)

function selectElementText(event){
	var range = document.createRange();
	range.selectNodContents(event);
	var selection = window.getSelection();
	selection.removeAllRanges();
	selection.addRange(range);
} */
window.onload = function(){
	/* var copyBtn = document.querySelector(".btn");	//querySelector

	copyBtn.addEventListener('click',function(event){
		var range = document.createRange();			//range 설정
		var referenceNode = document.getElementsByClassName("email").item(0);
		range.selectNode(referenceNode);					//selectNode
		window.getSelection().addRange(range);		//getSelection에 범위 추가
		
		document.execCommand('copy');
		/* try{
			var successful = 
			var message = successful ? 'successful' : 'unsuccessful';
			alert('copy: '+message);
		} catch(err) {
			alert('fail');
		} */
		
		//window.getSelection().removeAllRanges();
	//});	 */
	
	function copyText(){
		var range = document.createRange();			//range 설정
		var referenceNode = document.getElementsByClassName("email").item(0);
		range.selectNode(referenceNode);					//selectNode
		window.getSelection().addRange(range);		//getSelection에 범위 추가
		
		document.execCommand('copy');
	}
	
	var copyBtn = $(".btn");
	
	$(copyBtn).click(function(event){
		copyText();
	})
}


</script>
</head>
<body>
	<p class="email">email test</p>
	<button class="btn">복사</button>	
</body>
</html>