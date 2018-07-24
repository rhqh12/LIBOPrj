<%@page import="com.libo.web.service.member.AlertService"%>
<%@page import="com.libo.web.entity.Alert"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알람</title>
<link href="../../css/style.css" type="text/css" rel="stylesheet"/>
<link href="../../css/anypicker.css" type="text/css" rel="stylesheet" />
<script src="//code.jquery.com/jquery-1.11.3.js"></script>
<script src="../../js/anypicker.js"></script>

<script>

</script>
<style>
#alert-list h1,
.del-chk {
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
				<span class="btn-del">삭제</span>
			</section>
		</div>
	</header>		
	<!-- main 영역 -->
	<main id="main" class="full-container bg-white">
		<section id="alert-list" class="cont-scroll">
			<h1>알람 표</h1>
			<ul class="list set">
				<c:forEach var="a" items="${list }">
				<li>
					<input type="checkbox" name="id" value="${a.id}" class="del-chk" />
					<a href="detail.jsp?id=${a.id}">
						<div class="col-sm">
							오전 <span>6:30</span>
						</div>
						<div class="col-au col-week">${a.week}</div>
						<div class="col-xs">
							<label class="switch"><input type="checkbox"><span class="slider round"></span></label>
						</div>
					</a>
				</li>
				</c:forEach>																									
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