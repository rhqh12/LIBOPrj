<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>회원 메인 페이지</title>
<link rel="stylesheet" type="text/css" href="../../css/common.css">
<style>

body {margin:0px;}
ul {margin:0px; padding:0px;}
li {list-style: none;}
h1, p, figure{margin:0px;}

/*------------ reset -------------*/

.hide{display:none}

.content-container {
	height: 100%;
	margin-left: auto;
	margin-right: auto;
}  

.full-container{
	width:100%;
	margin:0px auto;
	padding-bottom:60px;
}

#body{
    overflow-y: auto;
	position: fixed;
	width: 100%;
	height: 100%;
	background:url(../../images/bg.jpg) no-repeat;
	background-size:cover;	
}

	#header {
		height: 60px; 
		box-sizing: content-box; 
		background: #dddddf;  
		font-size: 0.9em;
	}

		#header .content-container {
			display: flex;
		}  
	
			#header section:nth-child(1){
				width : 95%;
				padding: 15px;  
			}
			#header section:nth-child(2){
				padding: 15px;   
			}
	
				#header section:nth-child(2) div{  
					width : 29px; 
					height : 29px;
					background: url("../../images/menu.png") no-repeat center;
					background-size: cover; 
				}
	
	#main{
		border:1px solid #ccc; 
		background:rgba(255,255,255,0.6);
	}
	
	#search-form{  
		box-sizing : border-box;
		padding : 15px 20px;
		height: 80px;
		display: flex;
	}  
	 
	#search-form form{  
		width: 100%;
	}
	  
	#search-form input[type=text]{
		width : 80%;
		border: 1px solid #cccccc;
		height: 25px;
		border-radius: 2px;
		padding: 5px;
	}
	
	#search-form input[type=button]{
		box-sizing : content-box;
		border: 1px solid #cccccc;
		height: 25px;
		border-radius: 2px;
		padding: 5px;
		display: inline-flex; 
	}


</style>
</head>
<body>	
<div id="body">
	<!-- header 영역 -->
	<header id="header">
		<div class="content-container clearfix">
			<section>
				<h1>&lt; 경로 알림 설정</h1>
			</section>
			<section>
				<div></div>
			</section>
		</div>
	</header>	
	
	<div class="full-container">
		<main id="main">
			<h1 class="hide">검색</h1>
			<section id="search-form">
				<h1 class="hide">검색폼</h1>
				<form action="" method="get">
					<input type="text" placeholder="내용을 입력해주세요" />
					<input type="button" />
				</form>
			</section>
			<section>
				<h1 class="hide">검색 결과</h1>
				<div></div>			
			</section>
		</main>	
		<aside id="bottom-menu">
			<h1 class="hide">하단 메뉴</h1>
			<ul>
				<li><a href="1">홈</a></li>
				<li><a href="2">위치</a></li>
				<li><a href="3">알람</a></li>
				<li><a href="4">설정</a></li>
			</ul>
		</aside>
	</div>
</div>
</body>
</html>