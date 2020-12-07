<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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

Date nowTime=new Date();
SimpleDateFormat sf=new SimpleDateFormat("yyyy.MM.dd");
String comment=request.getParameter("comment");
int i=1;
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";

try{
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, "hr", "hr");
	String sql = "insert into comment1 values(?,?,?)";
	pstmt = conn.prepareStatement(sql); 
	Clob clob=conn.createClob();
	pstmt.setInt(1,i);
	pstmt.setString(2,sf.format(nowTime));
	clob.setString(3,comment);
	int res=pstmt.executeUpdate();
	response.sendRedirect("comment_content.jsp");
	i++;
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