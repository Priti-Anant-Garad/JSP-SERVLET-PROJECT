package linkcode.model;

import java.sql.Timestamp;
import java.util.Date;

public class Post {
	
	private String course_code;
	private String title;
	private String content;
	private Timestamp notes_date;
	private Register reg;
	public Post(String course_code, String title, String content, Date notes_date, Register reg) {
		super();
		this.course_code = course_code;
		this.title = title;
		this.content = content;
		this.notes_date = (Timestamp) notes_date;
		this.reg = reg;
	}
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getCourse_code() {
		return course_code;
	}
	public void setCourse_code(String course_code) {
		this.course_code = course_code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getNotes_date() {
		return notes_date;
	}
	public void setNotes_date(Timestamp notes_date) {
		this.notes_date = notes_date;
	}
	public Register getReg() {
		return reg;
	}
	public void setReg(Register reg) {
		this.reg = reg;
	}
	public void setId(String string) {
		// TODO Auto-generated method stub
		
	}

}
