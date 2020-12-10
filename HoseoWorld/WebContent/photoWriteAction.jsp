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

<% request.setCharacterEncoding("EUC-KR");%>

<%
	try{
		//÷������ ����
		String saveDirectory = application.getRealPath("/photo");
		int maxPostSize= 1024*1024*10;
		String encoding="EUC-KR";
		
		String item=""; 
		String fileName=""; //���ϸ� 
		long fileSize=0;
		File file = null;
		
		//����ڰ� ������ �ؽ�Ʈ ���� �� ������ '/photo'�� ����
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		
		Enumeration files = mr.getFileNames();
		
		while(files.hasMoreElements()){
			item=(String)files.nextElement();
			fileName=mr.getFilesystemName(item); 
			
			if(fileName!=null){ 
				file=mr.getFile(item); //���ϴ�� 
				
				if(file.exists()){ //������ �����ϴ°� 
					fileSize = file.length(); 
				}//if end 
			}//if end
		}//while end
		
		//mr ���������� ����Ű�� �ִ� �ؽ�Ʈ ���� ��������
		String sub = mr.getParameter("subject").trim();
		String con = mr.getParameter("contents").trim();
		
		//3) tb_pds���̺� �� �߰��ϱ� 
		photo.setId((String)session.getAttribute("userID"));
		photo.setSubject(sub); 
		photo.setSavefilename(fileName); 
		photo.setContents(con);
		photo.setSavefilesize(fileSize); 
		
		boolean flag = photobean.insert(photo); 
		if(flag){ 
			out.println("<script>"); 
			out.println(" alert('������ �߰��߽��ϴ�.')"); 
			out.println(" location.href='photo.jsp';"); 
			out.println("</script>"); 
		}else{ 
			out.println("<p>���� �߰� ���� T.T</p>"); 
			out.println("<script>location.href='photoWrite.jsp';</script>");
		}//if end

	} catch(Exception e){
		out.println(e);
		out.println("<p>���� ���� T.T</p>"); 
		out.println("<script>location.href='photoWrite.jsp';</script>");
	}
%>
