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
		//첨부파일 저장
		String saveDirectory = application.getRealPath("/photo");
		int maxPostSize= 1024*1024*10;
		String encoding="UTF-8";
		long fileSize=0;
		File file = null;
		
		//사용자가 전송한 텍스트 정보 및 파일을 '/photo'에 저장
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		
		//mr 참조변수가 가리키고 있는 텍스트 정보 가져오기
		String sub = mr.getParameter("subject").trim();
		String con = mr.getParameter("contents").trim();
		
		//전송한 전체 파일 이름들을 가져옴
		Enumeration files = mr.getFileNames();
		
		// 중복처리된 이름, 중복 처리전 실제 원본 이름, 파일 사이즈
		String item = (String) files.nextElement();
		
		String originalName = mr.getOriginalFileName(item);//파일 이름 중복 처리
		String fileName = mr.getFilesystemName(item); //파일담기 
		out.println("original : "+originalName);
		out.println("rename : " + fileName);
		
		file = mr.getFile(item);	// 실제 파일 가져옴
		if(file.exists()){
			fileSize = file.length(); //실제 파일 크기
		}else{
			out.println("Nothing");
		}
		
	
		//3) tb_pds테이블에 행 추가하기 
		photo.setId((String)session.getAttribute("userID"));
		photo.setSubject(sub); 
		photo.setSavefilename(fileName); 
		photo.setContents(con);
		photo.setSavefilesize(fileSize); 
		
		/*boolean flag = photobean.insert(photo); 
		if(flag){ 
			out.println("insert");
			out.println("<script>"); 
			out.println(" alert('사진을 추가했습니다.')"); 
			out.println(" location.href='photo.jsp';"); 
			out.println("</script>"); 
		}else{ 
			out.println("<p>사진 추가 실패 T.T</p>"); 
			out.println("<script>history.back(-1);</script>");
		}//if end
*/
	} catch(Exception e){
		out.println(e);
		out.println("<p>서버 오류 T.T</p>"); 
		out.println("<script>history.back(-1);</script>");
	}
%>
