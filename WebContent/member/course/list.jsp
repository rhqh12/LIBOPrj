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
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous" ></script>
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

// 스크립트로 이벤트 걸기
// 페이지 이동 함수 만들기

$(document).ready(function(){
	
	$("#plus").on("click", function(){
		moveDetail();
	});
	
	$(".list-item").on("click", function(){
		moveDetail(this);
	});
	
	$("#sub-box").on("click", function(){
		$("#sub-menu").show(200);
	});
	
	$("#cancel-menu").on("click", function(){
		$("#sub-menu").hide();
	});
	
	$("#delete-menu").on("click", function(){
		showDelete();
	});
	
	$(".alarm").on("click", function(){
		updateAlram(this);
	});
	
});

function moveDetail(element){
	if(element != undefined){
		var id = $(element).parents("li").attr('id');
		$("#course-id").attr("value" , id);
	}
	$("#detail-form").attr({action:"detail", method:'post'}).submit();
} 

function showDelete(){
	// show delete 버튼을 누르면 onclick 속성을 바꿔야 한다.
	$(".delete-check").show(200);
	$("#sub-menu").hide();//속성 바꿔라
	$("#delete-menu").hide();// 지금 추가
	$("#sub-menu").attr('class','tr-menu');
	$("#sub-menu").show(200);//속성 바꿔라
	$("#sub-box").hide();
	
	$(".switch-item").hide(200); // 스위치 버튼 숨기기 //23
	
	// 이벤트를 바꿔준다.
	$(".list-item").off();
	$(".list-record").on("click", function(){
		deleteCheck(this);
		
		///####
	});
	
	$("#delete-menu").off();
	$("#delete-menu").on("click", function(){
		deleteCourse();		
	});
	
	$("#cancel-menu").off();
	$("#cancel-menu").on("click", function(){
		//모두 되돌리기
		rollback();
	});
}

function deleteCourse(){
	// 만약 체크값이 하나도 있다면
	if($(".delete-check").is(":checked")){
		$("#delete-form").submit();
	} 
}

function rollback(){
	$(".delete-check").hide(200);
	$("#sub-menu").hide();//속성 바꿔라
	$("#sub-menu").attr('class','df-menu');
	$("#sub-box").show(200);
	
	//지금 추가
	$("#delete-menu").show(); //삭제 버튼
	$("#delete-menu").css({"display" : "block"}); //삭제 버튼
	
	$(".switch-item").show(200); // 스위치 버튼 보이기 //23
	 
	
	$("#delete-menu").off();
	$("#delete-menu").on("click", function(){
		showDelete();
	});
	
	$("#cancel-menu").off();
	$("#cancel-menu").on("click", function(){
		$("#sub-menu").hide();
	});
	
	$(".list-record").off();
	$(".list-item").on("click", function(){
		moveDetail(this);
	});
	
	$(".delete-check").prop("checked", false);
	
}

// delete 체크하는 함수
function deleteCheck(element){
	//element의 check박스를 빼던가 하자.
	if(element != undefined){
		var checkbox = $(element).children("div").eq(0).children('input');
		if($(checkbox).is(":checked")){
			$(checkbox).prop('checked', false);
			alert('해제');
		} else{
			$(checkbox).prop('checked', true);
			alert('선택');
		}
	}
	
	if($(".delete-check").is(":checked")){
		$("#delete-menu").show(); //삭제 버튼
		$("#delete-menu").css({"display" : "inline-block"}); //삭제 버튼
	} else{
		$("#delete-menu").hide(); //삭제 버튼
	}
}


function updateAlram(element){
	// 이 element의 부모 요소의 id를 알아내야 한다.
	var id = $(element).val();
	var flag = "N";
	if($(element).is(":checked"))
		flag = "Y";
	var params = "id=" + id + "&flag=" + flag;
     $.ajax({      
        type:"POST",
        dataType: "text",
        async: false,
        url:"updateAlarm",      
        data:params,      
        success:function(s){
        },   
        error:function(e){}  
    });  
}

</script>
</head>
<body>	

<div id="body" class="full-screen bg-morning">

<form id="detail-form">
	<input type="hidden" name="id" id="course-id">
</form>

<!-- fix 메뉴 -->
<!-- df-menu와 tr-menu  -->
<div class="df-menu" id="sub-menu">
	<ul>
		<li id="delete-menu">삭제</li>
		<li id="cancel-menu">취소</li>
	</ul>
</div>

	<!-- header 영역 -->
	<header id="header">
		<div class="content-container">
			<section> 
				<h1>&lt; 경로 목록</h1>
			</section>
			<section id="sub-box">
				<div></div>
			</section>
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
			<div id="plus"></div>
		</section>
	</main>
	
	<nav id="bottom-menu">
		<h1 class="hide">하단 메뉴</h1>
		<ul>
			<li><a href="../">홈</a></li>
			<li><a href="../place/">위치</a></li>
			<li><a href="../alert/list.html">알람</a></li>
			<li><a href="../menu/set/list.html">설정</a></li>
		</ul>
	</nav>
	
</div>	
</body>
</html>