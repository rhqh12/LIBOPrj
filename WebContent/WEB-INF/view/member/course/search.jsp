<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous" ></script>
<title>회원 메인 페이지</title>
<link rel="stylesheet" type="text/css" href="../../css/style.css">
<style>

.full-container{
	background: none;
	 height: calc(100% - 110px);
}
 
/*--search-form---------------------------------------*/

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

/*====address-list===============================*/



	#address-list .address-item {
		box-sizing : content-box; 
		margin-bottom: 20px; 
		padding-bottom : 20px;
		border-bottom: 1px solid #979797;
	}
	
	#address-list .address-item:first-child {
		margin-top: 20px; 
	}
	 
	#address-list .ad-title{
		font-weight: bold;
		font-size: 1.1em;
	} 
	#address-list .ad-sm{
		color: #4C4C4C; 
	}
	#address-list .ad-tel{
		color: #0054FF;
	}
	
	#address-list .search-info{
		position: absolute;
		width : 200px; 
		text-align : center;
		left: 50%;  
		top: 50%;
		margin-left: -100px;
		color: #4C4C4C; 
	}

	
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	var type = $("#update-form input[name=type]").val();
	if(type == "workplace"){
		$(".title span").text("출근지 설정");
	} else{
		$(".title span").text("퇴근지 설정");
	}
		
	
	$(document).on("click",".address-item",function(){
		var address = $(this).find(".ad-address").text();
		var title = $(this).find(".ad-title").text();
		if(type == "workplace"){
			$("#update-form input[name=workplace]").val(title);
			$("#update-form input[name=workplaceAddress]").val(address);
		} else{
			$("#update-form input[name=home]").val(title);
			$("#update-form input[name=homeAddress]").val(address);
		}
		$("#update-form").submit();
	}) 
	
	$(".search-btn").on("click", function(){
		var address = $(".text-address").val();
		if(address == ""){
			alert('주소를 입력해주세요');
			return;
		}
		var params = "address=" + address;
	     $.ajax({      
	        type:"GET",
	        dataType: "text",
	        async: false,
	        url:"address",      
	        data:params,      
	        success:function(args){
	        	createAddress(args);
	        },   
	        error:function(e){
	        	
	        }  
	    }); 
	});
	
	$(".title").on("click", function(){
		console.log('dfds');
		$("#update-form").submit();
	})
	
})

function createAddress(args){
	var address = JSON.parse(args);
	var list = address.items;
	var template = "";
	if(list.length > 0){
		list.forEach(function(o){//address
			template += "<section class='address-item'>";
			template += "	<ul>";
			template += "		<li><span class='ad-title'>"+o.title+"</span> <span class='ad-sm'>"+o.category+"</span></li>";
			template += "		<li><span class='ad-sm ad-address'>"+o.address+"</span></li>";
			template += "		<li><span class='ad-tel'>"+o.telephone+"</span></li>";
			template += "	</ul>";
			template += "</section>";
		})
		$(".search-info").hide();
	} else{
		$(".search-info").text("검색 결과가 없습니다");
		$(".search-info").show();
	}
	$("#address-box").html(template);
}


</script>
 
</head>
<body>
<div id="body" class="full-screen bg-morning">

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


	<!-- 페이지 공통 header -->
	<header id="header">
		<div class="content-container">
			<section class="title">
				<h1>&lt; <span>경로 알림 설정</span></h1>
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
			<form action="" method="get" onsubmit="return false;">
				<input type="text" class="text-address" placeholder="내용을 입력해주세요">
				<div class="search-btn"></div><!-- 찾기 버튼 -->
			</form>
		</aside>
		
		<main id="main" class="container cont-scroll">
			<aside id="address-list">
				<h1 class = "hide">장소</h1>
				<div class="wrapper" id="address-box"></div>	
				<div class="search-info">주소를 입력해주세요</div>
			</aside>
		</main> 
		
	</div>
	<!-- menu -->
	<jsp:include page="../../inc/bottom_menu.jsp" />
</div>
</body>
</html>