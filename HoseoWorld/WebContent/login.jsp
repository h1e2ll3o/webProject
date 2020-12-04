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
			<td><input type="text" placeholder="아이디를 입력하시오" name="inputID" size="20"/></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="password" placeholder="패스워드를 입력하시오" name="inputPW" size="20"/></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="로그인"></td>
		</tr>
		<tr>
			<td><a href="./signup.jsp">회원가입</a></td>
			<td><a href="">아이디</a>/<a href="">패스워드 찾기</a></td>
		</tr>
	</table>
	</form>
	</div>
</body>
</html>