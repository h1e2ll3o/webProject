<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="UserDatabase.*, java.util.*"%>
<%request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="user" class="UserDatabase.User"/>
<jsp:useBean id="userbean" class="UserDatabase.UserBean"/>
<jsp:setProperty name="user" property="*"/>

<% 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(userbean.login(id, pw)){
		response.sendRedirect("main.jsp");
	}else{
		%><script>alert('로그인 불가');history.back(-1);</script><%
	}
	

%>