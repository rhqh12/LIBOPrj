<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>경로 알림 설정</title>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous" ></script>
<link rel="stylesheet" type="text/css" href="../../css/style.css">
<style>

#save-menu input{
	border: none;
	width: 50px; 
	height: 30px;
	background: #e0e0e0;
	border-radius: 10px;
}		
	
#time-setting{
	height: 200px;
	box-sizing: border-box;
	padding-top : 20px; 
	/* background:rgba(255,255,255,0.6); */
}

	#time-setting > div{
		padding: 15px 15px 15px 15px;	
		font-size: 0.8em;   	
	}
	
	#time-info {
		border-top: 2px solid gray;	 
		display: flex;
		justify-content: center;
	}
	 
	#time-info > div{
		box-sizing : border-box;
		width: 33%; 
		height: 110px;
		text-align: center;
		padding: 5px;
		border-right: 1px solid gray;
	}
	
	#time-info > div:last-child{
		border-right: none;
	}
	
	#time-info div div{
		display: flex;
		align-items:center;
		width: 100%;
		justify-content: center;
		margin : 10px 0px;
		
	}
	
	.info-md{
		font-size: 2em; 
		font-weight: bolder;
	}
	
	.info-sm{
		font-size: 1.3em; 
		font-weight: bolder;
		
	}
	
	#time-info div img{
		width: 30px;
		height: 30px;
	} 

	#time-info div div span:nth-child(2){
		font-size: 1.3em; 
		font-weight: bold;  
		margin-left: 10px;    
	}

	#course-setting{
		margin-top : 20px; 
		/* background:rgba(255,255,255,0.6); */
		height: 300px;
		box-sizing: border-box;
	}
	
		#course-setting>div{
			box-sizing : border-box;
			padding: 15px; 
			margin-top: 50px;
		} 
		
		#course-setting table{
			background:rgba(90,170,223,0.6);
			width: 100%;
			font-size: 1.1em;
			height: 80px;
		} 

</style>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#time-info").on("click", function(){
		$("#update-form").attr({action:"updateDate", method:'post'}).submit();
	});
	
	
	
	$("#course-setting tr:eq(0)").on("click", function(){
		$("#update-form input[name=type]").val("workplace");
		$("#update-form").attr({action:"address", method:'post'}).submit();
	});
	
	$("#course-setting tr:eq(1)").on("click", function(){
		$("#update-form input[name=type]").val("home");
		$("#update-form").attr({action:"address", method:'post'}).submit();
		
	});
	
});
</script>
</head>
<body>
	
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

<div id="body" class="full-screen bg-morning">
	<!-- header 영역 -->
	<header id="header">
		<div class="content-container">
			<section>
				<h1>&lt; 경로 알림 설정</h1>
			</section>
			<section id="save-menu">
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
</body>
</html>