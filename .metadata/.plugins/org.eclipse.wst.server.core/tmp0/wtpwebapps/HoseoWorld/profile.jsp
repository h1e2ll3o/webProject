<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="UserDatabase.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������</title>
</head>
<body  bgcolor="#FFFFFF" topmargin="0" leftmargin="0">
<%
userDAO UserDAO=new userDAO();

String userID = (String)session.getAttribute("userID");

UserDAO.getUser(userID);
//String blog=UserDAO.getBlog();
//String mail=UserDAO.getEmail();
%>

	<table>
		<tr>
			<td width="178" height="450" background="./images/bg_left_rect.jpg">
				<div align=center>
					<iframe frameborder="0" width="160" height="440" src="./main_profile.html"></iframe>
				</div>
			</td>
			<td width="480" height="450" background="./images/bg_center_rect.jpg">
				�̸� <%=userID%> ����<% out.println(UserDAO.getId()); %> ������� �̸��� <br>
				<input type="button" value="����" onclick="location.href='./rev.jsp'">
				<input type="button" value="ȸ��Ż��">
			</td>
			<td>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./main.jsp'" src="./images/home.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./profile.jsp'" src="./images/profile.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./main.jsp'" src="./images/diary.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./main.jsp'" src="./images/photo.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./comment.jsp'" src="./images/comment.jpg"/><br><br><br><br><br><br>
			</td>
		</tr>
	</table>

</body>
</html>