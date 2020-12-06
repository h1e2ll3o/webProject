package UserDatabase;

import java.sql.*;
import java.util.*;

public class userDAO {

	private String no;
	private String id;
	private String pw;
	private String name;
	private String blog;
	private String email;
	
	private Connection conn = null;
	private ResultSet rs = null;
	PreparedStatement pstmt = null;
		
	//데이터베이스 연동 관련 정보 문서 선언
	String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
	String jdbcURL = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	//데이터베이스 연결
	public userDAO() {
		try {
			//드라이브 로드
			Class.forName(jdbcDriver);
			//데이터베이스 연결
		    conn = DriverManager.getConnection(jdbcURL,"scott","hg0331");
		} catch (Exception e) {	e.printStackTrace();}
	}
	
	//로그인
	public int login(String id, String pw) {
		try {
			pstmt = conn.prepareStatement("select pw from login where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1).equals(pw) ? 1 : 0;		// (1: 성공)(0: 비밀번호 틀림)
			} else {return -2;}									//(-2: 아이디 없음)
		} catch(Exception e) {
			e.printStackTrace();
			return -1;											// (-1: 서버오류)
		}
	}
	
	//아이디 중복 확인
	public boolean id_check(String id) {
		try {
			pstmt = conn.prepareStatement("select * from login where id=?");
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return false;									//중복 있음
			} else {return true;}								//중복 없음
		} catch(Exception e) {e.printStackTrace();}
		return false;
	}
	
	//회원가입
	public int signup(userDAO UserDAO) {
		if(!id_check(UserDAO.getId())) return 0;
		
		try {
			pstmt = conn.prepareStatement("insert into login values (login_seq.nextval,?,?,?,?,?)");
			
			pstmt.setString(1, UserDAO.getId());
			pstmt.setString(2, UserDAO.getPw());
			pstmt.setString(3, UserDAO.getName());
			pstmt.setString(4, UserDAO.getBlog());
			pstmt.setString(5, UserDAO.getEmail());
			
			return pstmt.executeUpdate();
		} catch (Exception e) { e.printStackTrace(); return -1;}
	}
	
	//사용자 데이터 가져오기
	public userDAO getUser(String id) {
		try {
			pstmt = conn.prepareStatement("select * from login where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userDAO UserDAO = new userDAO();
				UserDAO.setId(rs.getString(2));
				UserDAO.setPw(rs.getString(3));
				UserDAO.setName(rs.getString(4));
				UserDAO.setBlog(rs.getString(5));
				UserDAO.setEmail(rs.getString(6));
			}
		} catch(Exception e) {e.printStackTrace();}
		return null;
	}
	
	public String getNo() {return no;}
	public void setNo(String no) {this.no = no;}
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public String getPw() {return pw;}
	public void setPw(String pw) {this.pw = pw;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public String getBlog() {return blog;}
	public void setBlog(String blog) {this.blog = blog;}
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	
}
