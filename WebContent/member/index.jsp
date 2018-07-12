<%@page import="javax.xml.xpath.XPath"%>
<%@page import="javax.xml.xpath.XPathFactory"%>
<%@page import="com.libo.web.api.APIExamSearchNews"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
APIExamSearchNews api = new APIExamSearchNews();

StringBuffer list = new StringBuffer();
list = api.getNews("자바");

XPath xpath = XPathFactory.newInstance().newXPath();
		
/* for(Object list: arr){
    if ( o instanceof JSONObject ) {
        parse((JSONObject)o);
    }
} */
/* import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

String jsonStr = "{"
			+ "		code:'1000',"
			+ "		name:'포도'"
			+ "}"
			;

JSONParser parser = new JSONParser();
Object obj = parser.parse( jsonStr );
JSONObject jsonObj = (JSONObject) obj;

String code = (String) jsonJob.get("code");
String name = (String) jsonJob.get("code"); */
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>회원 메인 페이지</title>
<link href="../css/style.css" type="text/css" rel="stylesheet"/>
<style>
.container {
	padding:10px;
	margin:10px 10px 0px;
	border:1px solid #ccc;
	background:rgba(255,255,255,0.7)
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
</style>
</head>
<body>	
<div id="body" class="full-screen">
	<aside id="info-weather" class="container">
		<h1 class="hide">날씨 안내</h1>
		<img src="../images/icon-face.png" alt="웃는 아이콘 "/>
		<span>미세먼지 좋음</span>
		<span class="weather"><img src="../images/icon-sun.png" alt="해 아이콘" /></span>
	</aside>
	<aside id="info-transport" class="container">
		<h1 class="hide">버스/지하철 안내</h1>
		<span>버스 이미지</span>
		<span>버스 도착 </span>
	</aside>
	<main id="main" class="container">
		<h1 class="hide">리보 회원 메인 페이지</h1>
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
	<jsp:include page="../inc/bottom_menu.jsp"></jsp:include>
</div>
</body>
</html>