<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록</title>
</head>
<style>
	body{
		-ms-overflow-style: none;
	}
	::webkit-scrollbar{
		display: none;
	}
</style>
<body topmargin="0" leftmargin="0">
	<form method=post action="comment_action.jsp">

	<!-- 탑, 글쓰기 -------------------------------------------------------------------------------- -->
 	<br><table width="410" border="0" cellpadding="3" cellspacing="1" bgcolor="#DBDBDB" align="center">
		<tr bgcolor="#FFFFFF">
			<td align="center"> 
				<font face="굴림" style="font-size:9pt;">
					방명록
				</font>
			</td>
		</tr>
	</table><br>
	<table width="430" border="0" align="center">
		<tr>
			<td align="center">
				<font face="굴림" style="font-size:9pt;">
					아이디 입력
				</font><input type="text" name="id"/>
			</td>
		</tr>
	</table>
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
	<div align=center>
					<iframe frameborder="0" width="480" height="440" src="./comment_list.jsp"></iframe>
	</div>

</html>
