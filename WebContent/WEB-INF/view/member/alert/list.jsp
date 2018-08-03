<%@page import="com.libo.web.service.member.AlertService"%>
<%@page import="com.libo.web.entity.Alert"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>알람</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link href="../../css/style.css" type="text/css" rel="stylesheet"/>
<link href="../../css/anypicker.css" type="text/css" rel="stylesheet" />
<script src="//code.jquery.com/jquery-1.11.3.js"></script>
<script src="../../js/anypicker.js"></script>
<script src="../../js/dataMulti.js"></script>
<style>
#alert-list h1,
.del-chk {
	display:none;
}
#main {
	position: relative;
}

.btn-add {
	position : fixed;
	right : 10px;
	bottom : 80px;
	margin-left : auto;  
	width : 60px; 
	height : 60px; 
	background: url("../../images/plus.png") no-repeat center;
	background-size: cover;
	text-indent:-9999px;
}
/*----상단 서브 메뉴-------------------------------------*/
#sub-box div{  
	width : 29px; 
	height : 29px;
	background: url("../../images/menu.png") no-repeat center;
	background-size: cover; 
}

.df-menu {
	display : none;
	position: fixed;
	right: 10px;
	top: 15px; 
	width: 100px; 
	border-radius : 3px; 
	background: rgba(255,255,255, 0.9);
	text-align: center;
	line-height: 50px;
	z-index:999;
}
	.df-menu > ul > li{
		font-size: 1.2em;
		font-weight: bold;
	}
	
	.df-menu > ul > li:first-child{  
		border-bottom: 1px solid #979797;
	}
	
.tr-menu {
	display : none;
	position: fixed;
	right: 10px;
	top: 5px; 
	border-radius : 3px; 
	text-align: center;
	line-height: 50px;
}
	.tr-menu > ul > li{
		width : 60px;
		font-size: 1em;
		font-weight: bold;
		background: rgba(255,255,255, 0.6);
		display: inline-block;
	}

/*----- 목록 -----*/
.delete-check{
	width: 20px;
	height: 20px;
	display: none;
	margin-right : 20px;
}

</style>

<script type="text/javascript">
window.addEventListener("load", function(){ 

	var sel = AlarmSelector();
	var list = document.querySelector(".sel-list");
	list.onclick = function(e){
		//LI찾기
		var el = e.target;
		for(; el.nodeName != "LI"; el = el.parentElement);
		if(e.target.nodeName == "INPUT" && e.target.classList.contains("alarm")) return;

		if(e.target.classList.contains("slider") && e.target.nodeName == "SPAN" ) {
			var input = el.querySelector("input.alarm");
			updateAlram(input);
			return;
		};

		//LI변경
		if( el.classList.contains("list-record") ){
			if(sel.subMenu.style.display == "block") {
				deleteCheck();
			} else {
				moveDetail(el);
			}
		} 
	}
	
	
	//menuShowChk
	sel.subBox.onclick = function() { showDelete(); };
	sel.cancelMenu.onclick = function() { hideDelete(); };
	sel.deleteMenu.onclick = function() { deletData() };
	
});
</script>
</head>
<body>
<div id="body" class="full-screen bg-morning">	
	<!-- header 영역11 -->
	<header id="header">
		<div class="content-container clearfix">
			<section>
				<h1>&lt; 알람설정</h1>
			</section>
			<section id="sub-box" style="display: block;">
				<div></div>
			</section>			
		</div>
		<div class="df-menu" id="sub-menu">
			<ul>
				<li id="delete-menu">삭제</li>
				<li id="cancel-menu">취소</li>
			</ul>
		</div>
	</header>		
	<!-- main 영역 -->
	<main id="main" class="full-container bg-white">
		<section id="alert-list" class="sel-list cont-scroll">
			<h1>알람 표</h1>
			<form id="delete-form" action="delete" method="post">
			<ul class="list set">
				<c:forEach var="a" items="${list }">
				<li class="list-record" data-id="${a.id}">
					<input type="checkbox" name="delete-id" value="${a.id}" class="delete-check" />
					<%-- <a href="detail?id=${a.id}"> --%>
						<div class="col-sm">
							<span>${a.time }</span>
						</div>
						<div class="col-au col-week">
							<c:if test="${!empty a.week}">${a.week}</c:if>
							<c:if test="${empty a.week}">${a.specificDate}</c:if>
						</div>
						<div class="col-xs switch-item">
						<c:choose>
						    <c:when test="${a.alarm eq 'Y'}">
						   		<label class="switch"><input value="${a.id }" class="alarm" type="checkbox" checked><span class="slider round"></span></label>
						    </c:when>
						    <c:otherwise>
						      <label class="switch"><input value="${a.id }" class="alarm" type="checkbox"><span class="slider round"></span></label>
						    </c:otherwise>
						</c:choose>
						</div>
				</li>
				</c:forEach>																									
			</ul>
 			</form>			
		</section>
		<div>
			<a href="reg" class="btn-add" id="plus"><span>+</span></a>
		</div>
	</main>
	<jsp:include page="../../inc/bottom_menu.jsp"></jsp:include>
</div>	
</body>
</html>