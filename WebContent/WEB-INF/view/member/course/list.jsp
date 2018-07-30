<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>회원 메인 페이지</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css">
<link rel="stylesheet" type="text/css" href="../../css/member/course.css">
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous" ></script>
<script src="../../js/dataMulti.js"></script>
<style>

#course-list{
	text-align: center;
	padding-bottom: 50px;
}
 
#course-list h1 {
	display:none;
}

#course-list > ul{
	overflow: hidden; 
}

#course-list li{ 
	line-height: 20px; 
	margin: 30px 0px; 
} 

#sub-box div{  
	width : 29px; 
	height : 29px;
	background: url("../../images/menu.png") no-repeat center;
	background-size: cover; 
}

#list-head{
	text-align: center;
	border-bottom: 1px solid #979797;
	width: inherit;
}
	
#plus{ 
	position : fixed;
	right : 10px;
	bottom : 80px;
	margin-left : auto;  
	width : 60px; 
	height : 60px; 
	background: url("../../images/plus.png") no-repeat center;
	background-size: cover;
}
 
.bg-white{
	background: rgba(255,255,255,0.7);
	/* 으하하하하하 */
}

.col-week{
	line-height: 30px;
}

.full-container{
    height: calc(100% - 110px);
}

/*----상단 서브 메뉴-------------------------------------*/
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

/*----상단 서브 메뉴-------------------------------------*/

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
	var listRecord = document.querySelectorAll(".list-record");
	multiOnclicks(listRecord, ()=>{
			if(getDisplay(sel.subMenu.style.display)) {
				deleteCheck();
			} else {
				if( event.target.classList[0] == "slider" ) return;
				moveDetail(event.currentTarget);
			}
		}
	);
	
	sel.subBox.onclick = () => { showDelete(); };
	sel.cancelMenu.onclick = () => { hideDelete(); };
	sel.deleteMenu.onclick = () => { deletData() };
	multiOnclicks(sel.deleteCheck, ()=>{ deleteCheck(event.target); } ); 

	var alarms = document.querySelectorAll(".alarm");
	multiOnclicks(alarms, ()=>{ updateAlram(event.target); } ); 
	
});
</script>
</head>
<body>	

<div id="body" class="full-screen bg-morning">

<form id="update-form">
	<input type="hidden" name="id" value="0" />
	<input type="hidden" name="type" value="list" />
</form>
	<!-- header 영역 -->
	<header id="header">
		<div class="content-container clearfix">
			<section>
				<h1>&lt; 경로 목록</h1>
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
	
	<aside id="list-head" class="bg-white">
		<ul class="list set">
			<li>
				<div class="col-xs col-time">
					출근 
				</div>
				<div class="col-xs col-time">
					퇴근
				</div>
				<div class="col-au">
					요일 
				</div>
				<div class="col-sm col-sm">
					알람설정
				</div>
			</li>
		</ul>
	</aside>
	
	<main id="main" class="full-container bg-white">
		<section id="course-list" class="cont-scroll">
			<h1>경로 표</h1>
			<form id="delete-form" action="delete" method="post">
				<ul class="list set">
				<c:forEach items="${list }" var="c">
					<li class="list-record" id="${c.id }"><!-- ### -->
						<div>
							<input type='checkbox' class='delete-check' name='delete-id' value="${c.id }">
						</div>
					
						<div class="col-xs col-time list-item"> 
							${c.home }${c.startingTime }
						</div>
						<div class="col-xs col-time list-item">
							${c.workplace }${c.endingTime }
						</div>
						<div class="col-au list-item"> 
							${c.week }
						</div>
						
						<div class="col-sm switch-item">
						<c:choose>
						    <c:when test="${c.startingAlarm eq 'Y' or c.endingAlarm eq 'Y'}">
						   		<label class="switch"><input value="${c.id }" class="alarm" type="checkbox" checked><span class="slider round"></span></label>
						    </c:when>
						    <c:otherwise>
						      <label class="switch"><input value="${c.id }" class="alarm" type="checkbox"><span class="slider round"></span></label>
						    </c:otherwise>
						</c:choose>
						</div>
					</li>							
				</c:forEach>
				</ul>
			</form>
			<div><a href="detail?id=0&type=list" class="btn-add" id="plus"></a></div>
		
		</section>
	</main>
	
	<jsp:include page="../../inc/bottom_menu.jsp"></jsp:include>
</div>	
</body>
</html>