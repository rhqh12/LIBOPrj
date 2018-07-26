<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous" ></script>
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
	display: block; 
	box-sizing: content-box;
} 
	 
	#button-box input{  
		border: none;
		width : 120px;
		height: 50px; 
		border-radius: 15px;
		font-size: 1.6em;
	} 

</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#btn-cancel").on("click", function(){
		$("#update-form").submit();
	});
	
	$("#btn-check").on("click", function(){
		setValue();
		$("#update-form").submit();
	});
});

function setValue(){
	
	var startingTime = $("#startingTime").text();
	var endingTime = $("#endingTime").text();
	var week = $("#week").text();
	var startingAlarm = "N";
	var endingAlarm = "N"
	if($("#startingAlarm").is(":checked")){
		startingAlarm = "Y"
	}
	if($("#endingAlarm").is(":checked")){
		var endingAlarm = "Y"
	}

	$("input[name=startingTime]").val(startingTime);
	$("input[name=endingTime]").val(endingTime);
	$("input[name=startingAlarm]").val(startingAlarm);
	$("input[name=endingAlarm]").val(endingAlarm);
	$("input[name=week]").val(week);
	
}
</script>
</head>
<body>
	
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
						<c:choose>
						    <c:when test="${c.startingAlarm eq 'Y'}">
						   		<input id="startingAlarm" class="alarm" type="checkbox" checked>
						    </c:when>
						    <c:otherwise>
						      <input id="startingAlarm" class="alarm" type="checkbox">
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
						   		<input id="endingAlarm" class="alarm" type="checkbox" checked>
						    </c:when>
						    <c:otherwise>
						      <input id="endingAlarm" class="alarm" type="checkbox">
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
					<div><span id="startingTime">${c.startingTime}</span> ></div>
				</div>
				<div>
					<div><span>퇴근시간</span></div>
					<div><span id="endingTime">${c.endingTime}</span> ></div>
				</div>
				<div>
					<div><span>근무하는 날</span></div>
					<div><span id="week">${c.week}</span> ></div>
				</div>
				<div id="button-box">
					<input type="button" id="btn-cancel" value="취소" />
					<input type="button" id="btn-check" value="확인" />
				</div>
			</section>
		</div>
	<!-- menu -->
	<jsp:include page="../../inc/bottom_menu.jsp" />
</div>
</body>
</html>