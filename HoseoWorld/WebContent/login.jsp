<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
<style>
	h1 {
		margin:80px; color: orange;
	}
	td {
		text-align:center;
		padding:10px;
	}
</style>
</head>
<body>
<%
	if(session.getAttribute("userID") == null){
%>
    <div align="center">
	<img src = "./images/hoseo.jpg"/>
	<form action="loginAction.jsp" method="POST">
	<table>
		<tr>
			<td>���̵�</td>
			<td><input type="text" placeholder="���̵� �Է��Ͻÿ�" name="id" size="20"/></td>
		</tr>
		<tr>
			<td>�н�����</td>
			<td><input type="password" placeholder="�н����带 �Է��Ͻÿ�" name="pw" size="20"/></td>
		</tr>
		<tr></tr>
		<tr>
			<td colspan="2"><input type="submit" value="�α���">
			&nbsp&nbsp&nbsp<a href="./signup.jsp">ȸ������</a>
			</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
		</tr>
	</table>
	</form>
	</div>
<% 
	} else{
		out.println("<script>"); 
		out.println(" location.href='./main.jsp';"); 
		out.println("</script>"); 
	}
%>
</body>
</html>