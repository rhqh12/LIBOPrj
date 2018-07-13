<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.libo.web.service.member.CourseService"%>
<%@page import="com.libo.web.entity.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String writeId = "test"; // 초기값
	String writeId_ = request.getParameter("writeId");
	
	if(writeId_ != null && !writeId_.equals(""))
		writeId = writeId_;
	
	CourseService courseService = new CourseService();
	List<Course> list = courseService.getCourseList(writeId);
		
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>회원 메인 페이지</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css">
<style>

#delete-menu div{  
	width : 29px; 
	height : 29px;
	background: url("../../images/menu.png") no-repeat center;
	background-size: cover; 
}
	 
	#course-list table{
		text-align: center;
		border-spacing: 0px;  
		width: 100%;
	}

	#course-list table thead{
		font-weight: bold;
	}

	#course-list thead td{ 
	 	border-top: 1px solid gray; 
		border-bottom: 1px solid gray;
		padding: 7px 0px 7px 0px; 
	}
		
	#course-list tbody td{
		height: 6em;
		font-size: 0.9em; 
	}
	
	#course-list tbody td span{
		font-weight: bold;
	}
	
<!-- plus버튼 넣어야 함 -->					
#plus{
	margin-left : auto;  
	width : 60px; 
	height : 60px; 
	background: url("../../images/plus.png") no-repeat center;
	background-size: cover;
}


</style>
</head>
<body>	
<div id="body" class="full-screen">

	<!-- header 영역 -->
	<header id="header">
		<div class="content-container">
			<section> 
				<h1>&lt; 경로 목록</h1>
			</section>
			<section id="delete-menu">
				<div></div>
			</section>
		</div>
	</header>
	
	<div class="full-container">
		<!-- main 영역 -->
		<main id="main">
			<section id="course-list">
				<h1 class="hide">경로 표</h1>
					<table>
						<thead>
							<tr>
								<td>출발</td>
								<td>도착</td>
								<td>요일</td>
								<td>알림설정</td>
							</tr>
						</thead>
						<tbody>
							<%for(int i=0; i<15; i++){ %>
							<%for(Course course : list ){ %>
							<tr>
								<td><span><%=course.getHome() %></span><br /><%=course.getStartingTime() %></td>
								<td><span><%=course.getWorkplace() %></span><br /><%=course.getEndingTime() %></td>
								<td><%=course.getWeek() %></td>
								<td>
									<label class="switch">
									<%if(course.getStartingAlarm().equals("Y") ||
											course.getEndingAlarm().equals("Y")
										){  
									%>
									  <input type="checkbox" checked>
									  <%} else{ %>
									  <input type="checkbox" >
									  <%} %>
									  <span class="slider round"></span>
									</label>
								</td>
							</tr>
							<%} %>
							<%} %>
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