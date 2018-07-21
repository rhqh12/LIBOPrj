<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>회원 메인 페이지</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css">
<style>

.full-container{
	background: none;
}

#search-form{  
	box-sizing : border-box;
	padding : 25px 20px;
	height: 80px;
}  
	 
	#search-form form{  
		display: flex;	
	}
	  
	#search-form input[type=text]{
		width : 85%;
		border: 1px solid #cccccc;
		border-radius: 2px;
		 padding: 5px; 
		margin-right : 10px; 
	}
	
	#search-form form div{
 		height: 30px;  
		width : 30px;
		flex-grow : 1;
		border-radius: 2px;
		background: url("../../images/zoom.png") no-repeat center;
		background-size : contain;
		cursor: pointer;
	}
	
</style>
</head>
<body>	
<div id="body" class="full-screen bg-morning">
	<!-- 페이지 공통 header -->
	<header id="header">
		<div class="content-container">
			<section>
				<h1>&lt; 경로 알림 설정</h1>
			</section>
			<section>
				<div></div>
			</section>
		</div>
	</header>
	<!-- 페이지 공통 header -->
	
	<div class="full-container">
		<aside id="search-form" class="container">
			<h1 class="hide">검색폼</h1>
			<form action="" method="get">
				<input type="text" placeholder="내용을 입력해주세요">
				<div></div>
			</form>
		</aside>
		
		<main id="main" class="container cont-scroll">
			<aside id="list-article">
				<h1 class="hide">주소 목록</h1>
				<div class="wrapper">
					<article>
						<a href="">
							<h1>귀는 생의 찬미를 듣는다</h1>
							<p>구할 수 있는 것이다 청춘은 인생의 황금시대다 우리는 이구할 수 있는 것이다 청춘은 인생의 황금시대다 우리는 이</p>
						</a>
					</article>
				</div>	
			</aside>
		</main>
		
	</div>
	<!-- menu -->
	<jsp:include page="../../inc/bottom_menu.jsp" />
</div>
</body>
</html>