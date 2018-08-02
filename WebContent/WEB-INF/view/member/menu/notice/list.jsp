<%@page import="com.libo.web.entity.Notice"%>
<%@page import="java.util.List"%>
<%@page import="com.libo.web.service.member.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int pageNo = 1;
	String pageNo_ = request.getParameter("p");

	if (pageNo_ != null && !pageNo_.equals(""))
		pageNo = Integer.parseInt(pageNo_);
	NoticeService service = new NoticeService();
	List<Notice> list = service.getNoticeList(pageNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalavble=no">
<title>관리자 페이지</title>
<style>
/*-------------reset------------*/

#title{
display: none;
}
#notice-list .content{
display: none;
}

#notice-list{
font-family: 돋움, Arial, sans-serif;
font-size: 15px;
font-weight: bold;
}

#notice-list>h1{
display: none;
}
#notice-list>article{
border-bottom: 2px solid #aaa;
padding: 10px;
}
#notice-list>article>h1{
font-family: 돋움, Arial, sans-serif;
font-size: 20px;
font-weight: bold;
color: #555;
}
#notice-list .due-date{
font-family: 돋움, Arial, sans-serif;
font-size: 12px;
font-weight: lighter;
color: #aaa;
}
</style>
<link href="../../../css/style.css" type="text/css" rel="stylesheet"/>
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
				<%
					for (Notice n : list) {
				%>
				<article>
				<h1><%=n.getSubject()%></h1>
				<span class="due-date"><%=n.getDueDate()%></span>
				<div class="content"><%=n.getConstant()%></div>
				</article>
				<%
					}
				%>
			
	</section>
	</main>
	<jsp:include page="../../../inc/bottom_menu.jsp"/>
	<h1 id="title">관리자 페이지</h1>
	</div>
</body>
</html>