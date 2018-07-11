<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.libo.web.service.member.CourseService"%>
<%@page import="com.libo.web.entity.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String writeId = "test"; // 초기값
	String writeId_ = request.getParameter("writeId");
	
	if(writeId_ != null && !writeId_.equals("")){
		writeId = writeId_;
	}
	
	CourseService courseService = new CourseService();
	List<Course> list = courseService.getCourseList(writeId);
		
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>회원 메인 페이지</title>
<link rel="stylesheet" type="text/css" href="../../css/common.css">
<style>

body {margin:0px;}
ul {margin:0px; padding:0px;}
li {list-style: none;}
h1, p, figure{margin:0px;}

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
		background: #dddddf;  
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
	
				#header section:nth-child(2) div{  
					width : 29px; 
					height : 29px;
					background: url("../../images/menu.png") no-repeat center;
					background-size: cover; 
				}
	
	#main{
		border:1px solid #ccc; 
		background:rgba(255,255,255,0.6);
	}
	 
		#list-article .wrapper {
			position: relative;
		}

		#list-article table{
			text-align: center;
			border-spacing: 0px;  
			width: 100%;
		}

			#list-article table thead{
				font-weight: bold;
			}
	
			#body table thead td{ 
			 	border-top: 1px solid gray; 
				border-bottom: 1px solid gray;
				padding: 7px 0px 7px 0px; 
			}
		
			#body table tbody td{
				height: 6em;
				font-size: 0.9em; 
			}
	
				#body table tbody td span{
					font-weight: bold;
				}
			
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
<div id="body">
	<!-- header 영역 -->
	<header id="header">
		<div class="content-container clearfix">
			<section>
				<h1>&lt; 경로 목록</h1>
			</section>
			<section>
				<div></div>
			</section>
		</div>
	</header>	
	
	<div class="full-container">
		<main id="main">
			<h1 class="hide">경로</h1>
			<aside id="list-article">
				<h1 class="hide">경로 목록</h1>
				<div class="wrapper">
					<section>
						<h1 class="hide">경로 목록 표</h1>
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
							</tbody>
						</table>
						<br />
						<br />
						<br />
						<div id="plus"></div>
					</section>				
				</div>	
			</aside> 
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