<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>리보</title>
<link href="./css/style.css"type="text/css"rel="stylesheet"/>
<style>
#body {
	padding-bottom:0px;
	background:#4F97D5;
}
#body.on {
	background:#000;
}
#body.on .item p {
	font-size:100px;
}
#greeting {
	display:flex;
	-webkit-flex-wrap: wrap;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
	height:100%;
	align-items: stretch;
}
.item{
	width:100%;
    display: inherit;
    height: auto;
    flex-wrap: wrap;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;    
}
.item p{
	width:100%;
	font-size:20px;
	text-align:center;
	color:#fff;
	
}
.txt span {
	display:block;
}
</style>
<script type="text/javascript">

// window.addEventListener("load", function(){
// 	var txtBox = document.querySelector(".wrapper .txt");
// 	var text = [];
// 	text.push("당신과 함께하는 리보입니다.");
// 	text.push("그럼 지금 바로");
// 	text.push("리보 서비스를 작동하겠습니다.");

// 	var count = 0;
// 	var timerId = setInterval(function(){
// 		txtBox.innerText = text[count];
// 		count++;
// 		if(count == text.length) {
// 			clearInterval(timerId);
// 			location.href = "./member/login";
// 		}
// 	}, 3000);
// })

</script>
<script src="//code.jquery.com/jquery-1.11.3.js"></script>
<script src="./js/speech.js" charset="utf-8"></script>
<script src="./js/index.js" charset="utf-8"></script>
</head>
<body>
<div id="body" class="full-screen">
	<div class="flex-container align-items-center">
		<div class="item">
		
			<div class="wrapper">
				<p class="txt"></p>
			</div>
			<!-- <div id="content">
					<span id="icon-music">♬</span>
				
				  <div class="wrap">
					<p>
							WebRTC 관련 예제로 Speech Recognition API를 활용하면 더 재밌는 기능을 만들 수 있습니다.<br>
							아래 버튼을 누른 후 마이크에 이야기를 해보세요. (마이크와 가까울수록 인식률이 좋습니다)
						</p>
					<div id="result">
					  <span class="final" id="final_span"></span>
					  <span class="interim" id="interim_span"></span>
					</div>
					<button id="btn-mic" class="off">마이크 <span></span></button>
					<button id="btn-tts">Text to speech</button>
					<audio id="audio" src="ending.mp3"></audio>
					
						<div>
						  <button onclick="document.getElementById('audio').play()">Play the Audio</button>
						  <button onclick="document.getElementById('audio').pause()">Pause the Audio</button>
						  <button onclick="document.getElementById('audio').volume+=0.2">Increase Volume</button>
						  <button onclick="document.getElementById('audio').volume-=0.2">Decrease Volume</button>
						</div>
						
						<br><br>
				
						<h3>예약어 (마이크를 켠 상태에서 아래 문자를 읽어보세요)</h3>
						<ul>
							<li>레드, 그린, 옐로우, 오렌지, 그레이, 골드, 블랙</li>
							<li>알람</li>
							<li>노래 켜, 노래 꺼, 음악 켜, 음악 꺼</li>
							<li>볼륨업, 볼륨다운</li>
							<li>스피치, 말해줘</li>
						</ul>
				  </div>
				</div>
		</div> -->
	</div>
</div>
</body>
</html>