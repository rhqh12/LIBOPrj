<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 페이지</title>
</head>
<body>
	<header>
		<h1>리보</h1>
	</header>
	<main>
	<h1>회원가입</h1>
	<h3>회원가입폼</h3>
	<form action="join" method="post">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" required="required"
					placeholder="영문과 숫자 6~20자 이내"><input type="button"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" required="required"
					placeholder="비밀번호 입력"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" required="required"
					placeholder="비밀번호 확인"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" required="required" placeholder="닉네임 입력"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender"><label>남성</label>
					<input type="radio" name="gender"><label>여성</label></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date"><input type="radio" name="solar"><label>양력</label>
					<input type="radio" name="solar"><label>음력</label></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit"></td>
		</table>
	</form>
	</main>
</body>
</html>