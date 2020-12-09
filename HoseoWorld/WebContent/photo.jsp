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

<% request.setCharacterEncoding("utf-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
	table.type {
	  width: 350px;
	  border-collapse: separate;
	  border-spacing: 1px;
	  text-align: center;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  margin: 20px 10px;
	}
	table.type td {
	  width: 100px;
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	}

	body{
		-ms-overflow-style: none;
	}
	table.type ::webkit-scrollbar {
		display: none;
	}
</style>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0">
<table>
		<tr>
			<td width="178" height="450" background="./images/bg_left_rect.jpg">
				<div align=center>
					<iframe frameborder="0" width="160" height="440" src="./main_profile.html"></iframe>
				</div>
			</td>
			<td width="480" height="450" background="./images/bg_center_rect.jpg">
				<div style="text-align:center">
					<table class="type" align="center">
						<tr height="50">
							<td colspan="3"><font face="굴림" style="font-size:15pt;">사진첩</font></td>
						</tr>
						<%
							ArrayList<Photo> list = photobean.list((String)session.getAttribute("userID"));
							int newLine = 0;
							int articleCount=0;
							int cnt = 0;
							
							if(list == null){
								out.println("<tr><td>게시물 없음</td></tr><tr><td></td><td></td></tr><tr><td></td><td></td></tr>");
							}else{
								for(int idx=0; idx < list.size(); idx++){
									if(newLine == 0){
										out.print("<tr>");
									}
									newLine++;
									articleCount++;
									
									out.print("<td width='100' height='100'>");
									out.print("<img src='/photo/"+photo.getSavefilename()+"' alt='"+photo.getSavefilename()+"' width='90' height='90'/><br/>");
									out.print("<p>"+photo.getSubject()+"</p></td>");
								
									if(newLine == 3){
										out.print("</tr>");
										newLine = 0;
									}
								}	//for end
								while(newLine > 0 && newLine <3){
									out.print("<td width='100' height='100'></td>");
									newLine++;
								}
								out.print("</tr>");
							}	//else end
						%>

						
						<tr height="50">
							<td colspan="3"><form action="./photoWrite.jsp" method="post">
							<input type="submit" name="make" value="글쓰기"/>
							<!-- <input type="button" name="del" value="삭제" onclick="<%//photobean.delete();%>"/> -->
							</form></td>
						</tr>
					</table>
				</div>
			</td>
			<td>
				<%@ include file="./menu.jsp" %>
			</td>
		</tr>
	</table>
</body>
</html>