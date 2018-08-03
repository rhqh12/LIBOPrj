<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link href="../../css/style.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="../../css/member/course/edit_date.css">
<link href="../../css/timedropper.min.css" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous" ></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="../../js/timedropper.min.js"></script> 
<script src="../../js/member/dateSelect.js" type="text/javascript"></script>
<script src="../../js/member/course/edit_date.js" type="text/javascript"></script>
<title>출/퇴근 알림 설정</title>
</head>
<body>
<div id="body" class="full-screen bg-morning">
	<!-- header 영역 -->
	<header id="header">
		<div class="content-container">
			<section class="title">
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
						<c:choose>
						    <c:when test="${c.startingAlarm eq 'Y'}">
						   		<input class="starting-alarm" type="checkbox" checked>
						    </c:when>
						    <c:otherwise>
						      <input class="starting-alarm" type="checkbox">
						    </c:otherwise>
						</c:choose>
						<span class="slider round"></span>
						</label>
					</div>
				</div>
				<div>
					<div><span>퇴근시간</span></div>
					<div>
					<label class="switch">
						<c:choose>
						    <c:when test="${c.endingAlarm eq 'Y'}">
						   		<input class="ending-alarm" type="checkbox" checked>
						    </c:when>
						    <c:otherwise>
						      <input class="ending-alarm" type="checkbox">
						    </c:otherwise>
						</c:choose>
						<span class="slider round"></span></label>
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
					<div>
						<input type="text" class="td-input starting-time" value="${c.startingTime}" readonly />
						<%-- <span class="startingTime">${c.startingTime}</span> --%>
					</div>
				</div>
				<div> 
					<div><span>퇴근시간</span></div>
					<div>
						<input type="text" class="td-input ending-time" value="${c.endingTime}" readonly />
						<%-- <span class="endingTime">${c.endingTime}</span> --%>
					</div>
				</div>
				<div id="week-box">
					<%-- <div><span>근무하는 날</span></div>
					<div><span class="week">${c.week}</span> ></div> --%>
					<div class="set-week">
						<h1>근무하는 날</h1>
						<input type="hidden" name="week" id="week-input" value="${c.week}" />
						<ul class="menu-week" id="week-select">
							<c:forEach var="a" items="${week }">
							<c:set var="className" value="" />
							<c:if test="${fn:contains(c.week, a)}">
								<c:set var="className" value="on" />
							</c:if>
								<li class="${className }">${a}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div id="button-box">
					<input type="button" class="cancel-btn" value="취소" />
					<input type="button" class="check-btn" value="확인" />
				</div>
			</section> 
		</div>
	<!-- menu -->
	<jsp:include page="../../inc/bottom_menu.jsp" />
</div>
<form id="update-form" action="detail" method="post">
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
	<input type="hidden" name="type" value="update">
</form>
</body>
</html>