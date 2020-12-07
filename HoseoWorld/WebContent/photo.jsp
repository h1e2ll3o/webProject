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
				<div align=center>
					<table width="470" align="center">
						<tr width="70" align="center">
							<td colspan="3">사진첩</td>
						</tr>
						<tr width="110" align="center">
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr width="110" align="center">
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr width="110" align="center">
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr width="70" align="center">
							<td colspan="2"></td>
							<td><input type="button" name="make" value="작성"/></td>
						</tr>
					</table>
				</div>
			</td>
			<td>
				<%--카테고리 디자인 변경 --%>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./main.jsp'" src="./images/home.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./profile.jsp'" src="./images/profile.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./main.jsp'" src="./images/diary.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./photo.jsp'" src="./images/photo.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./comment.jsp'" src="./images/comment.jpg"/><br><br><br><br><br><br>
			</td>
		</tr>
	</table>
</body>
</html>