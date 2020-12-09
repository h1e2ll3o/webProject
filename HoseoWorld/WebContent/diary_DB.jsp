<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>다이어리DB삽입</title>


<%


Connection conn = null;
PreparedStatement pstmt = null;

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";

try{
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, "scott", "hg0331");
	
	
	
	String sql = "insert into diary values(?,?,?)";
	pstmt = conn.prepareStatement(sql); 
	pstmt.setString(1, request.getParameter("ddate")); 
	pstmt.setString(2, request.getParameter("title"));
	pstmt.setString(3, request.getParameter("content"));
	
	
	   pstmt.executeUpdate(); 
	
	
	
}catch(Exception e){
	e.getStackTrace();
	
}


%>
<%

try{
	String sql = "select ddate, title, content from diary";
	pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	int i=1;
	
	while(rs.next()){   
		//out.println(i+"," + rs.getString("username")+","+rs.getString("email")+"<br>");
		
		i++;
			}
	
	rs.close();
	pstmt.close();
	conn.close();
	
		}catch(Exception e){
	System.out.println(e);
}

%>
<body>
<center>
등록되었습니다.
</center>
</body>
</html>