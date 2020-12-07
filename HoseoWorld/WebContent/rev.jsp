<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>프로필 수정</title>
</head>

<body>
<center>
<br><br><br><br><br>회원 정보 수정<br><br>
<form method=post action="rev_action.jsp">   
    <table>                            
         <tr>                                 
             <th bgcolor ='#e6e4e6'>이름</th>                    
             <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <th bgcolor ='#e6e4e6'>비밀번호</th>                    
            <td><input type="text" name="pw"></td>
        </tr>
        <tr>
 			<th bgcolor ='#e6e4e6'>블로그</th>
            <td><input type="text" name="blog"></td>
        </tr>
        <tr>
            <th bgcolor ='#e6e4e6'>이메일</th>                    
            <td><input type="text" name="email"></td>
        </tr>
    </table><br>
    <input type="submit" value="수정하기"><br><br>
    </form>
</body>
		
</center>	


</html>