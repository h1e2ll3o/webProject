<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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

	String sql = "select * from comment2";
	pstmt = conn.prepareStatement(sql); 
	rs=pstmt.executeQuery();
	while(rs.next()){
		
%>
<body>
<script>
var _width='400';
var _height='200';
var _left=Math.ceil((window.screen.width-_width)/2);
var _top=Math.ceil((window.screen.height-_height)/2);
</script>
<br>
	<table border="0" bgcolor="#EBEBEB" width="430" cellpadding="1" cellspacing="1" align="center">
		<tr>
			<td><font face="����" style="font-size:8pt;">NO. <%=rs.getInt("no") %></font></td>
			<td><font face="����" style="font-size:8pt;"><%=rs.getString("time") %></font></td>
			<td align="right"><font face="����" style="font-size:9pt;"><a href="delete2.jsp" onclick="window.open
			(this.href,'delete','width='+_width+',height='+_height+',left='+_left+',top='+_top);return false;">����</a></font></td>
		</tr>
	</table>
	<table border="0" width="410" align="center">
		<tr>
			<td width="330">  
				<font face="����" style="font-size:9pt;">
					<%=rs.getString("content") %>
				</font>
			</td>
		</tr>
	</table>
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