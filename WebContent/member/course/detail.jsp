<%@page import="com.libo.web.entity.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.libo.web.service.member.CourseService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%

	long courseId = 1L;
	String courseId_ = request.getParameter("courseId");
	
	if(courseId_ != null && !courseId_.equals("")){
		courseId = Long.parseLong(courseId_);
	}

	CourseService courseService = new CourseService();
	Course course = courseService.getCourse(courseId);

%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>경로 알림 설정</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css">
<style>

#save-menu input{
	border: none;
	width: 50px; 
	height: 30px;
	background: #e0e0e0;
	border-radius: 10px;
}		
	
#time-setting{
	height: 200px;
	box-sizing: border-box;
	margin-top : 20px; 
	background:rgba(255,255,255,0.6);
}

	#time-setting > div{
		padding: 15px 15px 15px 15px;	
		font-size: 0.8em;   	
	}
	
	#time-info {
		border-top: 2px solid gray;	 
		display: flex;
		justify-content: center; 
	}
	
	#time-info > div{
		box-sizing : border-box;
		width: 33%; 
		height: 110px;
		text-align: center;
		padding: 5px;
		border-right: 1px solid gray;
	}
	
	#time-info > div:last-child{
		border-right: none;
	}
	
	#time-info div div{
		display: flex;
		align-items:center;
		width: 100%;
		justify-content: center;
		margin-top : 10px;
	}
	
	#time-info span:nth-child(2){
		font-size: 2em; 
		font-weight: bolder; 
	}
	
	#time-info div img{
		width: 30px;
		height: 30px;
	} 

	#time-info div div span:nth-child(2){
		font-size: 1.3em; 
		font-weight: bold;  
		margin-left: 10px;    
	}

	#course-setting{
		margin-top : 20px; 
		background:rgba(255,255,255,0.6);
		height: 300px;
		box-sizing: border-box;
	}
	
		#course-setting>div{
			box-sizing : border-box;
			padding: 15px; 
		} 
		
		#course-setting table{
			background:rgba(90,170,223,0.6);
			width: 100%;
			font-size: 1.1em;
			height: 80px;
		} 

</style>
</head>
<body>	
<div id="body" class="full-screen">

	<!-- header 영역 -->
	<header id="header">
		<div class="content-container">
			<section>
				<h1>&lt; 경로 알림 설정</h1>
			</section>
			<section id="save-menu">
				<input type="button" value="저장" />
			</section>
		</div>
	</header>	
	
	<div class="full-container">
		<main id="main">
			<h1 class="hide">경로</h1>
			<section id="time-setting">
				<h1 class="hide">시간설정</h1>
				<div>
					<h1>출/퇴근 알림</h1>
				</div>
				
				<div id="time-info">
					<div>
						<div>
							<span><img alt="" src="../../images/yellow-sun.gif"></span>
							<span>출근</span>
						</div>
						<span><%=course.getStartingTime() %></span>
					</div>
					
					<div>
						<div>
							<span><img alt="" src="../../images/blue-mon.png"></span>
							<span>퇴근</span>
						</div>
						<span><%=course.getEndingTime() %></span>
					</div>
					
					<div>
						<div>
							<span><img alt="" src="../../images/cal.png"></span>
							<span>출근</span>
						</div>
						<span>월-금</span><!-- ?? -->
					</div>
				</div>
			</section>
			
			<section id="course-setting">
				<h1 class="hide">경로설정</h1>
				<div>
					<table>
						<tr>
							<th>출근</th>
							<td><%=course.getWorkplace() %></td>
						</tr>
						<tr>
							<th>퇴근</th>
							<td><%=course.getHomeAddress() %></td>
						</tr>
					</table>
				</div> 
			</section>
		</main>	
	</div>
	<!-- menu -->
	<jsp:include page="../../inc/bottom_menu.jsp" />
</div>
</body>
</html>