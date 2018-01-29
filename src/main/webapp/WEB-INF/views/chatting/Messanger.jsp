<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/Messanger.css"/>">

<title>Messanger</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

	function saveTextAsFile()
	{
		var textToWrite = document.getElementById("messageArea").value;
		var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
		var fileNameToSaveAs = document.getElementById("inputFileNameToSaveAs").value;
		var downloadLink = document.createElement("a");
		downloadLink.download = fileNameToSaveAs;
		downloadLink.innerHTML = "Download File";

		if (window.URL != null)
		{
			downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
		}
		else
		{
			downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
			downloadLink.onclick = destroyClickedElement;
			downloadLink.style.display = "none";
			document.body.appendChild(downloadLink);
		}
		downloadLink.click();
	}

	function destroyClickedElement(event)
	{
		document.body.removeChild(event.target);
	}

	function loadFileAsText()
	{
		var fileToLoad = document.getElementById("fileToLoad").files[0];
		var fileReader = new FileReader();
		fileReader.onload = function(fileLoadedEvent) 
		{
			var textFromFileLoaded = fileLoadedEvent.target.result;
			document.getElementById("messageArea").value = textFromFileLoaded;
		};
		fileReader.readAsText(fileToLoad, "UTF-8");
	}

</script>
</head>
<body>
	<noscript>
      <h2>Sorry! Your browser doesn't support Javascript</h2>
    </noscript>

    <div id="username-page">
        <div class="username-page-container">
            <h1 class="title">Type your username</h1>
            <form id="usernameForm" name="usernameForm">
                <div class="form-group">
                    <input type="text" id="name" value="${user.nickname}" autocomplete="off" class="form-control" readonly="readonly">
                </div>
                <div class="form-group">
                    <button type="submit" class="accent username-submit">Start Chatting</button>
                </div>
            </form>
        </div>
    </div>

    <div id="chat-page" class="hidden">
        <div class="chat-container">
            <div class="chat-header">
                <h2>M E S S A N G E R</h2>
            </div>
            <div class="connecting">
                Connecting...
            </div>
            <ul id="messageArea">
            </ul>
            <form id="messageForm" name="messageForm">
                <div class="form-group">
                    <div class="input-group clearfix">
                        <input type="text" id="message" placeholder="Type a message..." autocomplete="off" class="form-control"/>
                        <button type="submit" class="primary">Send</button>
                    </div>
                </div >
            </form>
        </div>
        <div class="form-group">
			<div class="input-group clearfix">
				<input type="text" id="inputFileNameToSaveAs" autocomplete="off" class="form-control"/>
				<input type="button" id="savelog" name="savelog" class="btn btn-primary" value="Save Log" onclick="saveTextAsFile()"/>
			</div>
		</div>
    </div>
	
	<script type="text/javascript" src="<c:url value="/resources/js/sockjs.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/stomp.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/main.js"/>"></script>
</body>
</html>