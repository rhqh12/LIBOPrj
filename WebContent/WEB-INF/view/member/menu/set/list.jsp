<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width-device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalavble=no">
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../../../css/style.css">
<title>메뉴</title>
<style>
#menu-list {
	font-family: 돋움, Arial, sans-serif;
	font-size: 12px;
	font-weight: bold;
}

#menu-list>ul>li {
	display: block;
	padding: 25px 0px;
	padding-left: 15px;
	border-bottom: 2px solid #aaa;
}

#menu-list>ul>li>a {
	font-family: "맑은 고딕", 고딕, arial, sans-serif;
	font-size: 1.5em;
	font-weight: bold;
	color: #454e57;
	text-decoration: none;
	padding-left: 15px;
}
</style>
</head>
<div id="body" class="full-screen bg-morning">
	<!-- header 영역 -->
	<header id="header">
		<div class="content-container">
			<section class="title">
				<h1>
					<a href="#" onClick="history.go(-1)">&lt; 설정</a>
				</h1>
			</section>
		</div>
	</header>
	<div class="full-container bg-white">
		<main id="main">
		<nav id="menu-list">
			<ul>
				<li><a href="../notice/list">공지사항</a></li>
				<li><a href="../../update">회원정보 수정</a></li>
				<li><a href="ring">소리 및 진동</a></li>
			</ul>
		</nav>
		</main>
	</div>
	<jsp:include page="../../../inc/bottom_menu.jsp" />
</div>
</body>
</html>