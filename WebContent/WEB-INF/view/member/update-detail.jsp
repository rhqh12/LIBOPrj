<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<title>회원 정보 수정</title>
<style>
</style>
</head>
<body>
	<div id="body" class="full-screen bg-morning">
		<header id="header">
			<div class="content-container clearfix">
				<section>
					<h1><a href="./menu/set/list">&lt; 회원 정보 수정</a></h1>
				</section>
			</div>
		</header>
		<div class="flex-container">
		<main id="main">
	<h1>회원 정보 수정 폼</h1>
	<form action="update-detail" method="post">
	<section id="update-table">
		<table border="1" class="table">
		<tr>
		<th>아이디</th>
		<td>${member.id}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
		<td><input type="password" required="required" name="password"
			placeholder="변경할 비밀번호"/></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" required="required" name="passwordCheck"
			placeholder="변경할 비밀번호 확인"/></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input value="${member.nickname}" type="text" required="required" name="nickname" placeholder="닉네임을 입력해주세요."></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${member.gender}</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${member.birthday}</td>
		</tr>
		<tr>
			<td colspan = "2"><input type="submit"></td>
		
		</table>
		</section>
		</form>

		</header>
	</div>

</body>
</html>