<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
 <%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR"); %>

<%


Connection conn = null;
PreparedStatement pstmt = null;

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";

try{
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, "scott", "hg0331");
	
	
	
	String sql = "insert into diary values(?,?,?)";
	pstmt = conn.prepareStatement(sql); 
	pstmt.setString(1, request.getParameter("ddate")); 
	pstmt.setString(2, request.getParameter("title"));
	pstmt.setString(3, request.getParameter("content"));
	
	
	   pstmt.executeUpdate(); 
	
	
	
}catch(Exception e){
	e.getStackTrace();
	
}


%>

<%
    request.setCharacterEncoding("EUC-KR");
    
    Calendar cal = Calendar.getInstance();
    
    int nowYear = cal.get(Calendar.YEAR);
    int nowMonth = cal.get(Calendar.MONTH)+1;
    int nowDay = cal.get(Calendar.DAY_OF_MONTH);
    
    String strYear = request.getParameter("year");
    String strMonth = request.getParameter("month");
   
    int year=nowYear;
    int month=nowMonth;
    
    if(strYear != null)
        year = Integer.parseInt(strYear);
   
    if(strMonth != null)
        month = Integer.parseInt(strMonth);
   
    int preYear=year, preMonth=month-1;
    
    if(preMonth<1){
    	preYear=year-1;
    	preMonth=12;
    }
    
    int nextYear=year, nextMonth=month+1;
    
    if(nextMonth>12){
    	nextYear=year+1;
    	nextMonth=1;
    }
    cal.set(year, month-1, 1);    //����� �⵵, ���� ����
   
    
    
    int startDay=1;
    int endDay=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    int week=cal.get(Calendar.DAY_OF_WEEK);
    
  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>���̾ �޷�</title>

       <script type="text/javascript">
      

    
            function sendIt()
            {
                var f = document.forms[0];
                f.submit();
            }
        </script>
    </head>
    <style type="text/css">
*{padding: 0px; margin: 0px;}  
body{font-size: 9pt;}
td{font-size: 9pt;}
a{cusor: pointer; color: #000000; text-decoration: none; font-size: 9pt; line-height: 150%;}
a:HOVER, a:ACTIVE{font-size: 9pt; color: #F28011; text-decoration: underline;}
</style>
    <body>
       
           
       <table border="0" width="150">
		<tr>
			<td bgcolor="#DBDBDB" align="center"><font face="����" style="font-size:8pt;">today is...</font></td>
		</tr>
		</table>
		<br>
            <table width="150" border="0" cellpadding="2" cellspacing="1">
                <tr height="30">
                    <td>
                        <form action ="calendar2.jsp" method="post">
                            <select name="year" onchange="sendIt()">
                                    <%for(int i=year-5; i<year; i++) { %>
                                        <option value="<%=i%>" > <%=i%>��</option>
                                    <%} %>
                                    <option value="<%=year%>" selected="selected"><%=year%>��</option>
                                    <%for(int i=year+1; i<year+5; i++) { %>
                                        <option value="<%=i%>" > <%=i%>��</option>
                                    <%} %>
       
                            </select>
                           
                            <select name="month" onchange="sendIt()">
                                <% for(int i=1; i<=12; i++) {%>
                                    <option value="<%=i%>" <%=month==i?"selected='selected'":"" %>> <%=i%>�� </option>
                                <%} %>
                            </select>
                               
                        </form>
                    </td>
                </tr>
            </table>
           
            <table width="150" border="0" cellpadding="2" cellspacing="1" bgcolor="#cccccc">
                <tr height="25">
                    <td align="center" bgcolor="#e6e4e6"><font color="red">��</font></td>
                    <td align="center" bgcolor="#e6e4e6">��</td>
                    <td align="center" bgcolor="#e6e4e6">ȭ</td>
                    <td align="center" bgcolor="#e6e4e6">��</td>
                    <td align="center" bgcolor="#e6e4e6">��</td>
                    <td align="center" bgcolor="#e6e4e6">��</td>
                    <td align="center" bgcolor="#e6e4e6"><font color="blue">��</font></td>
                </tr>
                <%
                    int newLine = 0;
                    //1���� ��� ���Ͽ��� �����ϴ��Ŀ� ���� ��ĭ ����
                    out.println("<tr height='25'>");
                    for(int i=1; i<week; i++)
                    {
                        out.println("<td bgcolor='#ffffff'>&nbsp;</td>");
                        newLine++;
                    }
                   
                  
                    for(int i=startDay; i<=endDay; i++)
                    {
                       
                        String fontColor = (newLine == 0)?"red":(newLine==6?"blue":"#000000");
                        String bgColor = ((nowYear==year)&&(nowMonth==month)&&(nowDay==i)? "e6e4e6":"#ffffff");
                        out.println("<td align='center' bgcolor=" + bgColor + "><font color=" + fontColor+">"
                                + i + "</font></td>");
                        newLine++;
                        if(newLine == 7 && i != endDay)
                        {
                            out.println("</tr>");
                            out.println("<tr height='25'>");
                            newLine = 0;
                        }
                    }
                   
                    while(newLine>0 && newLine<7)
                    {
                        out.println("<td bgcolor='ffffff'>&nbsp;</td>");
                        newLine++;   
                    }
                    out.println("</tr>");
                %>
               
            </table>
            <br>
          
          
          
          
          <%
               
              
     
    
try{
	String sql = "select ddate, title, content from diary";
	pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
   
	int i = 1;
	out.println("�ֽű�");
	out.println("<table border=0 width=150 bgcolor ='#e6e4e6' text-decoration: none;><tr><th>��ȣ</th><th>��¥</th><th>����</th></tr>");
	while(rs.next()){   
		
		
		out.println("<tr><td bgcolor ='#ffffff'>"+i+"</td>");
		out.println("<td bgcolor ='#ffffff'>"+rs.getString("ddate")+"</td>");
		out.println("<td bgcolor ='#ffffff'>"+rs.getString("title")+"</td>");
		
		
		//out.println(i+"," + rs.getString("ddate")+","+rs.getString("title")+","+rs.getString("content")+"<br>");
		
		i++;
			}
	
	
	rs.close();
	pstmt.close();
	conn.close();
	
		}catch(Exception e){
	System.out.println(e);
}

%>
    </body>
</html>