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
	text-align:center;
	
}
</style>
</head>
<body>
<div id="body" class="full-screen">
	<div class="flex-container align-items-center">
		<div class="item">
			<div class="wrapper">
				<p>안녕하세요? 당신과 함께하는 리보입니다.</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>