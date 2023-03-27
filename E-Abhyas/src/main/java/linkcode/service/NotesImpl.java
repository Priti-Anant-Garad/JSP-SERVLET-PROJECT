package linkcode.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import linkcode.dao.MyConnection;
import linkcode.model.Post;

public class NotesImpl{
	
	MyConnection ds = new MyConnection();
	
	public boolean AddNotes(String title, String content, String uid) {
		
		boolean f = false;
		Connection con = MyConnection.getConnection();
		try {
			PreparedStatement pstate = con.prepareStatement("insert into notes(title,content,id,course_code) values(?,?,?,notes_seq.nextval)");
			pstate.setString(1,title);
			pstate.setString(2,content);
			pstate.setString(3,uid);
			int i = pstate.executeUpdate();
			if(i==1)
			{
				f=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return f;
	}
	public List<Post> searchAll(String id)
	{
		List<Post> lst = new ArrayList<Post>();
		Post po = null;
		Connection con = MyConnection.getConnection();
		try
		{
			String str = "select *from notes where id=?";
			PreparedStatement ps = con.prepareStatement(str);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				po=new Post();
				po.setTitle(rs.getString(1));
				po.setContent(rs.getString(2));
				po.setNotes_date(rs.getTimestamp(3));
				po.setCourse_code(rs.getString(5));
				lst.add(po);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
		
	}
	
	public Post getData(String course_code)
	{
		Post p = null;
		Connection con = MyConnection.getConnection();
		try
		{
			String str = "select * from notes where course_code=?";
			PreparedStatement ps = con.prepareStatement(str);
			ps.setString(1, course_code);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				p = new Post();
				p.setTitle(rs.getString(1));
				p.setContent(rs.getString(2));
				p.setCourse_code(rs.getString(5));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	public boolean update(String course_code, String title, String content)
	{
		boolean f = false;
		Connection con = MyConnection.getConnection();
		try {
			String str = "update notes set title = ?, content = ? where course_code = ?";
			PreparedStatement ps = con.prepareStatement(str);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, course_code);
			
			int i = ps.executeUpdate();
			if(i>0)
			{
				f = true;
			}			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
	public boolean deletenote(String course_code) {
		boolean f = false;
		Connection con = MyConnection.getConnection();
		try
		{
			String str = "delete from notes where course_code = ?";
			PreparedStatement ps = con.prepareStatement(str);
			ps.setString(1, course_code);
			int i = ps.executeUpdate();
			if(i>0)
			{
				f = true;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
}
