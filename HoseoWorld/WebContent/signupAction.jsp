<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="UserDatabase.*, java.util.*"%>
<%request.setCharacterEncoding("EUC-KR");%>

<jsp:useBean id="user" class="UserDatabase.User"/>
<jsp:useBean id="userbean" class="UserDatabase.UserBean"/>
<jsp:setProperty name="user" property="*"/>
<% 
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String blog = request.getParameter("blog");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1 + '@' + email2;
	
	user.setId(id);
	user.setPw(pw);
	user.setName(name);
	user.setBlog(blog);
	user.setEmail(email);
	
	if(userbean.check_id(id) == 1){
		if(userbean.insert(user)){
			response.sendRedirect("login.jsp");
		} else{
			%><script>alert('입력오류');history.back(-1);</script><%
		}
	} else if(userbean.check_id(id) == 0){
		%><script>alert('아이디 중복');history.back(-1);</script><%
	} else{
		%><script>alert('서버 오류^^');history.back(-1);</script><%
	}
	

%>

