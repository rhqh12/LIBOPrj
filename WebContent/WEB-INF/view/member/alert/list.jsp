<%@page import="com.libo.web.service.member.AlertService"%>
<%@page import="com.libo.web.entity.Alert"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>알람</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link href="../../css/style.css" type="text/css" rel="stylesheet"/>
<link href="../../css/timedropper.min.css" type="text/css" rel="stylesheet" />
<script src="//code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous" ></script>
<style>
#alert-list h1 {
	display:none;
}
#main {
	position: relative;
}
.btn-add {
	position:absolute;
	bottom:10px;
	right:10px;
	width:30px;
	height:30px;
	line-height:33px;
	background:#5eb2ff;
	color:#fff;
	text-align:center;
	border-radius: 50%;
}
</style>
</head>
<body>
<div id="body" class="full-screen bg-morning">	
	<!-- header 영역11 -->
	<header id="header">
		<div class="content-container clearfix">
			<section>
				<h1>&lt; 알람설정</h1>
			</section>
			<section>
				<span>삭제 버튼</span>
			</section>
		</div>
	</header>		
	<!-- main 영역 -->
	<main id="main" class="full-container bg-white">
		<section id="alert-list" class="cont-scroll">
			<h1>알람 표</h1>
			<ul class="list set">
				<% for(Alert alert : (List<Alert>)request.getAttribute("list")) { %>
				<li>
					<a href="detail.jsp?id=<%=alert.getId()%>">
						<div class="col-sm">
							오전 <span>6:30</span>
						</div>
						<div class="col-au col-week">
							<%=alert.getWeek() %>
						</div>
						<div class="col-xs">
							<label class="switch"><input type="checkbox"><span class="slider round"></span></label>
						</div>
					</a>
				</li>
				<% } %>																											
			</ul>
		</section>
		<aside class="btn-add">
			<a href="edit.jsp"><span>+</span></a>
		</aside>
	</main>
	<jsp:include page="../../inc/bottom_menu.jsp"></jsp:include>
</div>	
</body>
</html>