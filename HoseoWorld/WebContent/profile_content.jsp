<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>프로필 내용</title>
</head>
<style>
	table.type {
	  border-collapse: separate;
	  border-spacing: 1px;
	  text-align: left;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  margin: 20px 10px;
	}
	table.type th {
	  width: 150px;
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	  background: #EFEFEF;
	}
	table.type td {
	  width: 350px;
	  padding: 10px;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	}
</style>
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
	
		String sql = "select * from login where id =?";
		pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, (String)session.getAttribute("userID"));
		rs=pstmt.executeQuery();
		while(rs.next()){	
%>

<body>
<div align="center">
    <table class="type">   
    	<tr>
    		<td colspan="2" style="text-align:center;"><strong>회원정보</strong></th>
    	</tr>                         
         <tr>                                 
             <th >이름</th>                    
             <td>&nbsp<%=rs.getString("name")%></td>
        </tr>
        <tr>
            <th>아이디</th>                     
            <td>&nbsp<%= rs.getString("id")%></td>
        </tr>
        <tr>
 			<th>블로그</th>
            <td>&nbsp<%=rs.getString("blog")%></td>
        </tr>
        <tr>
            <th>이메일</th>                    
            <td>&nbsp<%= rs.getString("email")%></td>
        </tr>
    </table><br>
    <input type="button" value="수정하기" onclick="location.href='rev.jsp'">&nbsp
    <input type="button" value="탈퇴하기" onclick="location.href='drop.jsp'">
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