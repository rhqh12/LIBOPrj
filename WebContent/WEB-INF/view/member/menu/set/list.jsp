<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width-device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalavble=no">
<meta charset="UTF-8">

<title>메뉴</title>
<style>

#title{
display: none;}
body {
	margin: 0px;
	background: url("../../images/dawn.jpg") repeat-x center;
	width: 100%;
	height: 100%;
	border: 5px solid #00000;
}

#menu-list {
	margin-top: 20px;
	font-family: 돋움, Arial, sans-serif;
	font-size: 12px;
	font-weight: bold;

}

#menu-list >ul {
	margin-top: 20px;
}

#menu-list>ul>li {
	display: block;
	margin-top: 25px;
	border-bottom: 2px solid #aaa;
	padding-bottom: 15px;
	padding-left: 30px;
}

#menu-list>ul>li>a {
	font-family: "맑은 고딕", 고딕, arial, sans-serif;
	font-size: 12px;
	font-weight: bold;
	color: #000000;
	text-decoration: none;
	padding-left: 30px;
}

#bottom-menu {
	position: fixed;
	bottom: 0px;
	left: 0px;
}

#bottom-menu>ul {
	overflow: auto;
}

#bottom-menu>ul>li {
	float: left;
	display: block;
	padding-left: 70px;
}

#header {
	padding-left: 30px;
	margin: 0px;
	position: relative;
}
#header>h1{
padding-left: 30px;
}

#header>ul {
	position: absolute;
	top: 0px;
	left: 0px;
	margin: 0px;
	padding-right: 20px;
}

#header>ul>li {
	display: block;
}

#bottom-menu>h1 {
	display: none;
}

</style>
<link href="../../../css/style.css" type="text/css" rel="stylesheet"/>
</head>

<body id="body">
	<div class="full-screen">
		<header id="header">
		<div class="content-container clearfix">
			<section>
				<h1><a href="">&lt; 설정</a></h1>
			</section>
			<section>
				<div></div>
			</section>
		</div>
	</header>
	<main class="full-container">
		<nav id="menu-list">
			<ul>
				<li><a href="../notice/list">공지사항</a></li>
				<li><a href="../../update.jsp">회원정보 수정</a></li>
			</ul>
		</nav>
		</main>
		<jsp:include page="../../../inc/bottom_menu.jsp"/>
		<h1 id="title">관리자 페이지</h1>
	</div>
</body>
</html>