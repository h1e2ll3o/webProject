<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ page import = "java.sql.*" %>
     <% request.setCharacterEncoding("EUC-KR"); %>
     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>다이어리 조회</title>
</head>

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
	
   // int idx = 1;
	pstmt.setString(1, request.getParameter("ddate"));
	pstmt.setString(2, request.getParameter("title"));
	pstmt.setString(3, request.getParameter("content"));
	
	
	
	   pstmt.executeUpdate(); 
	
	
	
}catch(Exception e){
	e.getStackTrace();
	
}
%>

<td align="right">
				<input type="button"  onClick="location.href='diary_test.html'" value="돌아가기"/>
				
				</td>
<p></p>

<%
               
              
   
    
try{
	String sql = "select ddate, title, content from diary";
	pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
    
	int i = 0;
	
	//out.println("<table border=0 width=150 bgcolor ='#e6e4e6' text-decoration: none;><tr><th>번호</th><th>날짜</th><th>제목</th></tr>");
	while(rs.next()){   
		
		
		//out.println("<tr><td bgcolor ='#ffffff'>"+i+"</td>");
		//out.println("<td bgcolor ='#ffffff'><a href='./diary_content.jsp?idx="+ rs.getString("idx")+"'>" + rs.getString("ddate")+"</td>");
		//out.println("<td bgcolor ='#ffffff'>"+rs.getString("title")+"</td>");
		
		
		//out.println(i+"," + rs.getString("ddate")+","+rs.getString("title")+","+rs.getString("content")+"<br>");
		
		i++;
		%>
		
		
		<body>
<p></p>
<center>            
 <div style="-ms-overflow-style: none;">
 <table border="1" width = "350" height = "100">                  <!-- border은 테두리를 표시하는 속성입니다. -->
        <tr>                                 
            <th bgcolor ='#e6e4e6'>번호</th>                    
            <td><%=i%></td>      
            <th bgcolor ='#e6e4e6'>날짜</th>
            <td><%=rs.getString("ddate")%></td>
        </tr>
        <tr>
            <th bgcolor ='#e6e4e6'>제목</th>                     <!-- colspan은 행병합 속성입니다. -->
            <td colspan="3"><%= rs.getString("title")%></td>
        </tr>
        <tr>
            <th height = 100 bgcolor ='#e6e4e6'>내용</th>                    
            <td colspan="3"><%= rs.getString("content")%></td>
        </tr>
    </table>
 </div>
</body>	
</center>	
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