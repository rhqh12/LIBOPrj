<%@page import="com.libo.web.entity.Course"%>
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
<title>출/퇴근 알림 설정</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css">
<style> 

		#alert-setting{
			height: 200px;
		}
		
		#time-setting{
			height: 450px;
		}
		  
		.setting-box{ 
			box-sizing: border-box;
			padding: 20px 10px;  
		}  
		
			.setting-box > div{
   				border-top: 1px solid gray;
   				background : rgba(255,255,255, 0.6);
   				height: 42px;
   				display: flex; 
   				align-items:center;
   				padding: 30px 15px 30px 20px;	
				font-size: 0.8em;   
			} 
			 
			.setting-box > div:nth-child(2){
				background : rgba(211,211,224, 0.9);
			}
			
			.setting-box > div:nth-child(2) > h1{
				font-size: 1.4em; 
				height: 15px;
    
			}  
			
			.setting-box div:nth-child(3)>div:first-child, 
						 div:nth-child(4)>div:first-child,
						 div:nth-child(5)>div:first-child{
   				width: 95%; 
   				font-size: 1.8em;
   				color : #848484; 
   				font-weight: bold;  
			}
			
			#time-setting div div:nth-child(1){
				width : 60%;
			} 
			
			#time-setting div div:nth-child(2){
				text-align : right;
				width: 40%;
			}
			
			#time-setting div div:nth-child(2) span{
				font-size: 1.3em;
				font-weight: bold;
			}
					
#button-box{
	background: none;  
	border: none;
	width: 300px; 
	margin: 0 auto;
	text-align: center; 
	margin-top : 80px;
	display: block; 
	box-sizing: content-box;
} 
	 
	#button-box input{  
		width: 100px;    
		border: none;
		margin-right: 16px;   
		width : 120px;
		height: 50px; 
		border-radius: 15px;
		font-size: 1.6em;
	} 

</style>
</head>
<body>	
<div id="body" class="full-screen bg-morning">
	<!-- header 영역 -->
	<header id="header">
		<div class="content-container">
			<section>
				<h1>&lt; 출/퇴근 알림 설정</h1>
			</section>
		</div>
	</header>	
	
	<div class="full-container bg-white">
		<main id="main">
			<h1 class="hide">설정</h1>
			<section id="alert-setting" class="setting-box">
				<h1 class="hide">알림설정</h1>
				<div>
					<h1>알림설정</h1>
				</div>
				<div>
					<div><span>출근시간</span></div>
					<div>
						<label class="switch">
					<%if(course.getStartingAlarm().equals("Y")){  %>
					  <input type="checkbox" checked>
					  <%} else{ %>
					  <input type="checkbox" >
					  <%} %>
						<span class="slider round"></span>
						</label>
					</div>
				</div>
				<div>
					<div><span>퇴근시간</span></div>
					<div>
						<label class="switch">
						<%if(course.getEndingAlarm().equals("Y")){  %>
						  <input type="checkbox" checked>
						  <%} else{ %>
						  <input type="checkbox" >
						  <%} %>
						<span class="slider round"></span>
						</label>
					</div>
				</div>
			</section>
			
			<section id="time-setting" class="setting-box">
				<h1 class="hide">시간설정</h1>
				<div>
					<h1>시간설정</h1>
				</div>
				<div>
					<div><span>출근시간</span></div>
					<div><span><%= course.getStartingTime() %> ></span></div>
				</div>
				<div>
					<div><span>퇴근시간</span></div>
					<div><span><%= course.getEndingTime() %> ></span></div>
				</div>
				<div>
					<div><span>근무하는 날</span></div>
					<div><span><%= course.getWeek().replaceAll(",", "") %> ></span></div>
				</div>
				<div id="button-box">
					<input type="button" value="취소" />
					<input type="button" value="저장" />
				</div>
			</section>
	</div>
	<!-- menu -->
	<jsp:include page="../../inc/bottom_menu.jsp" />
</div>
</body>
</html>