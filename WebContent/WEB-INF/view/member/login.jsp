<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ctx = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=ctx%>/css/style.css" type="text/css" rel="stylesheet" />
<title>로그인 페이지</title>
</head>
<script>

var flag = "${flag}"
alert(flag);

</script>
<style>
#title {
	display: none;
}

/* #main>p {
text-align: center;
position: absolute;
top: 50%;
left: 50%;
font-family: 돋움, Arial, sans-serif;
font-size: 15px;
font-weight: bold;
color: #fff;
display: flex;
flex-flow:  */
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

input[type="text"] {
	border: none;
	box-sizing: border-box;
	flex-grow: 1;
	width: 100%;
	height: 100%;
}

input[type="password"] {
	border: none;
	box-sizing: border-box;
	flex-grow: 1;
	width: 100%;
	height: 100%;
}
.login-button{
top: 0%;
right: 0px;
width: 100%;
height: 100%;

}
.loginBox{
position: relative;
width: 100%;
height: 100%;
}

#text-box div {
}

#libo {
	padding-bottom: 15px;
}
.infoEx{
font-size: 12px;
font-family: 돋움, Arial. sans-serif;
font-weight: lighter;
}
.infoEx a:last-child {
	padding-left: 20px;
}
</style>
<body>
	<div id="body" class="full-screen">
		<div class="flex-container align-items-center">
			<div class="item">
				<div class="wrapper">
					<main id="main">
					<h1 id="title">로그인 페이지</h1>
					<h1 id="libo">
						<img src="<%=ctx%>/images/libo_icon.png" alt="리보로고" />
					</h1>
					<div id="text-box">
						<form method="post">
						<div class="loginBox">
						<form action="login" method="post">
							<div>
								<input type="text" name="id" placeholder="아이디를 입력하세요." value="" />
							</div>
							<div>
								<input type="password" name="pw" placeholder="비밀번호를 입력하세요."
									value="" />
							</div>
							<div>
							<input class="login-button" type="submit" value="로그인"/>
							</div>
							</form>
							</div>
							<div class="infoEx">
								<a href="join">회원가입</a>
								<a href="find">ID/PW 찾기</a>
							</div>
						</form>
					</div>
					</main>
				</div>
			</div>
		</div>
	</div>
</body>
</html>