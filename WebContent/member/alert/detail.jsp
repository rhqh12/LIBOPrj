<%@page import="com.libo.web.service.member.AlertService"%>
<%@page import="com.libo.web.entity.Alert"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AlertService service = new AlertService();
	long id =  Long.parseLong(request.getParameter("id"));
	Alert alert = service.getAlert(id);
%>
<!DOCTYPE html>
<html>
<head>
<title>알람</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link href="../../css/style.css" type="text/css" rel="stylesheet"/>
<link href="../../css/timedropper.min.css" type="text/css" rel="stylesheet" />
<script src="//code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous" ></script>
<script src="../../js/timedropper.min.js"></script>
<script>
//https://felicegattuso.com/projects/timedropper/
$(document).ready(function(){
	$( "#time-dropper" ).timeDropper({
		setCurrentTime:false,
		meridians:true
	});
});
</script>
<style>
#main {
	position: relative;
}
#alert-list h1 {
	display:none;
}
.set-date h1, .set-time h1 {
	display:none;
}
/*---set-date-------*/
.set-date {
	display:flex;
	padding:20px;
}
	.set-date span {
		flex-grow: 1;
	}
	.set-date .select {
		text-align:right;
	}

/*---set-time-------*/
.set-time {
	border:solid #070707;
	border-width:2px 0px;
	padding:20px 40px;
}
	.set-time .td-input {
	    border: 0;
	    -webkit-appearance: none;
	    outline: none;
	    text-align: center;
	    font-size: 1em;
	    display: inline-block;
	    position: relative;
	    z-index: 2;
	    font-weight: 700;
	    padding: 14px;
	    border-radius: 2px;
	    box-shadow: 0 0px 0 1px rgb(25, 119, 204);
	    width: 100%;
	    background: #FFF;
	    color: #1977cc;	
	    cursor: pointer;
	}
/*---set-week----------*/
.set-week{
	padding:20px;
}
	.set-week h1 {
		font-size:15px;
	}
	.set-week ul {
		display:flex;
		padding:20px;
	}
	.set-week li {
		flex-grow: 1;
		text-align:center;
	}
/*---menu-btn------------*/
.menu-btn {
	display:flex;
	position:absolute;
	bottom:0px;
	left:0px;
	width: calc(100% - 20px);
	margin:0px 10px;
}
	.menu-btn li {
		flex-grow:1;
		margin:20px 10px;
		text-align: center;
		height:30px;
		line-height:30px;
		background:#a9a9a9;
	}
	.menu-btn li a {
		text-decoration: none;
	}

</style>
</head>
<body>
<div id="body" class="full-screen bg-morning">	
	<!-- header 영역11 -->
	<header id="header">
		<div class="content-container clearfix">
			<section>
				<h1>&lt; 알람설정</h1>
			</section>
		</div>
	</header>		
	<!-- main 영역 -->
	<main id="main" class="full-container bg-white">
		<aside class="set-date">
			<h1>날짜 설정</h1>
			<span>내일 - 6월 22일 (금)</span>
			<span class="select">날짜 선택</span>
		</aside>
		<section class="set-time">
			<h1>시간 설정</h1>
			<input type="text" class="td-input" id="time-dropper" value="12:00 pm" readonly />
		</section>
		<section class="set-week">
			<h1>요일 반복</h1>
			<ul class="menu-week">
				<li>일</li>
				<li>월</li>
				<li>화</li>
				<li>수</li>
				<li>목</li>
				<li>금</li>
				<li>토</li>
			</ul>
		</section>
		<div>
			<ul class="menu-btn">
				<li><a href="list">취소</a></li>
				<li><a href="">수정하기</a></li>
			</ul>
		</div>
	</main>
	<jsp:include page="../../inc/bottom_menu.jsp"></jsp:include>
</div>	
</body>
</html>