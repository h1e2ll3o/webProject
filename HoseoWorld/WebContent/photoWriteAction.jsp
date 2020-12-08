<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@ page import="UserDatabase.*"%>

<jsp:useBean id="photo" class="UserDatabase.Photo"/>
<jsp:useBean id="photobean" class="UserDatabase.PhotoBean"/>

<% request.setCharacterEncoding("UTF-8");%>

<%
	try{
		//÷������ ����
		String saveDirectory = application.getRealPath("/photo");
		int maxPostSize= 1024*1024*10;
		String encoding="UTF-8";
		long fileSize=0;
		File file = null;
		
		//����ڰ� ������ �ؽ�Ʈ ���� �� ������ '/photo'�� ����
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		
		//mr ���������� ����Ű�� �ִ� �ؽ�Ʈ ���� ��������
		String sub = mr.getParameter("subject").trim();
		String con = mr.getParameter("contents").trim();
		
		//������ ��ü ���� �̸����� ������
		Enumeration files = mr.getFileNames();
		
		// �ߺ�ó���� �̸�, �ߺ� ó���� ���� ���� �̸�, ���� ������
		String item = (String) files.nextElement();
		
		String originalName = mr.getOriginalFileName(item);//���� �̸� �ߺ� ó��
		String fileName = mr.getFilesystemName(item); //���ϴ�� 
		out.println("original : "+originalName);
		out.println("rename : " + fileName);
		
		file = mr.getFile(item);	// ���� ���� ������
		if(file.exists()){
			fileSize = file.length(); //���� ���� ũ��
		}else{
			out.println("Nothing");
		}
		
	
		//3) tb_pds���̺� �� �߰��ϱ� 
		photo.setId((String)session.getAttribute("userID"));
		photo.setSubject(sub); 
		photo.setSavefilename(fileName); 
		photo.setContents(con);
		photo.setSavefilesize(fileSize); 
		
		/*boolean flag = photobean.insert(photo); 
		if(flag){ 
			out.println("insert");
			out.println("<script>"); 
			out.println(" alert('������ �߰��߽��ϴ�.')"); 
			out.println(" location.href='photo.jsp';"); 
			out.println("</script>"); 
		}else{ 
			out.println("<p>���� �߰� ���� T.T</p>"); 
			out.println("<script>history.back(-1);</script>");
		}//if end
*/
	} catch(Exception e){
		out.println(e);
		out.println("<p>���� ���� T.T</p>"); 
		out.println("<script>history.back(-1);</script>");
	}
%>
