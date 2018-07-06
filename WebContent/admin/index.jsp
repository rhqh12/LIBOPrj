
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
<title>관리자 페이지</title>
</head>
<body>
	<div>
		<h3>공지사항</h3>
		<table border="1">
			<thead>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>내용</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
			</thead>
			<tbody>
				<%
					for (Notice n : list) {
				%>
				<tr>
					<td><%=n.getId()%></td>
					<td><%=n.getSubject()%></td>
					<td><%=n.getConstant()%></td>
					<td><%=n.getWriterId()%></td>
					<td><%=n.getDueDate()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<ul>
		<li><a href="../">홈으로</a></li>
		<li><a href="./notice/reg.html">공지사항 쓰기</a></li>
		<li><a href="./notice/edit.html">공지사항 수정</a></li>
	</ul>
	<h1>관리자 페이지</h1>
</body>
</html>