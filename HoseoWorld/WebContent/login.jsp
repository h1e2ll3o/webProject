<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
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
			<td>아이디</td>
			<td><input type="text" placeholder="아이디를 입력하시오" name="id" size="20"/></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="password" placeholder="패스워드를 입력하시오" name="pw" size="20"/></td>
		</tr>
		<tr></tr>
		<tr>
			<td colspan="2"><input type="submit" value="로그인">
			&nbsp&nbsp&nbsp<a href="./signup.jsp">회원가입</a>
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