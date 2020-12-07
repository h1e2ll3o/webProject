<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
				<div style="text-align:center">
					<table width="470" height="440" align="center" cellspacing="7" bgcolor="#FFFFFF">
						<tr height="50">
							<td colspan="3"><font face="굴림" style="font-size:15pt;">사진첩</font></td>
						</tr>
						<tr>
							<td>gf</td>
							<td>gf</td>
							<td>gf</td>
						</tr>
						<tr>
							<td>gf</td>
							<td>gf</td>
							<td>gf</td>
						</tr>
						<tr>
							<td>gf</td>
							<td>gf</td>
							<td>gf</td>
						</tr>
						<tr height="50">
							<td colspan="3"><form action="./photoWrite.jsp" method="post">
							<input type="submit" name="make" value="글쓰기"/></form></td>
						</tr>
					</table>
				</div>
			</td>
			<td>
				<%--카테고리 디자인 변경 --%>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./main.jsp'" src="./images/home.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./profile.jsp'" src="./images/profile.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./diary_total.jsp'" src="./images/diary.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./photo.jsp'" src="./images/photo.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./comment.jsp'" src="./images/comment.jpg"/><br><br><br><br><br><br>
			</td>
		</tr>
	</table>
</body>
</html>