<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈 화면</title>
</head>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String name;

try{
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, "hr", "hr");

	String sql = "select * from comment1 where time=(select max(time) from comment1)";
	pstmt = conn.prepareStatement(sql); 
	rs=pstmt.executeQuery();
	while(rs.next()){
		
%>
<body>
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
						<td><font face="짹쩌쨍짼" style="font-size:9pt;"><a href="./comment.jsp">방명록 최신 글</a></a></font></td>
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
</html>