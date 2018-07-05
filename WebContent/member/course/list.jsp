<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course List</title>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<style type="text/css"> 
body {
	margin: 0px;
	font-size: 0.8em; 
	background: url("../../images/bg.jpg") no-repeat center;
}

h1 {
	margin: 0px;
}
 
/* styling-------------------------------------- */
.content-container {
	height: 100%;
	margin-left: auto;
	margin-right: auto;
}

.clearfix::after{
	content: "."; 
	height:0px;
	display: block;
	clear: left;
	overflow: hidden; /*박스 범위를 넘어선 요소들에 대한 설정*/
}


#header {
	height: 60px; 
	box-sizing: content-box;
	background: #dddddf; 
}
#back{
	float: left;
	padding: 15px;  
}
#menu{
	float: right; 
	padding: 15px; 
}

#body{
	 min-height: 100%;
	 overflow: auto;  
	 background: #ffffff; 
	 background: rgba(255, 255, 255, 0.5);
}  
   
#body h1{
	display: none;
}
 
#body table thead td{ 
 	border-top: 1px solid gray; 
	border-bottom: 1px solid gray;
	padding: 0px; 
}   
  
#body table tbody td{
	height: 6em; 
}

#body table{
	text-align: center;
	border-spacing: 0px;  
	width: 100%;
}     

footer li{ 
	display: inline-block; 
} 

footer {
    position:fixed;
    bottom:0;
    width:100%;
    height:70px;   
    background:#ccc;
}


/* 스위치 */

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

#menu div{  
	width : 25px; 
	height : 25px;
	background: url("../../images/menu.png") no-repeat center;
	background-size: cover; 
}

</style>
</head>
<body>
	<!-- header 영역 -->
	<header id="header">
		<div class="content-container clearfix">
			<section id="back">
				<h1>&lt; 경로 목록</h1>
			</section>
			<section id="menu">
				<div></div>
			</section>
		</div>
	</header>

	<!-- main 영역 -->
	<div id="body">
		<div class="content-container">
			<main>
				<section>
					<h1>경로 목록 표</h1>
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
							<tr>
								<td>신도림<br />오전 08:00</td>
								<td>쌍용강북<br /> 오후 18:00</td>
								<td>일 월 화 수 목 금 토</td>
								<td>
									<label class="switch">
									  <input type="checkbox" checked>
									  <span class="slider round"></span>
									</label>
								</td>
							</tr>
							<tr>
								<td>가산디지털<br /> 오전 09:00</td>
								<td>쌍용강북<br /> 오후 18:00</td>
								<td>일 월 화 수 목 금 토</td>
								<td>
									<label class="switch">
									  <input type="checkbox" checked>
									  <span class="slider round"></span>
									</label>
								</td>
							</tr>
							
							<tr>
								<td>가산디지털<br /> 오전 09:00</td>
								<td>쌍용강북<br /> 오후 18:00</td>
								<td>일 월 화 수 목 금 토</td>
								<td>
									<label class="switch">
									  <input type="checkbox" checked>
									  <span class="slider round"></span>
									</label>
								</td>
						
						</tbody>
					</table>
				</section>
				<!-- 하단 영역 -->
			</main>
		</div>
	</div>
	
	<footer>
		<div class="content-container">
			<aside>
				<h1>하단 메뉴</h1>
				<ul>
					<li><a href="../">홈</a></li>
					<li><a href="../place/">위치</a></li>
					<li><a href="../alert/list.html">알람</a></li>
					<li><a href="../menu/set/list.html">설정</a></li>
				</ul>
			</aside>
		</div>
	</footer>
</body>
</html>