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
			    <%--기존 코드 --%>
				<%--<input type="button" width="83" height="29" border="0" value="홈" onclick="location.href='./main.jsp'"><br><br>
				<input type="button" width="83" height="29" border="0" value="프로필" onclick="location.href='./profile.html'"><br><br>
				<input type="button" width="83" height="29" border="0" value="다이어리" onclick="location.href='./main.jsp'"><br><br>
				<input type="button" width="83" height="29" border="0" value="사진첩" onclick="location.href='./main.jsp'"><br><br>
				<input type="button" width="83" height="29" border="0" value="방명록" onclick="location.href='./comment.jsp'"><br><br>
				- --%>
				<%--카테고리 디자인 변경 --%>
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