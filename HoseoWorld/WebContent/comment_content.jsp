<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body topmargin="0" leftmargin="0">
	<form method=post action="comment_action.jsp">

	<!-- 탑, 글쓰기 -------------------------------------------------------------------------------- -->
 	<table width="410" border="0" cellpadding="3" cellspacing="1" bgcolor="#DBDBDB" align="center">
		<tr bgcolor="#FFFFFF">
			<td align="center"> 
				<font face="굴림" style="font-size:9pt;">
					방명록
				</font>
			</td>
		</tr>
	</table>

	<center><img src="images/bar.jpg" width="430" height="6" border="0" alt=""></center>
	<table width="410" border="0" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td>  
				<img src="./images/left_my.jpg" width="98" height="98" border="0" alt="">
			</td>
			<td align="center">  
				<textarea name="comment" rows="7" cols="40"></textarea>
			</td>
		</tr>
	</table><br>
	<table border="0" width="410" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td width="200" align="right">  
				<input type="submit" value="확인">
			</td>
		</tr>
	</table></form>
</body>
</html>
