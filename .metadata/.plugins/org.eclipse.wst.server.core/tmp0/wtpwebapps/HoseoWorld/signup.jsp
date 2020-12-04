<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="UserDatabase.Login.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
</head>
<style>
	td{
		padding: 5px;
	}
</style>
<jsp:useBean id="signup" scope="request" class=""/> <!-- class에 넣어야 하는거 알아보고 넣기 -->
<body>
<h1 align="center"><b>회원가입</b></h1>
<div class="content" align="center">
<form action="signupAction.jsp" method="POST">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="inputID" maxlength="15"/></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="password" name="inputPW" maxlength="15"/></td>
		</tr>
		<tr>
			<td>패스워드 확인</td>
			<td><input type="password" name="checkPW"/></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="inputNAME" maxlength="15"/></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="inputEMAIL1"/> @
			<select name="inputEMAIL2">
				<option>vision.hoseo.edu</option>
				<option>naver.com</option>
				<option>gmail.com</option>
				<option>nate.com</option>
			</select></td>
		</tr>
		<tr>
			<td>블로그 이름</td>
			<td><input type="text" name="inputBLOG" maxlength="20"/></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><input type="submit" value="등록" /></td>
		</tr>
	</table>
</form>
</div>
</body>
</html>