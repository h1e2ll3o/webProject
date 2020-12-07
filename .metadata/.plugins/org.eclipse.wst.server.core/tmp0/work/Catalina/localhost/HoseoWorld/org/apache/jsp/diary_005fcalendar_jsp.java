/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.60
 * Generated at: 2020-12-07 06:33:00 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Calendar;
import java.sql.*;

public final class diary_005fcalendar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.Calendar");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write(" \r\n");
 request.setCharacterEncoding("EUC-KR"); 
      out.write("\r\n");
      out.write("\r\n");



Connection conn = null;
PreparedStatement pstmt = null;

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1522:orcl";

try{
	Class.forName(driver);
	
	conn = DriverManager.getConnection(url, "cys", "1234");
	
	
	
	String sql = "insert into diary values(?,?,?)";
	pstmt = conn.prepareStatement(sql); 
	pstmt.setString(1, request.getParameter("ddate")); 
	pstmt.setString(2, request.getParameter("title"));
	pstmt.setString(3, request.getParameter("content"));
	
	
	   pstmt.executeUpdate(); 
	
	
	
}catch(Exception e){
	e.getStackTrace();
	
}



      out.write("\r\n");
      out.write("\r\n");

    request.setCharacterEncoding("utf-8");
    
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
    cal.set(year, month-1, 1);    //출력할 년도, 월로 설정
   
    
    
    int startDay=1;
    int endDay=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    int week=cal.get(Calendar.DAY_OF_WEEK);
    
  

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("     \r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>다이어리 달력</title>\r\n");
      out.write("        <style type=\"text/css\">\r\n");
      out.write("            *{padding: 0px; margin: 0px;}  \r\n");
      out.write("            body{font-size: 9pt;}\r\n");
      out.write("            td{font-size: 9pt;}\r\n");
      out.write("          a{cusor: pointer; color: #000000; text-decoration: none; font-size: 9pt; line-height: 150%;}\r\n");
      out.write("            a:HOVER, a:ACTIVE{font-size: 9pt; color: #F28011; text-decoration: underline;}\r\n");
      out.write("            \r\n");
      out.write("        </style>\r\n");
      out.write("       <script type=\"text/javascript\">\r\n");
      out.write("      \r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("            function sendIt()\r\n");
      out.write("            {\r\n");
      out.write("                var f = document.forms[0];\r\n");
      out.write("                f.submit();\r\n");
      out.write("            }\r\n");
      out.write("        </script>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("       \r\n");
      out.write("           \r\n");
      out.write("       <table border=\"0\" width=\"150\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td bgcolor=\"#DBDBDB\" align=\"center\"><font face=\"굴림\" style=\"font-size:8pt;\">today is...</font></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t<br>\r\n");
      out.write("            <table width=\"150\" border=\"0\" cellpadding=\"2\" cellspacing=\"1\">\r\n");
      out.write("                <tr height=\"30\">\r\n");
      out.write("                    <td>\r\n");
      out.write("                        <form action =\"calendar2.jsp\" method=\"post\">\r\n");
      out.write("                            <select name=\"year\" onchange=\"sendIt()\">\r\n");
      out.write("                                    ");
for(int i=year-5; i<year; i++) { 
      out.write("\r\n");
      out.write("                                        <option value=\"");
      out.print(i);
      out.write("\" > ");
      out.print(i);
      out.write("년</option>\r\n");
      out.write("                                    ");
} 
      out.write("\r\n");
      out.write("                                    <option value=\"");
      out.print(year);
      out.write("\" selected=\"selected\">");
      out.print(year);
      out.write("년</option>\r\n");
      out.write("                                    ");
for(int i=year+1; i<year+5; i++) { 
      out.write("\r\n");
      out.write("                                        <option value=\"");
      out.print(i);
      out.write("\" > ");
      out.print(i);
      out.write("년</option>\r\n");
      out.write("                                    ");
} 
      out.write("\r\n");
      out.write("       \r\n");
      out.write("                            </select>\r\n");
      out.write("                           \r\n");
      out.write("                            <select name=\"month\" onchange=\"sendIt()\">\r\n");
      out.write("                                ");
 for(int i=1; i<=12; i++) {
      out.write("\r\n");
      out.write("                                    <option value=\"");
      out.print(i);
      out.write('"');
      out.write(' ');
      out.print(month==i?"selected='selected'":"" );
      out.write('>');
      out.write(' ');
      out.print(i);
      out.write("월 </option>\r\n");
      out.write("                                ");
} 
      out.write("\r\n");
      out.write("                            </select>\r\n");
      out.write("                               \r\n");
      out.write("                        </form>\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("            </table>\r\n");
      out.write("           \r\n");
      out.write("            <table width=\"150\" border=\"0\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#cccccc\">\r\n");
      out.write("                <tr height=\"25\">\r\n");
      out.write("                    <td align=\"center\" bgcolor=\"#e6e4e6\"><font color=\"red\">일</font></td>\r\n");
      out.write("                    <td align=\"center\" bgcolor=\"#e6e4e6\">월</td>\r\n");
      out.write("                    <td align=\"center\" bgcolor=\"#e6e4e6\">화</td>\r\n");
      out.write("                    <td align=\"center\" bgcolor=\"#e6e4e6\">수</td>\r\n");
      out.write("                    <td align=\"center\" bgcolor=\"#e6e4e6\">목</td>\r\n");
      out.write("                    <td align=\"center\" bgcolor=\"#e6e4e6\">금</td>\r\n");
      out.write("                    <td align=\"center\" bgcolor=\"#e6e4e6\"><font color=\"blue\">토</font></td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                ");

                    int newLine = 0;
                    //1일이 어느 요일에서 시작하느냐에 따른 빈칸 삽입
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
                
      out.write("\r\n");
      out.write("               \r\n");
      out.write("            </table>\r\n");
      out.write("            <br>\r\n");
      out.write("          \r\n");
      out.write("          \r\n");
      out.write("          \r\n");
      out.write("          \r\n");
      out.write("          ");

               
              
     
    
try{
	String sql = "select ddate, title, content from diary";
	pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
   
	int i = 1;
	out.println("최신글");
	out.println("<table border=0 width=150 bgcolor ='#e6e4e6' text-decoration: none;><tr><th>번호</th><th>날짜</th><th>제목</th></tr>");
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


      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}