<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>회원 메인 페이지</title>
<style>
.hide{display:none}
body {
	margin:0px;
}
ul {margin:0px; padding:0px;}
li {list-style: none;}
h1, p, figure {margin:0px;}
#body{
    overflow-y: auto;
	position: fixed;
	width: 100%;
	height: 100%;
	background:url(../images/bg-1.jpg) no-repeat;
	background-size:cover;	
}
	.full-container{
		width:90%;
		margin:0px auto;
		padding-bottom:60px;
	}
	#info-weather{
		position:relative;
		margin-top:10px;
		padding:10px;
		background:rgba(41, 128, 185,0.7);
		line-height:17px;
	}
		#info-weather img {width:20px; vertical-align:top;}
		#info-weather span{
			font-size:13px;			
		}
		#info-weather .weather {
			position: absolute;
			top:10px;
			right:10px;
		}
	#info-transport, #main{
		margin-top:10px;
		padding:10px;
		border:1px solid #ccc;
		background:rgba(255,255,255,0.7);
	}
	#list-article .wrapper {
		position: relative;
	}
		#list-article .wrapper figure{
			position: absolute;
			top:0px;
			left:0px;			
		}
		#list-article .wrapper article{
			margin:15px 0px;
			padding-left:80px;
			min-height:67px;
		}
			#list-article article a {
				color:#000;
				text-decoration:none;
			}
			#list-article article a:hover{
				color:#2449b5;
			}
				#list-article article h1 {
					font-size:1em;
				}
				#list-article article p {
					margin-top:5px;
					font-size:0.8em;
				}
	#list-article li .thumb {
		width:50px;
		height:50px;
	}
	#list-article li .thumb ~ span{
		display: block;
		width:100%;
	}
	#today-letter h1{
		display:inline-block;
		font-weight:normal;
		font-size:0.9em;
	}
	#today-letter span {
		display:inline-block;
		font-weight:bold;
		font-size:0.8em;
	}
	#bottom-menu {
		width:100%;
		height:45px;
		position:fixed;
		bottom:0px;
		left:0px;
		border-top:1px solid #101010;
		background:rgba(255,255,255,0.8);
	}
		#bottom-menu ul {
			display: -webkit-flex;
	  		display: flex;
		    -webkit-align-items: center;
			-ms-flex-align: center;
			align-items: center;
			width:100%;
			height:inherit;
		}
			#bottom-menu li {
				width:25%;
				text-align:center;
				height:inherit;
				background:no-repeat 50%;
				background-size:30px;
			}	
</style>
</head>
<body>	
<div id="body">
	<header>
		<h1>&lt; 경로 목록</h1>
		<span>삭제 버튼</span>
	</header>	
	<div class="full-container">
		<h1 class="hide">리보 회원 메인 페이지</h1>
		<aside id="info-weather">
			<h1 class="hide">날씨 안내</h1>
			<img src="../images/icon-face.png" alt="웃는 아이콘 "/>
			<span>미세먼지 좋음</span>
			<span class="weather"><img src="../images/icon-sun.png" alt="해 아이콘" /></span>
		</aside>
		<aside id="info-transport">
			<h1 class="hide">버스/지하철 안내</h1>
			<span>버스 이미지</span>
			<span>버스 도착 </span>
		</aside>
		<main id="main">
			<h1 class="hide">메인</h1>
			<aside id="today-letter">
				<h1>오늘의 영어</h1>
				<span>lt's time to wake up.</span>
			</aside>
			<aside id="list-article">
				<h1 class="hide">기사 목록</h1>
				<div class="wrapper">
					<figure><img src="../images/main-article-thumb.jpg"></figure>
					<article>
						<a href="">
							<h1>귀는 생의 찬미를 듣는다</h1>
							<p>구할 수 있는 것이다 청춘은 인생의 황금시대다 우리는 이구할 수 있는 것이다 청춘은 인생의 황금시대다 우리는 이</p>
						</a>
					</article>
				</div>	
				<div class="wrapper">
					<figure><img src="../images/main-article-thumb.jpg"></figure>
					<article>
						<a href="">
							<h1>귀는 생의 찬미를 듣는다</h1>
							<p>구할 수 있는 것이다 청춘은 인생의 황금시대다 우리는 이구할 수 있는 것이다 청춘은 인생의 황금시대다 우리는 이</p>
						</a>
					</article>
				</div>	
				<div class="wrapper">
					<figure><img src="../images/main-article-thumb.jpg"></figure>
					<article>
						<a href="">
							<h1>귀는 생의 찬미를 듣는다</h1>
							<p>구할 수 있는 것이다 청춘은 인생의 황금시대다 우리는 이구할 수 있는 것이다 청춘은 인생의 황금시대다 우리는 이</p>
						</a>
					</article>
				</div>
				<div class="wrapper">
					<figure><img src="../images/main-article-thumb.jpg"></figure>
					<article>
						<a href="">
							<h1>귀는 생의 찬미를 듣는다</h1>
							<p>구할 수 있는 것이다 청춘은 인생의 황금시대다 우리는 이구할 수 있는 것이다 청춘은 인생의 황금시대다 우리는 이</p>
						</a>
					</article>
				</div>
				<div class="wrapper">
					<figure><img src="../images/main-article-thumb.jpg"></figure>
					<article>
						<a href="">
							<h1>귀는 생의 찬미를 듣는다</h1>
							<p>구할 수 있는 것이다 청춘은 인생의 황금시대다 우리는 이구할 수 있는 것이다 청춘은 인생의 황금시대다 우리는 이</p>
						</a>
					</article>
				</div>																			
			</aside>
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