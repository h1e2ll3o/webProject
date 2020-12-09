package UserDatabase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBconnect {
	static Connection conn = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
		
	//데이터베이스 연동 관련 정보 문서 선언
	String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
	String jdbcURL = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	//데이터베이스 연결
	void connect() {
		try {
			//드라이브 로드
			Class.forName(jdbcDriver);
			//데이터베이스 연결
		    conn = DriverManager.getConnection(jdbcURL,"scott","hg0331");
		} catch (Exception e) {	e.printStackTrace();}
	}
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
