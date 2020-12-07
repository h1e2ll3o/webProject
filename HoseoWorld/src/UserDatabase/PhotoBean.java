package UserDatabase;

import java.sql.*;
import java.util.*;
import UserDatabase.*;

public class PhotoBean {
	DBconnect DB = new DBconnect();
	
	// 게시물 개수
	public int getMaxNum() {
		DB.connect();
		
		int maxNum = 0;
		try {
			String sql = "select nvl(max(no),0) from photo";
			DB.pstmt = DB.conn.prepareStatement(sql);
			DB.rs = DB.pstmt.executeQuery();
			
			if(DB.rs.next()) {
				maxNum = DB.rs.getInt(1);
			}
			DB.disconnect();
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return maxNum;
	}
	
	// 게시물 입력
	public void insert(Photo update) {
		DB.connect();
		try {
			String sql="insert into photo values (?, ?,?,?)";
			DB.pstmt = DB.conn.prepareStatement(sql);
			DB.pstmt.setInt(1, update.getNo());
			DB.pstmt.setString(2, update.getId());
			DB.pstmt.setString(3, update.getSubject());
			DB.pstmt.setString(4, update.getSavefilename());
			DB.pstmt.executeUpdate();
			
			DB.disconnect();
		} catch(Exception e) {
			System.out.println(e.toString());
		}
	}
	
	//게시물 전체 조회
	public ArrayList<Photo> getDBList(String id){
		DB.connect();
		ArrayList<Photo> lists = new ArrayList<Photo>();
		try {
			String sql = "select * from photo where id = ?";
			DB.pstmt = DB.conn.prepareStatement(sql);
			DB.pstmt.setString(1, id);
			DB.rs = DB.pstmt.executeQuery();
			
			while(DB.rs.next()) {
				Photo photo = new Photo();
				photo.setNo(DB.rs.getInt("no"));
				photo.setId(DB.rs.getString("id"));
				photo.setSubject(DB.rs.getString("subject"));
				photo.setSavefilename(DB.rs.getString("savefilename"));
				
				lists.add(photo);
			}
			DB.disconnect();
			
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
	
	//특정 게시물 조회
	/*public Photo getRead(int no) {
		Photo photo = new Photo();
		connect();
		try {
			String sql = "select * from photo where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				photo.setNo(rs.getInt("no"));
				photo.setId(rs.getString("id"));
				photo.setSubject(rs.getString("subject"));
				photo.setSavefilename(rs.getString("savefilename"));
			}
			disconnect();
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return photo;
	}*/
	
	
	public void delete(int no) {
		DB.connect();
		try {
			String sql = "delete photo where no=?";
			DB.pstmt = DB.conn.prepareStatement(sql);
			DB.pstmt.setInt(1, no);
			DB.pstmt.executeUpdate();
			DB.disconnect();
		} catch(Exception e) {
			System.out.println(e.toString());
		}
	}
	
	public int getDataCount() {
		DB.connect();
		
		int totalDataCount = 0;
		try {
			String sql = "select nvl(count(*),0) from photo";
			DB.pstmt = DB.conn.prepareStatement(sql);
			DB.rs = DB.pstmt.executeQuery();
			if(DB.rs.next()) {
				totalDataCount = DB.rs.getInt(1);
				DB.disconnect();
			}
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return totalDataCount;
	}
}
