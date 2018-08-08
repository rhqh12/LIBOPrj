<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>회원 메인 페이지</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css">
<link rel="stylesheet" type="text/css" href="../../css/member/course/list.css">
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous" ></script>
<script src="../../js/dataMulti.js"></script>
<script src="../../js/member/course/list.js"></script>
<style>
.full-container{
    height: calc(100% - 105px);
}
.col-week{
	line-height: 30px;
}

</style>
</head>
<body>	
<div id="body" class="full-screen bg-morning">
<form id="update-form">
	<input type="hidden" name="id" value="0" />
	<input type="hidden" name="type" value="list" />
</form>
	<!-- header 영역 -->
	<header id="header">
		<div class="content-container clearfix">
			<section>
				<h1><a href="#" onclick="history.go(-1)">&lt; 경로 목록</a></h1>
			</section>
			<section id="sub-box" style="display: block;">
				<div></div>
			</section>			
		</div>
		<div class="df-menu" id="sub-menu">
			<ul>
				<li id="delete-menu">삭제</li>
				<li id="cancel-menu">취소</li>
			</ul>
		</div>
	</header>	
	
	<aside id="list-head" class="bg-white">
		<ul class="list set">
			<li>
				<div class="col-xs col-time">
					출근 
				</div>
				<div class="col-xs col-time">
					퇴근
				</div>
				<div class="col-au">
					요일 
				</div>
				<div class="col-sm col-sm">
					알람설정
				</div>
			</li>
		</ul>
	</aside>
	
	<main id="main" class="full-container bg-white">
		<section id="course-list" class="cont-scroll sel-list">
			<h1>경로 표</h1>
			<form id="delete-form" action="delete" method="post">
				<ul class="list set">
				<c:forEach items="${list }" var="c">
					<li class="list-record" data-id="${c.id }"><!-- ### -->
						<div>
							<input type='checkbox' class='delete-check' name='delete-id' value="${c.id }">
						</div>
						<div class="col-xs col-time list-item"> 
							${c.home }<br />${c.startingTime }
						</div>
						<div class="col-xs col-time list-item">
							${c.workplace }<br />${c.endingTime }
						</div>
						<div class="col-au list-item"> 
							${c.week }
						</div>
						
						<div class="col-sm switch-item">
						<c:choose>
						    <c:when test="${c.startingAlarm eq 'Y' or c.endingAlarm eq 'Y'}">
						   		<label class="switch"><input value="${c.id }" class="alarm" type="checkbox" checked><span class="slider round"></span></label>
						    </c:when>
						    <c:otherwise>
						      <label class="switch"><input value="${c.id }" class="alarm" type="checkbox"><span class="slider round"></span></label>
						    </c:otherwise>
						</c:choose>
						</div>
					</li>							
				</c:forEach>
				</ul>
			</form>
			<div><a href="detail" class="btn-add" id="plus"></a></div>
		</section>
	</main>
	<jsp:include page="../../inc/bottom_menu.jsp"></jsp:include>
</div>	
</body>
</html>