<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ����</title>
</head>
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

	String sql = "select * from login";
	pstmt = conn.prepareStatement(sql); 
	rs=pstmt.executeQuery();
	while(rs.next()){
		
%>

<body>
<div align="center" class='container'>
<br><br><br><br><br>ȸ�� ����<br><br>   
    <table>                            
         <tr>                                 
             <th bgcolor ='#e6e4e6'>�̸�</th>                    
             <td><%=rs.getString("name")%></td>
        </tr>
        <tr>
            <th bgcolor ='#e6e4e6'>���̵�</th>                     
            <td><%= rs.getString("id")%></td>
        </tr>
        <tr>
            <th bgcolor ='#e6e4e6'>��й�ȣ</th>                    
            <td><%= rs.getString("pw")%></td>
        </tr>
        <tr>
 			<th bgcolor ='#e6e4e6'>��α�</th>
            <td><%=rs.getString("blog")%></td>
        </tr>
        <tr>
            <th bgcolor ='#e6e4e6'>�̸���</th>                    
            <td><%= rs.getString("email")%></td>
        </tr>
    </table><br>
    <input type="button" value="�����ϱ�" onclick="location.href='rev.jsp'">
    <input type="button" value="Ż���ϱ�" onclick="location.href='drop.jsp'">
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