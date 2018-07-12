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
#alert-list h1 {
	display:none;
}
#alert-list thead{
	display:none;
}
#alert-list table {
	width:100%;
	table-layout: fixed;
}
#alert-list .time {
	width:100px;
	text-align: center;
}
#alert-list .week {
    width: calc(100% - 170px);
}
#alert-list .switch {
	width:70px;
	text-align: center;
}

</style>
</head>
<body>
<div id="body" class="full-screen">	
	<!-- header 영역 -->
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
	<main id="main" class="full-container">
		<section id="alert-list">
			<h1>알람 표</h1>
			<table>
				<thead>
					<tr>
						<td class="time">시간</td>
						<td class="week">요일</td>
						<td class="switch">알람 설정</td>
					</tr>
				</thead>
				<tbody>
					<% for(Alert alert : list) { %>
					<tr>
						<td class="time"><%=alert.getTime()%></td>
						<td class="week"><%=alert.getWeek()%></td>
						<td class="switch"><label class="switch"><input type="checkbox"><span class="slider round"></span></label></td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</section>
	</main>
	<jsp:include page="../../inc/bottom_menu.jsp"></jsp:include>
</div>	
</body>
</html>