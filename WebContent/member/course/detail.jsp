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
<link rel="stylesheet" type="text/css" href="../../css/style.css"">
<style>

body {margin:0px;}
ul {margin:0px; padding:0px;}
li {list-style: none;}
h1, p, figure{margin:0px;}

/* ---------------------- reset --------------------*/

.hide{display:none}

.content-container {
	height: 100%;
	margin-left: auto;
	margin-right: auto;
}  

.full-container{
	width:100%;
	margin:0px auto;
	padding-bottom:60px;
}

#body{
    overflow-y: auto;
	position: fixed;
	width: 100%;
	height: 100%;
	background:url(../../images/bg.jpg) no-repeat;
	background-size:cover;	
}

	#header {
		height: 60px; 
		box-sizing: content-box; 
		background:rgba(255,255,255,0.6);
		font-size: 0.9em;
	}

		#header .content-container {
			display: flex;
		}  
	
			#header section:nth-child(1){
				width : 95%;
				padding: 15px;  
			}
			#header section:nth-child(2){
				padding: 15px;    
			}
			
			#header section:nth-child(2) input{
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
			
			#time-setting > div + div{
				border-top: 2px solid gray;	 
				display: flex;
				justify-content: center; 
			}
			
			#time-setting > div + div > div{
				box-sizing : border-box;
				width: 33%; 
				height: 110px;
				text-align: center;
				padding: 5px;
				border-right: 1px solid gray;
			}
			
			#time-setting > div + div > div:last-child{
				border-right: none;
			}
			
			#time-setting > div + div div div{
				display: flex;
				align-items:center;
				width: 100%;
				justify-content: center;
				margin-top : 10px;
			}
			
			#time-setting > div + div span:nth-child(2){
				font-size: 2em; 
				font-weight: bolder; 
			}
			
			#time-setting > div + div div img{
				width: 30px;
				height: 30px;
			} 
		
			
			#time-setting > div + div div div span:nth-child(2){
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
			  
			#course-setting table td{
				color: #fffffe;
			}  

</style>
</head>
<body>	
<div id="body">
	<!-- header 영역 -->
	<header id="header">
		<div class="content-container clearfix">
			<section>
				<h1>&lt; 경로 알림 설정</h1>
			</section>
			<section>
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
				<div>
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
		
		<aside id="bottom-menu">
			<h1 class="hide">하단 메뉴</h1>
			<ul>
				<li><a href="1">홈</a></li>
				<li><a href="2">위치</a></li>
				<li><a href="3">알람</a></li>
				<li><a href="4">설정</a></li>
			</ul>
		</aside>
	</div>
</div>
</body>
</html>