<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style>
	h1 {
		margin:80px; color: orange;
	}
	td {
		padding:10px;
	}
</style>
</head>
<body>
    <div align="center">
	<img src = "./images/hoseo.jpg"/>
	<form action="loginAction.jsp" method="POST">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" placeholder="아이디를 입력하시오" name="id" size="20"/></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="password" placeholder="패스워드를 입력하시오" name="pw" size="20"/></td>
		</tr>
		<tr></tr>
		<tr>
			<td><input type="submit" value="로그인"></td>
			<td><a href="./signup.jsp">회원가입</a></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
		</tr>
	</table>
	</form>
	</div>
</body>
</html>