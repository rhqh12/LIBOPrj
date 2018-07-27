<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>메뉴</title>
<style>
body {
	margin: 0px;
	background: url("../../images/dawn.jpg") no-repeat center;
	width: 100%;
	height: 100%;
	border: 1px solid #8CBA34;
	
}

#main>ul>li {
	display: block;
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
#header{
padding-left: 30px;
margin: 0px;
position: relative;
}
#header>ul{
position: absolute;
top : 0px;
left : 0px;
margin:0px;
padding: 0px;
}
#header>ul>li{
display: block;
}




</style>

</head>
<body id="body">
	<header id="header">
		<h1>메뉴</h1>
		<ul>
			<li><a href="../">뒤로</a></li>
		</ul>
	</header>
	<nav id="main">
	<ul>
		<li><a href="./set/list.html">설정</a></li>
		<li><a href="./notice/list.html">공지사항</a></li>
		</ul>
	</nav>
	<aside id="bottom-menu">
		<h1>하단메뉴</h1>
		<ul>
			<li><a href="../index.jsp">홈</a></li>
			<li><a href="../course/list.jsp">경로</a></li>
			<li><a href="../alert/list.jsp">알람</a></li>
			<li><a href="set/list.jsp">설정</a></li>
		</ul>
	</aside>
</body>
</html>