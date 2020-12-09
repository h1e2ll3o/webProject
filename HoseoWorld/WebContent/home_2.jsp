<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ page import = "java.sql.*" %>
     <% request.setCharacterEncoding("EUC-KR"); %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%


Connection conn = null;
PreparedStatement pstmt = null;

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:xe";

try{
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, "hr", "hr");
	
	
	
	String sql = "insert into diary values(?,?,?)";
	pstmt = conn.prepareStatement(sql); 
	pstmt.setString(1, request.getParameter("ddate")); 
	
	
	
	   pstmt.executeUpdate(); 
	
	
	
}catch(Exception e){
	e.getStackTrace();
	
}


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
		
		<% 
		try{
	String sql = "select ddate, title, content from diary";
	pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
   
	int i;
	
	out.println("<table width=440 bgcolor ='#DBDBDB'><tr bgcolor='#ffffff'></tr>");
	while(rs.next()){   
		out.println("<tr><td bgcolor ='#ffffff'><a href = './diary_newcontent.jsp'>다이어리 최신글</a></td>");
		
	i = 1;		
	}
	
	sql = "select * from comment1 where time=(select max(time) from comment1)";
	pstmt = conn.prepareStatement(sql); 
	rs=pstmt.executeQuery();
	while(rs.next()){   
		out.println("<tr><td bgcolor ='#ffffff'><a href = './new_comment.jsp'>방명록 최신글</a></td>");
		
	i = 1;		
	}
	rs.close();
	pstmt.close();
	conn.close();
	
		}catch(Exception e){
	System.out.println(e);
}

%>


			
	</table>

</head>
<body>

</body>
</html>