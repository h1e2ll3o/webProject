<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ż��</title>
</head>
<body>
<center>
<br><br><br><br><br>���� ����<br><br>
<form method=post action="delete_action.jsp">   
    <table>                            
         <tr>                                 
             <th bgcolor ='#e6e4e6'>���̵�</th>                    
             <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <th bgcolor ='#e6e4e6'>��й�ȣ</th>                    
            <td><input type="text" name="pw"></td>
        </tr>
    </table><br>
    <input type="submit" value="�����ϱ�"><br><br>
    </form>
</body>
		
</center>	

</html>