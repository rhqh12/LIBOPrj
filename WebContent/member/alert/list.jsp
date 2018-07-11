<%@page import="com.libo.web.service.member.AlertService"%>
<%@page import="com.libo.web.entity.Alert"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


AlertService service = new AlertService();
List<Alert> list = service.getAlertList("test");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알람</title>
<link href="../../css/style.css" type="text/css" rel="stylesheet"/>
<style>

</style>
</head>
<body>
<div id="body" class="full-screen">
	<header>
		<h1>&lt; 알람 설정</h1>
		<span>삭제 버튼</span>
	</header>
	<div class="full-container">
		<!-- main 영역 -->
		<main id="main">
			<section>
				<h1>알람 표</h1>
				<table border="2">
					<thead>
						<tr>
							<td>시간</td>
							<td>요일</td>
							<td>알람 설정</td>
						</tr>
					</thead>
					<tbody>
						<% for(Alert alert : list) { %>
						<tr>
							<td>오전 06:30</td>
							<td>일 월 화 수 목 금 토</td>
							<td>알람 on/off</td>
						</tr>
						<% } %>
					</tbody>
				</table>
			</section>
		</main>
	</div>
	<nav id="bottom-menu">
		<h1 class="hide">하단 메뉴</h1>
		<ul>
			<li><a href="../">홈</a></li>
			<li><a href="../place/">위치</a></li>
			<li><a href="../alert/list.html">알람</a></li>
			<li><a href="../menu/set/list.html">설정</a></li>
		</ul>
	</nav>
</div>	
</body>
</html>