<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.min.js"></script>

</head>
<body>
	<h1>${msg}</h1>
	<form>
		<!-- 송신 메시지를 작성하는 텍스트 박스 -->
		<input id="textMessage" type="text">
		<!-- 메시지 송신을 하는 버튼 -->
		<input onclick="sendMessage()" value="Sehnd" type="button">
		<!-- WebSocket 접속 종료하는 버튼 -->
		<input onclick="disconnect()" value="Disconnect" type="button">
	</form>
	<br />
	<!-- 콘솔 메시지의 역할을 하는 로그 텍스트 에리어.(수신 메시지도 표시한다.) -->

	<div style="width: 800px">
		<canvas id="myChart"></canvas>

	</div>

	<textarea id="messageTextArea" rows="10" cols="110"></textarea>
	<script type="text/javascript">
		// 「WebSocketEx」는 프로젝트 명
		// 「websocket」는 호스트 명
		// WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)
		var webSocket = new WebSocket("ws://localhost:8080/web/websocket");
		
		// 콘솔 텍스트 에리어 오브젝트
		var messageTextArea = document.getElementById("messageTextArea");
		// WebSocket 서버와 접속이 되면 호출되는 함수
		webSocket.onopen = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += "Server connect...\n";
		};
		// WebSocket 서버와 접속이 끊기면 호출되는 함수
		webSocket.onclose = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += "Server Disconnect...\n";
		};
		// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
		webSocket.onerror = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += "error...\n";
		};
		// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
		webSocket.onmessage = function(message) {
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += "Recieve From Server => " + message.data
					+ "\n";

			//라벨추가
			config.data.labels.push('data' + config.data.labels.length)
			
			
			const obj = JSON.parse(message.data);


			//데이터셋 수 만큼 반복
			var dataset = config.data.datasets;
			if(dataset[0].data.length>20){
				config.data.labels.shift();
				dataset[0].data.shift();
				dataset[1].data.shift();
				
			}
			
			dataset[0].data.push(Math.floor(obj.temp));
			dataset[1].data.push(Math.floor(obj.hit));
/* 			for (var i = 0; i < dataset.length; i++) {
				//데이터셋의 데이터 추가
				dataset[i].data.push(Math.floor(obj.temp));
			} */
			myChart.update(); //차트 업데이트

		};
		// Send 버튼을 누르면 호출되는 함수
		function sendMessage() {
			// 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득한다.
			var message = document.getElementById("textMessage");
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += "Send to Server => " + message.value
					+ "\n";
			// WebSocket 서버에 메시지를 송신한다.
			webSocket.send(message.value);
			// 송신 메시지를 작성하는 텍스트 박스를 초기화한다.
			message.value = "";
		}
		// Disconnect 버튼을 누르면 호출되는 함수
		function disconnect() {
			// WebSocket 접속 해제
			webSocket.close();
		}
	</script>




	<script>
		// 우선 컨텍스트를 가져옵니다. 
		var ctx = document.getElementById("myChart").getContext('2d');
		/*
		 - Chart를 생성하면서, 
		 - ctx를 첫번째 argument로 넘겨주고, 
		 - 두번째 argument로 그림을 그릴때 필요한 요소들을 모두 넘겨줍니다. 
		 */
		var config = {
			type : 'line',
			data : {
				labels : [ // Date Objects
				'data1', 'data2', 'data3', 'data4', 'data5', 'data6', 'data7' ],
				datasets : [
						{
							label : 'Temp',
							backgroundColor : 'rgba(75, 192, 192, 1)',
							borderColor : 'rgba(75, 192, 192, 1)',
							fill : false,
							data : [ Math.floor(Math.random() * 50),
									Math.floor(Math.random() * 50),
									Math.floor(Math.random() * 50),
									Math.floor(Math.random() * 50),
									Math.floor(Math.random() * 50),
									Math.floor(Math.random() * 50),
									Math.floor(Math.random() * 50) ],
						},
						{
							label : 'Hit',
							backgroundColor : 'rgba(255, 99, 132, 1)',
							borderColor : 'rgba(255, 99, 132, 1)',
							fill : false,
							data : [ Math.floor(Math.random() * 50),
									Math.floor(Math.random() * 50),
									Math.floor(Math.random() * 50),
									Math.floor(Math.random() * 50),
									Math.floor(Math.random() * 50),
									Math.floor(Math.random() * 50),
									Math.floor(Math.random() * 50) ],
						} ]
			},
			options : {
				maintainAspectRatio : false,
				title : {
					text : 'Chart.js Time Scale'
				},
				scales : {
					yAxes : [ {
						scaleLabel : {
							display : true,
							labelString : '차트'
						}
					} ]
				},
			}
		};

		var myChart = new Chart(ctx, config);
	</script>

</body>
</html>