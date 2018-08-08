<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/style.css" type="text/css" rel="stylesheet" />
<title>회원 가입 페이지</title>
<style>
#body{
background: #4F97D5;
}
#main>h1{
display: none;
}
table{
border-collapse: collapse;
}
td{
padding: 0px;}
.table{
width: 100%;
border-top: 2px solid #000;
table-layout: fixed;
background: #fff;
}
.table tr{
height: 30px;
}
header h1{
text-align: center;
font-size: 35px;
font-weight: bold;
font-family: 돋움, Arial, sans-serif;
}
.joinButton{
	text-align: center;
	padding: 10px;
	border: 2px solid #000;
}
</style>
</head>
<body>
<div id="body" class="full-screen bg-morning">
	<header id="header">
	<section>
		<h1>리보</h1>
		</section>
	</header>
		<div class = "flex-container">
		<div class = "">
		<div class = "">
		<main id="main">

	<h1>회원가입폼</h1>
	<form action="join" method="post">
	<section id="join-table">
		<table border="1" class="table">
			<tr>
				<th>아이디</th>
				<td><input type="text" required="required" name="id"
					placeholder="영문과 숫자 6~20자 이내"><input type="button"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" required="required" name="password"
					placeholder="비밀번호 입력"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" required="required" name="passwordCheck"
					placeholder="비밀번호 확인"></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" required="required" name="nickname" placeholder="닉네임 입력"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="male"><label>남성</label>
					<input type="radio" name="gender" value="female"><label>여성</label></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="birthday"></td>
			</tr>
			<tr>
				<td colspan="2" class="joinButton"><input type="submit" value="회원 가입">
				</td>
		</table>
		</section>
	</form>
	</main>
	</div>
	</div>
	</div>
	</div>
	
</body>
</html>