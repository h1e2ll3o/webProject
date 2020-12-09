<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ page import = "java.sql.*" %>
     <% request.setCharacterEncoding("EUC-KR"); %>
      
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>다이어리 조회</title>

<!-- 스크롤바 숨기기  -->
<style>
body{
-ms-overflow-style: none;
}
::webkit-scrollbar{
display: none;}
<!-- 목록 테이블 크기 고정  -->
table{
width : 600px;
table-layout: fixed;}

table.ys {
    border-collapse: collapse;
    text-align: left;
    line-height: 1;

}
table.ys thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.ys tbody th {
    width: 200px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #e6e4e6;
}
table.ys td {
    width: 400px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>


</head>
<%


Connection conn = null;
PreparedStatement pstmt = null;

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1522:orcl";

try{
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, "cys", "1234");
	
	
	
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

               <td align="center">
				<input type="button"  onClick="location.href='diary_test.html'" value="돌아가기"/>
				
				</td>
<p></p>

<%
               
              
   
    
try{
	String sql = "select ddate, title, content from diary";
	pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
    
	int i = 0;
	
	
	while(rs.next()){   
						
		
		i++;
		%>
		
				
		<body>


		
<p></p>
   
              
<center>

    <table class=ys  width = 350 >      
    
    <thead>                    
 <tr>
 <th scope = "cols"></th>
 <th scope = "cols"></th>
 </tr>
 </thead>
 
 <tbody>

        <tr>                                 
 
            <th width = 100 bgcolor ='#e6e4e6'>번호</th>                    
 
            <td align=center><%=i%></td>
 </tr>
 <tr>
                         
            <th width = 100 bgcolor ='#e6e4e6'>날짜</th>
 
            <td align=center><%=rs.getString("ddate")%></td>
  
            </tr>
 
        
 
        
 <tr>
            <th width = 100 bgcolor ='#e6e4e6' >제목</th>                     <!-- colspan은 행병합 속성입니다. -->
 
            <td align=center ><%= rs.getString("title")%></td>
 
        </tr>
 
       <tr>

            <th width = 100 height = 100 bgcolor ='#e6e4e6' >내용</th>                    
            <td align=center valign = top  style="white-space:pre-line;" >
                        <%= rs.getString("content") %>       </td>
 
        </tr>
 </tbody>
    </table>



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