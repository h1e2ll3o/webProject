<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>홈 화면</title>
</head>
<%
	if(session.getAttribute("userID") != null){
%>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String name;

try{
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, "scott", "hg0331");

	String sql = "select * from comment1 where time=(select max(time) from comment1)";
	pstmt = conn.prepareStatement(sql); 
	rs=pstmt.executeQuery();
	while(rs.next()){
		
%>
<body>
<table>
<div >
 <img src="./images/home_center.jpg" width="440" height="250" border="0"/>
 </div>
 
 </table>
<table bgcolor="#DBDBDB" width="440" cellpadding="1" cellspacing="1">
		<tr bgcolor="#FFFFFF" >
			<td colspan="2"><font face="짹쩌쨍짼" style="font-size:9pt;"><b>Updated news</b></font></td>
		</tr>
		<tr bgcolor="#FFFFFF" >
			<td width="240">
				<%=rs.getString("content") %>
			</td>
			<td valign="top">

				<table bgcolor="#DBDBDB" width="200" align="center" cellpadding="1" cellspacing="1">
					<tr bgcolor="#FFFFFF" align="center">
						<td><font face="짹쩌쨍짼" style="font-size:9pt;"><a href="./new_comment.jsp">방명록 최신 글</a></a></font></td>
					</tr>
				</table>

			</td>
		</tr>
	</table>
</body>
<%
	}
	rs.close();
	pstmt.close();
	conn.close();
	
		}catch(Exception e){
	System.out.println(e);
}

%>
<% 
	} else{
		out.println("<script>"); 
		out.println(" location.href='./login.jsp';"); 
		out.println("</script>"); 
	}
%>
</html>