package UserDatabase;
import java.util.*;

public class Photo {
	private int no;
	private String id;
	private String subject;
	private String savefilename;
	private String contents;
	private Date savedate;
	private long savefilesize;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSavefilename() {
		return savefilename;
	}
	public void setSavefilename(String savefilename) {
		this.savefilename = savefilename;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getSavedate() {
		return savedate;
	}
	public void setSavedate(Date savedate) {
		this.savedate = savedate;
	}
	public long getSavefilesize() {
		return savefilesize;
	}
	public void setSavefilesize(long savefilesize) {
		this.savefilesize = savefilesize;
	}
	
	@Override 
	public String toString() { 
		return "Photo [no=" + no + ", id=" + id 
				+ ", subject=" + subject + ", date=" 
				+ savedate+ ", contents=" + contents 
				+ ", filename=" + savefilename 
				+ ", filesize=" + savefilesize + "]"; 
	}

}
