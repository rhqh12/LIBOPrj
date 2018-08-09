<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ctx = request.getContextPath();
%>
	<nav id="bottom-menu">
		<h1 class="hide">하단 메뉴</h1>
		<ul>
			<li><a href="<%=ctx%>/member/">홈</a></li>
			<li><a href="<%=ctx%>/member/course/list">위치</a></li>
			<li><a href="<%=ctx%>/member/alert/list">알람</a></li>
			<li><a href="<%=ctx%>/member/menu/set/list">설정</a></li>
			<!-- <li id="btn-mic" class="off">음성
			<span class="final" id="final_span" style="display:none;"></span>
			<span class="interim" id="interim_span" style="display:none;"></span>
			</li> -->
		</ul>
	</nav>

	<div class="alram-on">
		<div class="flex-container align-items-center">
			<div class="item">
				<div class="box wrapper">
				
					<audio id="audio" src="<%=ctx%>/ending.mp3"></audio>
					<img src="<%=ctx%>/images/clock-icon1.png" />
					<div><span class="time">09시 00분</span><span style="font-size:15px;padding-left:5px;">알람</span></div>
					<button class="close-btn">닫기</button>
				</div>	
			</div>
		</div>		
	</div>