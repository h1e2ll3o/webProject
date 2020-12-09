package UserDatabase;

import java.sql.*;
import java.util.*;
import UserDatabase.*;

public class UserBean {
	DBconnect DB = new DBconnect();
	ResultSet rs = null;
	
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
			rs = DB.pstmt.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setNo(rs.getInt("no"));
				user.setId(rs.getString("id"));
				user.setPw(rs.getString("pw"));
				user.setName(rs.getString("name"));
				user.setBlog(rs.getString("blog"));
				user.setEmail(rs.getString("email"));
				datas.add(user);
			}
			rs.close();
			DB.disconnect();
		
		} catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DB.disconnect();
		}
		return datas;
	}
	
	public User getDB(String id) {
		DB.connect();
		
		String sql = "select * from login where id=?";
		User user = new User();
		try {
			DB.pstmt = DB.conn.prepareStatement(sql);
			DB.pstmt.setString(1,id);
			rs = DB.pstmt.executeQuery();
			
			rs.next();
			user.setNo(rs.getInt("no"));
			user.setId(rs.getString("id"));
			user.setPw(rs.getString("pw"));
			user.setName(rs.getString("name"));
			user.setBlog(rs.getString("blog"));
			user.setEmail(rs.getString("email"));
			rs.close();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			DB.disconnect();
		}
		return user;
	}
	
	public int check_id(String id) {
		DB.connect();
		String sql = "select * from login id = ?";
		
		try {
			DB.pstmt = DB.conn.prepareStatement(sql);
			DB.pstmt.setString(1,id);
			rs = DB.pstmt.executeQuery();
			
			DB.disconnect();
			if(rs.next()) {return 0;}
			else {return 1;}
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
			rs = DB.pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(pw)) {
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

