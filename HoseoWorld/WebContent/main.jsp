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
					<iframe frameborder="0" width="470" height="430" src="./home_2.jsp"></iframe>
				</div>
			</td>
			<td>
				<%@ include file="./menu.jsp" %>
			</td>
		</tr>
	</table>
</body>
</html>