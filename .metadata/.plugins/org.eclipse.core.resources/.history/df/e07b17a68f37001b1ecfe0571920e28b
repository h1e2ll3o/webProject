package UserDatabase;

import java.sql.*;
import java.util.*;

public class LoginDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;

	
	//데이터베이스 연동 관련 정보 문서 선언
	String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
	String jdbcURL = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	void connect() {
		try {
			//드라이브 로드
			Class.forName(jdbcDriver);
			//데이터베이스 연결
		    conn = DriverManager.getConnection(jdbcURL,"scott","hg0331");
		} catch (Exception e) {	e.printStackTrace();}
	}
	void disconnect() {
		if(pstmt != null) {	// 연결된 상태
			try {
				pstmt.close();	// 연결 끊기
			}catch(Exception e) {e.printStackTrace();}
		}
		if(conn != null) {	// 연결된 상태
			try {
				conn.close();	// 연결 끊기
			}catch(Exception e) {e.printStackTrace();}
		}
	}
	
	public boolean updateDB() {
		return true;
	}
	
	public boolean insertDB(Login login) {
		connect();
		String sql = "insert into login(id, pw, name, blog, email) values (?,?,?,?,?) ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, );
		}catch(Exception e) {e.printStackTrace();}
		
		return true;
	}
	
	public boolean deleteDB(String userID) {
		
		return true;
	}
	
}