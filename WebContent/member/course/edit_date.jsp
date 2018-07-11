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
<link rel="stylesheet" type="text/css" href="../../css/style.css"">
<style>

body {margin:0px;}
ul {margin:0px; padding:0px;}
li {list-style: none;}
h1, p, figure{margin:0px;}

/* ---------------------- reset --------------------*/

/* ---------------------- reset --------------------*/

.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px; 
}

.switch input {display:none;}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
} 

/* ----------------- 토글 스위치  ----------------- */

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
		
		#alert-setting{
			height: 200px;		
		}
		
		#time-setting{
			height: 450px;
		}
		  
		.setting-box{
			box-sizing: border-box;
			margin-top : 20px; 
			background:rgba(255,255,255,0.6);
		}
		
			.setting-box > div{
   				border-top: 1px solid gray;
   				background : rgba(255,255,255, 0.6);
   				height: 42px;
   				display: flex; 
   				align-items:center;
   				padding: 15px 15px 15px 20px;	
				font-size: 0.8em;   
			}
			 
			.setting-box > div:nth-child(2){
				height: 25px;
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
<div id="body">
	<!-- header 영역 -->
	<header id="header">
		<div class="content-container clearfix">
			<section>
				<h1>&lt; 출/퇴근 알림 설정</h1>
			</section>
		</div>
	</header>	
	
	<div class="full-container">
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