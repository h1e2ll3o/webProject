<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>다이어리 전체 모습</title>
</head>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0">

<table>
		<tr>
			<td width="178" height="450" background="./images/bg_left_rect.jpg">
				<div align=center>
					<iframe frameborder="0" width="160" height="440" src="./diary_calendar.jsp"></iframe>
				</div>
			</td>
			<td width="480" height="450" background="./images/bg_center_rect.jpg">
				<div align=center>
					<iframe frameborder="0" width="450" height="430" src="./diary_test.html"></iframe>
				</div>
			</td>
			<td>
			    
				<%--카테고리 디자인 변경 --%>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./main.jsp'" src="./images/home.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./profile.jsp'" src="./images/profile.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./diary_test.html'" src="./images/diary.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./main.jsp'" src="./images/photo.jpg"/><br>
				<input type="image" width="70" height="35" border="0" onclick="location.href='./comment.jsp'" src="./images/comment.jpg"/><br><br><br><br><br><br>
				
				
			</td>
		</tr>
	</table>
</body>
</html>