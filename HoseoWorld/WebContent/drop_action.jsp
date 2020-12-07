<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>탈퇴</title>
</head>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String id=request.getParameter("id");
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";

try{
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, "hr", "hr");

	String sql = "delete from login where id=?";
	pstmt = conn.prepareStatement(sql); 
	pstmt.setString(1,id);
	int res=pstmt.executeUpdate();
	%>
		
<body>
<div align=center>
<br><br><br><br><br>회원 탈퇴 되었습니다.<br><br>
<input type="button" value="확인" onclick="window.open('login.jsp'); window.close()">
</div>
</body>
<%
	rs.close();
	pstmt.close();
	conn.close();
	
		}catch(Exception e){
	System.out.println(e);
}

%>
</html>