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

	String sql = "select * from comment1";
	pstmt = conn.prepareStatement(sql); 
	rs=pstmt.executeQuery();
	while(rs.next()){
		
%>
<body>
<br>
	<table border="0" bgcolor="#EBEBEB" width="430" cellpadding="1" cellspacing="1" align="center">
		<tr>
			<td><font face="굴림" style="font-size:8pt;">NO. <%=rs.getInt("no") %></font></td>
			<td><font face="굴림" style="font-size:8pt;"><%=rs.getString("time") %></font></td>
			<td align="right"><font face="굴림" style="font-size:9pt;"><a href="delete.jsp">삭제</a></font></td>
		</tr>
	</table>
	<form method=post action="guest.jsp">
	<table border="0" width="410" align="center">
		<tr>
			<td width="100">  
				<img src="./images/left_my.jpg" width="98" height="98" border="0" alt="">
			</td>
			<td width="330">  
				<font face="굴림" style="font-size:9pt;">
					<%=rs.getString("content") %>
				</font>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<textarea name="comment" rows="2" cols="47"></textarea></td>

		</tr>
		<tr>
			<td colspan="2" align="center">
				<font face="굴림" style="font-size:9pt;">
					아이디 입력  </font><input type="text" name="id"/>
				<input type="submit" value="확인">
			</td>
		</tr>
		<tr>
		<td>
		<div>
<font face="굴림" style="font-size:9pt;"><a href=#none id="show" onclick="if(hide.style.display=='none') {hide.style.display='';show.innerText='▲댓글 접기'} else {hide.style.display='none';show.innerText='▶댓글 펼치기'}">▶댓글 펼치기</a></font>
<div id="hide" style="display: none">
<iframe frameborder="0" width="480" height="440" src="./guest_list.jsp"></iframe>
</div>
</div>
		</td>
		</tr>
	</table></form>
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