<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@ page import="UserDatabase.userDAO" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
	<script type="text/javascript">
		function checkValue(){
			if(!document.userInfo.inputID.value){
				alert("���̵� �Է��ϼ���.");
				return false;
			}
			if(!document.userInfo.inputPW.value){
				alert("��й�ȣ�� �Է��ϼ���.");
				return false;
			}
			if(document.userInfo.inputPW.value != document.userInfo.checkPW.value){
				alert("��й�ȣ�� ���� ���� �ʽ��ϴ�.");
				return false;
			}
			if(!document.userInfo.inputEMAIL1.value){
				alert("�̸����� �Է��ϼ���.");
				return false;
			}
		}
	</script>
	
</head>
<style>
	td{padding: 5px;}
</style>
<body>

<h1 align="center"><b>ȸ������</b></h1>
<div class="content" align="center">
	<form action="signupAction.jsp" method="POST" name="userInfo" onsubmit="return checkValue()">
		<table>
			<tr>
				<td>���̵�</td>
				<td><input type="text" name="id" maxlength="15"/></td>
			</tr>
			<tr>
				<td>�н�����</td>
				<td><input type="password" name="pw" maxlength="15"/></td>
			</tr>
			<tr>
				<td>�н����� Ȯ��</td>
				<td><input type="password" name="checkPW"/></td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td><input type="text" name="name" maxlength="15"/></td>
			</tr>
			<tr>
				<td>�̸���</td>
				<td><input type="text" name="email1"/> @
				<select name="email2">
					<option>vision.hoseo.edu</option>
					<option>naver.com</option>
					<option>gmail.com</option>
					<option>nate.com</option>
				</select></td>
			</tr>
			<tr>
				<td>��α� �̸�</td>
				<td><input type="text" name="BLOG" maxlength="20"/></td>
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