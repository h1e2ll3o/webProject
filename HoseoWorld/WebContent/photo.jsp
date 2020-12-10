<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>

</style>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0">
<table>
<%
	if(session.getAttribute("userID") != null){
%>
		<tr>
			<td width="178px" height="450px" background="./images/bg_left_rect.jpg">
				<div align=center>
					<iframe frameborder="0px" width="160px" height="440px" src="./main_profile.html"></iframe>
				</div>
			</td>
			<td width="480" height="450" background="./images/bg_center_rect.jpg">
				<div align=center>
					<iframe frameborder="0" width="480" height="440" src="./photoAction.jsp"></iframe>
				</div>
			</td>
			<td>
				<%@ include file="./menu.jsp" %>
			</td>
		</tr>
</table>
<% 
	} else{
		out.println("<script>"); 
		out.println(" location.href='./login.jsp';"); 
		out.println("</script>"); 
	}
%>
</body>
</html>