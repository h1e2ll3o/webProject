package UserDatabase;

import java.sql.*;
import java.util.*;
import UserDatabase.*;

public class PhotoBean {
	DBconnect DB = new DBconnect();
	ResultSet rs = null;
	// 게시물 개수
	public int getMaxNum() {
		DB.connect();
		int maxNum = 0;
		try {
			String sql = "select nvl(max(no),0) from photo";
			DB.pstmt = DB.conn.prepareStatement(sql);
			rs = DB.pstmt.executeQuery();
			
			if(rs.next()) {
				maxNum = rs.getInt(1);
			}
			DB.disconnect();
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return maxNum;
	}
	
	// 게시물 입력
	public boolean insert(Photo update) {
		DB.connect();
		boolean flag = false;
		
		try {

			String sql="insert into photo(no, id, subject, savefilename, contents, savedate, savefilesize)"
					+ " values((select nvl(max(no),0)+1 from photo), ?, ?, ?, ?, sysdate, ?)";
			
			DB.pstmt = DB.conn.prepareStatement(sql);
			DB.pstmt.setString(1, update.getId());
			DB.pstmt.setString(2, update.getSubject());
			DB.pstmt.setString(3, update.getSavefilename());
			DB.pstmt.setString(4, update.getContents());
			DB.pstmt.setLong(5, update.getSavefilesize());
			int num = DB.pstmt.executeUpdate();
			
			DB.disconnect();
			if(num==1) {
				flag = true;
			}
		} catch(Exception e) {
			System.out.println("사진 추가 실패 : " + e);
		}
		return flag;
	}
	
	//게시물 전체 조회
	public synchronized ArrayList<Photo> list(String id){
		ArrayList<Photo> list = null;
		DB.connect();
		
		try {
			String sql = "select * from photo where id = ? order by no desc";
			DB.pstmt = DB.conn.prepareStatement(sql);
			DB.pstmt.setString(1, id);
			rs = DB.pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<>();
				
				while(rs.next()) {
					
					Photo photo = new Photo();
					
					photo.setNo(rs.getInt("no"));
					photo.setId(rs.getString("id"));
					photo.setSubject(rs.getString("subject"));
					photo.setSavefilename(rs.getString("savefilename"));
					photo.setContents(rs.getString("contents"));
					photo.setSavedate(rs.getDate("savedate"));
					photo.setSavefilesize(rs.getInt("savefilesize"));
					
					list.add(photo);
				}
			}else {
				list = null;
			}
			
			DB.disconnect();
			
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
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
			rs = DB.pstmt.executeQuery();
			
			if(rs.next()) {
				totalDataCount = rs.getInt(1);
				DB.disconnect();
			}
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return totalDataCount;
	}
}
