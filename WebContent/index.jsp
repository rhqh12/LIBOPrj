<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</style>
<script type="text/javascript">

window.addEventListener("load", function(){
	var txtBox = document.querySelector(".wrapper .txt");
	var text = [];
	text.push("당신과 함께하는 리보입니다.");
	text.push("그럼 지금 바로");
	text.push("리보 서비스를 작동하겠습니다.");

	var count = 0;
	var timerId = setInterval(function(){
		txtBox.innerText = text[count];
		count++;
		if(count == text.length) {
			clearInterval(timerId);
			location.href = "./member/login";
		}
	}, 3000);
})

</script>
</head>
<body>
<div id="body" class="full-screen">
	<div class="flex-container align-items-center">
		<div class="item">
			<div class="wrapper">
				<p class="txt">안녕하세요?</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>