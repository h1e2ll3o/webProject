<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ����</title>
</head>

<body>
<center>
<br><br><br><br><br>ȸ�� ���� ����<br><br>
<form method=post action="rev_action.jsp">   
    <table>                            
         <tr>                                 
             <th bgcolor ='#e6e4e6'>�̸�</th>                    
             <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <th bgcolor ='#e6e4e6'>��й�ȣ</th>                    
            <td><input type="text" name="pw"></td>
        </tr>
        <tr>
 			<th bgcolor ='#e6e4e6'>��α�</th>
            <td><input type="text" name="blog"></td>
        </tr>
        <tr>
            <th bgcolor ='#e6e4e6'>�̸���</th>                    
            <td><input type="text" name="email"></td>
        </tr>
    </table><br>
    <input type="submit" value="�����ϱ�"><br><br>
    </form>
</body>
		
</center>	


</html>