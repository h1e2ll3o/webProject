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
SimpleDateFormat sf=new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");
String comment=request.getParameter("comment");
String id=request.getParameter("id");
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";

try{
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, "hr", "hr");
	String sql = "insert into comment2 values(comment2_seq.nextval,?,?,?)";
	pstmt = conn.prepareStatement(sql); 

	pstmt.setString(1,sf.format(nowTime));
	pstmt.setString(2,comment);
	pstmt.setString(3,id);
	int res=pstmt.executeUpdate();
	response.sendRedirect("comment_list.jsp");
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