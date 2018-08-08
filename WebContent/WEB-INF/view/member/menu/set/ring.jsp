<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link href="../../../css/style.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="../../../css/member/menu/set/ring.css">
<script src="../../../js/member/menu/set/ring.js" type="text/javascript" charset="UTF-8"></script>
<title>소리 및 진동</title>
</head>
<body>
<div id="body" class="full-screen bg-morning">
	<!-- header 영역 -->
	<header id="header">
		<div class="content-container">
			<section class="title">
				<h1><a href="list">&lt; 소리 및 진동</a></h1>
			</section>
		</div>
	</header>
	 	
	
	<div class="full-container bg-white">
		<main id="main">
			<h1 class="hide">설정</h1>
			<section id="alert-setting" class="setting-box">
				<h1 class="hide">알람설정</h1>
				<div>
					<div><span class="col-md">소리</span></div>
					<div>
						<label class="switch">
							<input class="endingAlarm" type="checkbox" checked>
							<span class="slider round"></span>
						</label>
					</div>
				</div>
				<div>
					<div><span class="col-md">진동</span></div>
					<div>
						<label class="switch">
							<input class="startingAlarm" type="checkbox">
							<span class="slider round"></span>
						</label>
					</div>
				</div>
				<div>
					<div><span class="col-md">소리+진동</span></div>
					<div>
						<label class="switch">
							<input class="endingAlarm" type="checkbox">
							<span class="slider round"></span>
						</label> 
					</div>
				</div>
			</section>
			 
			<section id="button-box">
				<input type="button" class="cancel-btn" value="취소" />
				<input type="button" class="check-btn" value="확인" />
			</section>
			</main>
		</div>
	<!-- menu -->
	<jsp:include page="../../../inc/bottom_menu.jsp"/>
</div>
</body>
</html>