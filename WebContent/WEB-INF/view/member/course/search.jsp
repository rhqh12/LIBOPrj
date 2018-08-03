<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" type="text/css" href="../../css/style.css">
<link rel="stylesheet" type="text/css" href="../../css/member/course/search.css">
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous" ></script>
<script src="../../js/member/course/search.js" type="text/javascript"></script>
<title>회원 메인 페이지</title>
<script type="text/javascript">
</script>
 
</head>
<body>
<div id="body" class="full-screen bg-morning">
	<!-- 페이지 공통 header -->
	<header id="header">
		<div class="content-container">
			<section class="title">
				<h1>&lt; <span>경로 알림 설정</span></h1>
			</section>
			<section class="fav-menu">
				<input type="button" value="즐겨찾기" />
			</section>
		</div>
	</header>
	<!-- 페이지 공통 header -->
	
	<div class="full-container">
		<aside id="search-form" class="container">
			<h1 class="hide">검색폼</h1>
			<form action="" method="get" onsubmit="return false;">
				<input type="text" class="text-address" placeholder="내용을 입력해주세요">
				<div class="search-btn"></div><!-- 찾기 버튼 -->
			</form>
		</aside>
		
		<main id="main" class="container cont-scroll">
			<aside id="address-list">
				<h1 class = "hide">장소</h1>
				<div class="wrapper" id="address-box">
<!-- 				
					<section class="address-item">
						<ul>
							<li><span class="ad-title"></span>나는 대표<span class="ad-sm">나는타입</span></li>
							<li><span class="ad-sm ad-address">나는 주소</span></li>
							<li><span class="ad-tel">나는 전화번호</span></li>
						</ul>
						<div class="fav-item empty-star">
						</div>
					</section> --> 
				</div> 
				<div class="search-info">주소를 입력해주세요</div>
			</aside>
		</main> 
		
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
	<input type="hidden" name="type" value="${type }">
</form>
</body>
</html>