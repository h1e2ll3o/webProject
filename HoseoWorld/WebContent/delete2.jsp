<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>댓글 삭제</title>
<style>
body {
background-color:#e6e4e6;
}
</style>
</head>
<body>
<center>
<br>댓글 삭제<br><br>
<form method=post action="delete2_action.jsp">   
    <table>                            
         <tr>                                 
             <th bgcolor ='#e6e4e6'>아이디</th>                    
             <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <th bgcolor ='#e6e4e6'>비밀번호</th>                    
            <td><input type="text" name="pw"></td>
        </tr>
    </table><br>
    <input type="submit" value="삭제하기"><br><br>
    </form>
</body>
		
</center>	

</html>