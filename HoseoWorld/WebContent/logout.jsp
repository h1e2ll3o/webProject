<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%session.invalidate();%>
	<script>alert("로그아웃되었습니다."); history.back();</script>
<%response.sendRedirect("login.jsp");%>