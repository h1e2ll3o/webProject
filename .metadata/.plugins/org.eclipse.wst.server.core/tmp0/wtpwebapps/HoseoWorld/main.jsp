<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Hoseo World</title>
</head>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0">

<table>
		<tr>
			<td width="178" height="450" background="./images/bg_left_rect.jpg">
				<div align=center>
					<iframe frameborder="0" width="160" height="440" src="./main_profile.html"></iframe>
				</div>
			</td>
			<td width="480" height="450" background="./images/bg_center_rect.jpg">
				<div align=center>
					<iframe frameborder="0" width="470" height="430" src="./home.html"></iframe>
				</div>
			</td>
			<td>
			    <%--���� �ڵ� --%>
				<%--<input type="button" width="83" height="29" border="0" value="Ȩ" onclick="location.href='./main.jsp'"><br><br>
				<input type="button" width="83" height="29" border="0" value="������" onclick="location.href='./profile.html'"><br><br>
				<input type="button" width="83" height="29" border="0" value="���̾" onclick="location.href='./main.jsp'"><br><br>
				<input type="button" width="83" height="29" border="0" value="����ø" onclick="location.href='./main.jsp'"><br><br>
				<input type="button" width="83" height="29" border="0" value="�����" onclick="location.href='./comment.jsp'"><br><br>
				- --%>
				<%--ī�װ��� ������ ���� --%>
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