<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="UserDatabase.Login.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<style>
	td{
		padding: 5px;
	}
</style>
<jsp:useBean id="signup" scope="request" class=""/> <!-- class�� �־�� �ϴ°� �˾ƺ��� �ֱ� -->
<body>
<h1 align="center"><b>ȸ������</b></h1>
<div class="content" align="center">
<form action="signupAction.jsp" method="POST">
	<table>
		<tr>
			<td>���̵�</td>
			<td><input type="text" name="inputID" maxlength="15"/></td>
		</tr>
		<tr>
			<td>�н�����</td>
			<td><input type="password" name="inputPW" maxlength="15"/></td>
		</tr>
		<tr>
			<td>�н����� Ȯ��</td>
			<td><input type="password" name="checkPW"/></td>
		</tr>
		<tr>
			<td>�̸�</td>
			<td><input type="text" name="inputNAME" maxlength="15"/></td>
		</tr>
		<tr>
			<td>�̸���</td>
			<td><input type="text" name="inputEMAIL1"/> @
			<select name="inputEMAIL2">
				<option>vision.hoseo.edu</option>
				<option>naver.com</option>
				<option>gmail.com</option>
				<option>nate.com</option>
			</select></td>
		</tr>
		<tr>
			<td>���α� �̸�</td>
			<td><input type="text" name="inputBLOG" maxlength="20"/></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="2"><input type="submit" value="���" /></td>
		</tr>
	</table>
</form>
</div>
</body>
</html>