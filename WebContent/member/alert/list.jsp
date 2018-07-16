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
				<% for(Alert alert : list) { %>
				<li>
					<div class="col-sm">
						오전 <span>6:30</span>
					</div>
					<div class="col-au col-week">
						<%=alert.getWeek()%>
					</div>
					<div class="col-xs">
						<label class="switch"><input type="checkbox"><span class="slider round"></span></label>
					</div>
				</li>
				<% } %>
				<% for(Alert alert : list) { %>
				<li>
					<div class="col-sm">
						오전 <span>6:30</span>
					</div>
					<div class="col-au col-week">
						<%=alert.getWeek()%>
					</div>
					<div class="col-xs">
						<label class="switch"><input type="checkbox"><span class="slider round"></span></label>
					</div>
				</li>
				<% } %>
				<% for(Alert alert : list) { %>
				<li>
					<div class="col-sm">
						오전 <span>6:30</span>
					</div>
					<div class="col-au col-week">
						<%=alert.getWeek()%>
					</div>
					<div class="col-xs">
						<label class="switch"><input type="checkbox"><span class="slider round"></span></label>
					</div>
				</li>
				<% } %>
				<% for(Alert alert : list) { %>
				<li>
					<div class="col-sm">
						오전 <span>6:30</span>
					</div>
					<div class="col-au col-week">
						<%=alert.getWeek()%>
					</div>
					<div class="col-xs">
						<label class="switch"><input type="checkbox"><span class="slider round"></span></label>
					</div>
				</li>
				<% } %>
				<% for(Alert alert : list) { %>
				<li>
					<div class="col-sm">
						오전 <span>6:30</span>
					</div>
					<div class="col-au col-week">
						<%=alert.getWeek()%>
					</div>
					<div class="col-xs">
						<label class="switch"><input type="checkbox"><span class="slider round"></span></label>
					</div>
				</li>
				<% } %>
				<% for(Alert alert : list) { %>
				<li>
					<div class="col-sm">
						오전 <span>6:30</span>
					</div>
					<div class="col-au col-week">
						<%=alert.getWeek()%>
					</div>
					<div class="col-xs">
						<label class="switch"><input type="checkbox"><span class="slider round"></span></label>
					</div>
				</li>
				<% } %>
				<% for(Alert alert : list) { %>
				<li>
					<div class="col-sm">
						오전 <span>6:30</span>
					</div>
					<div class="col-au col-week">
						<%=alert.getWeek()%>
					</div>
					<div class="col-xs">
						<label class="switch"><input type="checkbox"><span class="slider round"></span></label>
					</div>
				</li>
				<% } %>
				<% for(Alert alert : list) { %>
				<li>
					<div class="col-sm">
						오전 <span>6:30</span>
					</div>
					<div class="col-au col-week">
						<%=alert.getWeek()%>
					</div>
					<div class="col-xs">
						<label class="switch"><input type="checkbox"><span class="slider round"></span></label>
					</div>
				</li>
				<% } %>																												
			</ul>
		</section>
	</main>
	<jsp:include page="../../inc/bottom_menu.jsp"></jsp:include>
</div>	
</body>
</html>