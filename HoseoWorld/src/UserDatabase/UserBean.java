package UserDatabase;

import java.sql.*;
import java.util.*;
import UserDatabase.*;

public class UserBean {
	DBconnect DB = new DBconnect();
	
	public boolean update(User user) {
		DB.connect();
		
		String sql="update login set id=?, pw=?, name=?, blog=?, email=?";
		try {
			DB.pstmt = DB.conn.prepareStatement(sql);
			DB.pstmt.setString(1, user.getId());
			DB.pstmt.setString(2, user.getPw());
			DB.pstmt.setString(3, user.getName());
			DB.pstmt.setString(4, user.getBlog());
			DB.pstmt.setString(5, user.getEmail());
			DB.pstmt.executeUpdate();
			DB.disconnect();
			return true;
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean delete(String id) {
		DB.connect();
		
		String sql = "delete from login where id=?";
		try {
			DB.pstmt = DB.conn.prepareStatement(sql);
			DB.pstmt.setString(1, id);
			DB.pstmt.executeUpdate();
			DB.disconnect();
			return true;
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean insert(User user) {
		DB.connect();
		String sql = "insert into login values ((select nvl(max(no),0)+1 from login), ?, ?, ?, ?, ?)";
		try {
			DB.pstmt = DB.conn.prepareStatement(sql);
			DB.pstmt.setString(1, user.getId());
			DB.pstmt.setString(2, user.getPw());
			DB.pstmt.setString(3, user.getName());
			DB.pstmt.setString(4, user.getBlog());
			DB.pstmt.setString(5, user.getEmail());
			DB.pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println(e.toString());
			return false;
		}
		finally {
			DB.disconnect();
		}
		return true;
	}
	
	public ArrayList<User> getDBList(){
		DB.connect();
		ArrayList<User> datas = new ArrayList<User>();
		
		String sql = "select * from login order by no desc";
		try {
			DB.pstmt = DB.conn.prepareStatement(sql);
			DB.rs = DB.pstmt.executeQuery();
			while(DB.rs.next()) {
				User user = new User();
				user.setNo(DB.rs.getInt("no"));
				user.setId(DB.rs.getString("id"));
				user.setPw(DB.rs.getString("pw"));
				user.setName(DB.rs.getString("name"));
				user.setBlog(DB.rs.getString("blog"));
				user.setEmail(DB.rs.getString("email"));
				datas.add(user);
			}
			DB.rs.close();
			DB.disconnect();
		
		} catch(SQLException e) {
			e.printStackTrace();
		}

		DB.disconnect();
	
		return datas;
	}
	
	public int check_id(String id) {
		DB.connect();
		String sql = "select * from login where id = ?";
		
		try {
			DB.pstmt = DB.conn.prepareStatement(sql);
			DB.pstmt.setString(1,id);
			DB.rs = DB.pstmt.executeQuery();
			
			if(DB.rs.next()) {DB.disconnect(); return 0;}
			else {DB.disconnect(); return 1;}
		} catch(SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public boolean login(String id, String pw) {
		DB.connect();
		String sql = "select pw from login where id=?";
		
		try {
			DB.pstmt = DB.conn.prepareStatement(sql);
			DB.pstmt.setString(1,id);
			DB.rs = DB.pstmt.executeQuery();
			
			if(DB.rs.next()) {
				if(DB.rs.getString(1).equals(pw)) {
					return true;
				}else {return false;}
			} else
				return false;
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}

