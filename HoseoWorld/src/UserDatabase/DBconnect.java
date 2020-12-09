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
		
	//�����ͺ��̽� ���� ���� ���� ���� ����
	String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
	String jdbcURL = "jdbc:oracle:thin:@localhost:1521:orcl";
	
	//�����ͺ��̽� ����
	void connect() {
		try {
			//����̺� �ε�
			Class.forName(jdbcDriver);
			//�����ͺ��̽� ����
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
