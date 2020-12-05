<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="UserDatabase.Login" %>
<%@ page import="UserDatabase.LoginDAO" %>

<jsp:useBean id="signup" scope="page" class="UserDatabase.LoginDAO"/>
<jsp:setProperty name="signup" property="*"/>

<% 
	request.setCharacterEncoding("UTF-8");

	String userID = request.getParameter("inputID");
	String userPW = request.getParameter("inputPW");
	String userNAME = request.getParameter("inputNAME");
	String userEMAIL = request.getParameter("inputEMAIL1") + '@' + request.getParameter("inputEMAIL2");
	String userBLOG = request.getParameter("inputBLOG");
	
    Connection conn = null;
    PreparedStatement pstmt = null;

	
    String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
    String jdbcURL = "jdbc:oracle:thin:@localhost:1521:orcl";
	
    
    try {
        Class.forName(jdbcDriver);
        conn = DriverManager.getConnection(jdbcURL, "scott", "hg0331");
        
        String sql = "INSERT INTO LOGIN (ID, PW, NAME, BLOG,EMAIL) VALUES(?,?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		pstmt.setString(2, userPW);
		pstmt.setString(3, userNAME);
		pstmt.setString(4, userBLOG);
		pstmt.setString(5, userEMAIL);
       	pstmt.executeUpdate(sql);
        %> <script> alert("성공적으로 회원가입이 되었습니다.");</script> <%
        response.sendRedirect("login.jsp");
    } catch (Exception e) {
        e.printStackTrace();
       
    }
	
    pstmt.close();
    conn.close();
    
%>
