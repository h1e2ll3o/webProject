<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수정</title>
</head>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String name=request.getParameter("name");
String pw=request.getParameter("pw");
String blog=request.getParameter("blog");
String email=request.getParameter("email");
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";

try{
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, "hr", "hr");

	String sql = "update login set pw=?, name=?, blog=?, email=?";
	pstmt = conn.prepareStatement(sql); 
	pstmt.setString(1,pw);
	pstmt.setString(2,name);
	pstmt.setString(3,blog);
	pstmt.setString(4,email);
	int res=pstmt.executeUpdate();
	response.sendRedirect("profile_content.jsp");
		
%>
<body>

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