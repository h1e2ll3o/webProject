<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="UserDatabase.*"%>

<jsp:useBean id="photo" class="UserDatabase.Photo"/>
<jsp:useBean id="photobean" class="UserDatabase.PhotoBean"/>

<% request.setCharacterEncoding("EUC-KR");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>����ø</title>
</head>
<style>
	table.type {
	  width: 430px;
	  border-collapse: separate;
	  border-spacing: 1px;
	  align: center;	
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
	}
	table.type th {
	  width: 150px;
	  font-weight: bold;
	  vertical-align: top;
	}
	table.type td {
	  width: 150px;
	  padding: 10px;
	  text-align: center;
	  vertical-align: top;
	  
	}
	body{
		-ms-overflow-style: none;
	}
	::webkit-scrollbar{
		display: none;
	}
</style>
<body topmargin="0" leftmargin="0">
<table class="type" style="margin: 20px 10px 5px 10px;">
	<tr>
		<th colspan="3" height="10px"><font face="����" style="font-size:15pt;">����ø</font></th>
	</tr>
</table>
<form action="./photoWrite.jsp" method="post">
	&nbsp&nbsp&nbsp<input type="submit" name="make" value="�۾���"/>
</form>
<table class="type" style="margin: 3px 10px;">
<%
	ArrayList<Photo> list = photobean.list((String)session.getAttribute("userID"));
	if(list == null){
		out.println("<tr><td>�Խù� ����</td></tr><tr><td></td></tr><tr><td></td></tr>");
	} else{
		
		int newLine = 0;
		for(int idx=0; idx<list.size(); idx++){ 
			photo=list.get(idx); 

			if(newLine==0){
				out.println("<tr>");
			}
			
			newLine++;
			%>
				<td>
					<img src="./photo/<%=photo.getSavefilename()%>" width="100px">
					<p><font face="����" style="font-size:10pt;"><%=photo.getSubject()%></font><br/>
					<font face="����" style="font-size:10pt;"><%=photo.getSavedate()%></font></p>
					<a  href="#" onclick="<%photobean.delete(photo.getNo());%>">����</a>
				</td>
			 <% 
			 if(newLine==3){
			 	out.println("</tr>");
			 	newLine = 0;
			 }//if end
			}//for end 
		while(newLine > 0 && newLine <3){
			out.print("<td></td>");
			newLine++;
			
			if(newLine == 3){
				out.println("</tr>");
			}//if end
		}//while end
	}//if end
%>
</table>
</body>
</html>