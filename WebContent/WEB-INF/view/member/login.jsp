<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ctx = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link href="<%=ctx%>/css/style.css" type="text/css" rel="stylesheet" />
<title>로그인 페이지</title>
<script src="../js/utils.js"></script>
</head>
<script>
/* 
var flag = "${flag}"
alert(flag);
 */
</script>
<style>
@keyframes move-libo{
	from{
		transform: translateY(0px);
	}
	to{
		transform: translateY(-60px);
	}
}
@keyframes size-shadow {
	from{
		width:40px;
		height:10px;
	}
	to{
		width:20px;
		height:5px;
	}
}
#title {
	display: none;
}

#body {
	padding-bottom: 0px;
	background: #4F97D5;
}

#buttons>ul>li>a {
	text-decoration: none;
	border: 1px ridge #000;
	display: flex;
	background: #fff;
	padding: 5px;
}

#buttons>ul>li {
	padding-top: 20px;
	display: inline-block;
}
.login-box > div {
	border:1px solid #555;
	background:#fff;
	margin:5px 0px;
}
.login-box input {
	width: 100%;
	height: 33px;
	padding:2%;
	border:none;
	box-sizing: border-box;
}
.login-button {
	display:block;
    font-size: 18px;
    font-weight: 700;
    line-height: 45px;
    display: block;
    width: 100%;
    height: 45px;
    margin: 10px 0px;
    cursor: pointer;
    text-align: center;
    color: #fff;
    -webkit-appearance: none;

	background:linear-gradient(to bottom, #a73f2d 5%, #b34332 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#a73f2d', endColorstr='#b34332',GradientType=0);
	background-color:#a73f2d;
	border:1px solid #241d13; 

}
.login-button:hover{
	background:linear-gradient(to bottom, #b34332 5%, #a73f2d 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#b34332', endColorstr='#a73f2d',GradientType=0);
	background-color:#b34332; 
}
.login-msg {
	margin-bottom:10px;
	color:#ff5c43;
	text-shadow: 1px 1px #333;
}
#libo {
	margin-bottom:10px;
}
.logo {
	width:200px;
    margin: 0% auto 15px;
    padding: 10px 0px;
    background: #fff;
    height: 195px;	
}
.logo.on {
}
.logo.on #libo {
	animation: move-libo 400ms ease backwards;
}
.logo .shadow {
    width: 40px;
    height: 10px;
    margin:0% auto;
    background: #999;
    border-radius: 100%;
    border: 1px solid #888;
}
.logo.on .shadow {
	animation: size-shadow 400ms ease backwards;
}

.infoEx {
	color:#fff;
}
.infoEx a {
	padding:0px 5px;
	font-size:15px;
	color:#fff;
}

</style>
<body>
	<div id="body" class="full-screen">
		<div class="flex-container align-items-center">
			<div class="item">
				<div class="wrapper">
					<main id="main">
						<h1 id="title">로그인 페이지</h1>
						<div class="logo">
							<svg id="libo" viewBox="-65 25 250 190" xmlns="http://www.w3.org/2000/svg">
								<g class="arm" transform="rotate(30)"> 
									<rect x="66" y="75" rx="0" ry="0" width="8" height="55" fill="#c4edff" stroke="#6481b0" stroke-width="1"></rect>
								</g>
								<g class="arm" transform="rotate(-30)">
									<rect x="30" y="130" rx="0" ry="0" width="8" height="55" fill="#c4edff" stroke="#6481b0" stroke-width="1"></rect>
								</g>								
								<path d="M10,140 C10,50 110,50 110,140" fill="#c4edff" stroke="#6481b0" stroke-width="1" />
								<path d="M10,140 C10,230 110,230 110,140" fill="#c4edff" stroke="#6481b0" stroke-width="1" />
								<circle cx="60" cy="60" r="30" fill="#c4edff" stroke="#6481b0" stroke-width="1" />
							</svg>
							<div class="shadow"></div>		
						</div>
						<p class="login-msg"></p>
						<form action="login" method="post" id="login-form">
							<div class="login-box">
								<div><input type="text" name="id" placeholder="아이디를 입력하세요." value="" required autocomplete=off /></div>
								<div><input type="password" name="pw" placeholder="비밀번호를 입력하세요." value="" required /></div>
							</div>
							<div><input type="submit" value="로그인" class="login-button" /></div>
						</form>
						<div class="infoEx">
							<a href="join">회원가입</a><a href="find">ID/PW 찾기</a>
						</div>	
					</main>
				</div>
			</div>
		</div>
	</div>

<script src="../js/member/login.js"></script>	
</body>
</html>