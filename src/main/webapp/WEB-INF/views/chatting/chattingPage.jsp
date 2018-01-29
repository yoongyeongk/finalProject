<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<script type="text/javascript">
		function send_message(){
			websocket = new WebSocket("ws://localhost:808/finalProject");
			websocket.onopen = function(evt){
				onOpen(evt);
			};
			websocket.onmessage = function(evt){
				onMessage(evt);
			};
			websocket.onerror = function(evt){
				onError(evt);
			};
		}
		
		function onOpen(evt){
			writeToScreen("Websocket connected.");
			doSend($("#message").val());
		}
		function onMessage(evt){
			writeToScreen("메시지 수신 : " + evt.data);
		}
		function onError(evt){
			writeToScreen("Error : " + evt.data);
		}
		function doSend(message){
			writeToScreen("메시지 송신 : " + message);
			websocket.send(message);
		}
		function writeToScreen(message){
			$("#outputDiv").append("<p>" + message + "</p>");
		}
	</script>

	<form>
		<div>
			<input type="text" id="message" name="message">
			<input type="button" value="Send" onclick="send_message()"><br>
		</div>
		<div id="outputDiv"></div>
	</form>
		
</body>
</html>