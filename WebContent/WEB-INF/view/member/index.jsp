<%@page import="javax.xml.xpath.XPath"%>
<%@page import="javax.xml.xpath.XPathFactory"%>
<%@page import="com.libo.web.api.APIExamSearchNews"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>회원 메인 페이지</title>
<link href="../css/style.css" type="text/css" rel="stylesheet"/>
<script src="//code.jquery.com/jquery-1.11.3.js"></script>
<script src="../js/main.js"></script>
<style>
#main {
	height: calc(100% - 125px)
}
#info-weather{
	position:relative;
	border:0px;
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
}
#list-article article {
	position: relative;
	cursor: pointer;
}
	#list-article article figure{
		position: absolute;
		top:0px;
		left:0px;			
		width:60px;
		height:67px;
	}
	#list-article article figure img {
		width:60px;
		height:67px;
	}
	
	#list-article article div{
		margin:15px 0px;
		padding-left:80px;
		min-height:67px;
	}
		#list-article article a:hover{
			color:#2449b5;
		}
			#list-article article .title {
				display:block;
				font-size:1em;
				font-weight:bold; 
			}
			#list-article article .content {
				display:block;
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
#info-transport {
	position: relative;
}

#info-transport a {
	padding-left:20px;
}
.icon {
	position: absolute;
	width:16px;
	height:16px;
	top:10px;
	left:10px;
}
.icon-plus {
	background-color: #000;
	border-radius:8px;
	-webkit-border-radius:8px;
	-moz-border-radius:8px;
	width: 16px;
	height: 16px;
	top:10px;
	left:10px;
}
.icon-plus:after {
	background-color: #fff;
	width: 8px;
	height: 2px;
	border-radius: 1px;
	-webkit-border-radius: 1px;
	-moz-border-radius: 1px;
	position: absolute;
	top:7px;
	left: 4px;
	content:"";
}
.icon-plus:before {
	background-color: #fff;
	width: 2px;
	height: 8px;
	border-radius: 1px;
	-webkit-border-radius: 1px;
	-moz-border-radius: 1px;
	position: absolute;
	top:4px;
	left: 7px;
	content:"";
}
</style>
</head>
<body>	
<div id="body" class="full-screen bg-morning">
	<aside id="info-weather" class="container">
		<h1 class="hide">날씨 안내</h1>
		<img src="../images/icon-face.png" alt="웃는 아이콘 "/>
		<span>미세먼지 좋음</span>
		<span class="weather"><img src="../images/icon-sun.png" alt="해 아이콘" /></span>
	</aside>
	<aside id="info-transport" class="container">
		<h1 class="hide">버스/지하철 안내</h1>
		<c:if test="${empty course }">
			<a href="./course/list"><span class="icon icon-plus"></span>당신의 일상을 올려주세요</a>
		</c:if>
		<c:if test="${!empty course }">
			<c:forEach items="${course }" var="cos">		
				<div>
					<span>${cos.workplace }</span>
					<span>${cos.startingTime } </span>									
				</div>
			</c:forEach>				
		</c:if>
	</aside>
	<main id="main" class="container cont-scroll">
		<h1 class="hide">리보 회원 메인 페이지</h1>
		<aside id="today-letter">
			<h1>오늘의 영어</h1>
			<span>lt's time to wake up.</span>
		</aside>
		<aside id="list-article">
			<h1 class="hide">기사 목록</h1>
			<c:forEach var="n" items="${list}">
				<c:set var="imgSrc" value="../images/main-article-thumb.jpg" />
				<c:if test="${!empty n.imgSrc}">
					<c:set var="imgSrc" value="${n.imgSrc }" />
				</c:if>
				<article class="wrapper" data-url="${n.link}">
					<figure><img src="${imgSrc }"></figure>
					<div>
						<span class="title">${n.subject }</span>
						<span class="content">${n.content }</span>
					</div>
				</article>																		
			</c:forEach>
		</aside>
	</main>	
	<jsp:include page="../inc/bottom_menu.jsp"></jsp:include>
</div>
<div class="artice-iframe-wrapper">
	<div class="iframe-close-btn"></div>
</div>
</body>
</html>