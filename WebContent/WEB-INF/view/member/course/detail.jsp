<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>경로 알림 설정</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css">
<link rel="stylesheet" type="text/css" href="../../css/member/course/detail.css">
<script type="text/javascript" src="../../js/member/course/detail.js"></script>
</head>
<body>
<div id="body" class="full-screen bg-morning">
	<!-- header 영역 -->
	<header id="header">
		<div class="content-container">
			<section>
				<h1><a href="list">&lt; 경로 알림 설정</a></h1>
			</section>
			<section class="save-menu">
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
						<span class="info-md">${c.startingTime}</span>
					</div>
					
					<div>
						<div>
							<span><img alt="" src="../../images/blue-mon.png"></span>
							<span>퇴근</span>
						</div>
						<span class="info-md">${c.endingTime}</span>
					</div>
					<div>
						<div>
							<span><img alt="" src="../../images/cal.png"></span>
							<span>출근</span> 
						</div>
						<span class="info-sm">${c.week}</span>
					</div>
				</div>
			</section>
			
			<section id="course-setting">
				<h1 class="hide">경로설정</h1>
				<div>
					<table>
						<tr>
							<th>출근</th> 
							<td>${c.workplaceAddress}</td>
						</tr>
						<tr>
							<th>퇴근</th>
							<td>${c.homeAddress}</td>
						</tr>
					</table>
				</div> 
			</section>
		</main>	
	</div>
	<!-- menu -->
	<jsp:include page="../../inc/bottom_menu.jsp" />
</div>
<form id="update-form" method="post">
	<input type="hidden" name="id" value="${c.id }">
	<input type="hidden" name="startingTime" value="${c.startingTime }">
	<input type="hidden" name="startingAlarm" value="${c.startingAlarm }">
	<input type="hidden" name="workplace" value="${c.workplace }">
	<input type="hidden" name="workplaceAddress" value="${c.workplaceAddress }">
	<input type="hidden" name="endingTime" value="${c.endingTime }">
	<input type="hidden" name="endingAlarm" value="${c.endingAlarm }">
	<input type="hidden" name="home" value="${c.home }">
	<input type="hidden" name="homeAddress" value="${c.homeAddress }">
	<input type="hidden" name="week" value="${c.week }">
	<input type="hidden" name="writerId" value="${c.writerId }">
	<input type="hidden" name="type">
</form>
</body>
</html>