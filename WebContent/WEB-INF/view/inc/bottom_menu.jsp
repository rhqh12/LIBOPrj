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
		</ul>
	</nav>