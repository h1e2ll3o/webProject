<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    //내 db 접속에 사용할 conn 변수
    Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;		// ResultSet클래스 : 결과값을 행으로 저장
    //오라클 드라이버 경로 설정
    String driver = "oracle.jdbc.driver.OracleDriver";
    //내 db의 계정 경로 설정
    String url = "jdbc:oracle:thin:@localhost:1521:orcl";

    
    //db 접속 코드는 반드시 try~catch문 안에 써줘야함
    try {
        //오라클 드라이버 접속
        Class.forName(driver);
        //내 db 접속
        conn = DriverManager.getConnection(url, "scott", "hg0331");

        stmt = conn.prepareStatement("SELECT * FROM LOGIN WHERE ID = ? AND PW = ?");
        stmt.setString(1, request.getParameter("inputID"));
        stmt.setString(2, request.getParameter("inputPW"));
  
        rs = stmt.executeQuery();
        
        if(rs.next()){
        	String ID = rs.getString("ID");
        	String PW = rs.getString("PW");
        	
        	session.setAttribute("id", ID);
        	session.setAttribute("pw", PW);
        	
        	response.sendRedirect("main.jsp");
        } else{
        	%> <script> alert("로그인 실패"); history.go(-1); </script> <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally{
    	try{
    		if(rs != null) rs.close();
    		if(stmt != null) stmt.close();
    		if(conn != null) conn.close();
    	} catch(Exception e){
    		e.printStackTrace();
    	}
    }
%>