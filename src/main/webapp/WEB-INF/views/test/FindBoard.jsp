<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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

var copyBtn = document.querySelector(".btn");	//querySelector

copyBtn.addEventListener('click',function(event){
	var email = document.querySelectior(".emeil");
	var range = document.createRange();			//range 설정
	range.selectNode(email);					//selectNode
	window.getSelection().addRange(range);		//getSelection에 범위 추가
	
	try{
		var successful = document.execCommand('copy');
		var message = successful ? 'successful' : 'unsuccessful';
		alert('copy: '+message);
	} catch(err) {
		alert('fail');
	}
	
	window.getSelection().removeAllRanges();
});

</script>
</head>
<body>
	<p class="email">email test</p>
	<button class="btn">복사</button>	
</body>
</html>