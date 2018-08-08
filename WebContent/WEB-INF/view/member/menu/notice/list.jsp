<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalavble=no">
<title>관리자 페이지</title>

<script type="text/javascript">
window.addEventListener("load", function(){
    var noticeList = document.querySelector("#notice-list");

    noticeList.onclick = function(e){
        var el = e.target;
        el = el.parentElement;
        if(el.nodeName != "ARTICLE")
			return;
		
		var content = el.querySelector(".content");
		content.classList.toggle("show");
    };

});
</script>

<style>
/*-------------reset------------*/
#title {
	display: none;
}

#notice-list .content {
	height: 0px;
	overflow: hidden;
	transition : 400ms height ease;
	margin-top : 10px;
	line-height: 25px;
	font-size:0.9em;
}  

#notice-list .show {
	height : 100px;
}

#notice-list>h1 {
	display: none;
}

#notice-list>article {
	border-bottom: 1px solid #aaa;
	padding: 20px 25px 10px 25px;
	cursor: pointer;
}

#notice-list>article>h1 {
	font-size: 14px;
	font-weight: bold;
	color: #555;
}

#notice-list .due-date {
	font-size: 12px;
	font-weight: lighter;
	color: #aaa;
}

</style>
<link href="../../../css/style.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<div id="body" class="full-screen bg-morning">
		<header id="header">
			<div class="content-container clearfix">
				<section>
					<h1><a href="../set/list">&lt; 공지 사항</a></h1>
				</section>
			</div>
		</header>
		<main class="full-container">
		<section id="notice-list">
			<h1>공지사항</h1>
			<c:forEach items="${list }" var="n">		
				<article>
					<h1>${n.subject }</h1>
					<span class="due-date">${n.dueDate }</span>
					<div class="content">${n.constant }</div>
				</article>
			</c:forEach>
		</section>
		</main>
		<jsp:include page="../../../inc/bottom_menu.jsp" />
		<h1 id="title">관리자 페이지</h1>
	</div>
</body>
</html>