package linkcode.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import linkcode.dao.MyConnection;
import linkcode.model.Login;
import linkcode.model.Register;

public class RegisterImpl implements RegisterService {

	MyConnection ds = new MyConnection();
	@Override
	public int create(List<Register> lst) {
		
		Register reg = lst.get(0);
		int i = 0;
		Connection con = MyConnection.getConnection();
		try {
			PreparedStatement pstate = con.prepareStatement("insert into users values(?,?,?,?)");
			pstate.setString(1,reg.getId());
			pstate.setString(2,reg.getName());
			pstate.setString(3,reg.getEmail());
			pstate.setString(4,reg.getPass());
			i = pstate.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
	public Register validateUser(Login lobj)
	{
		Register reg=null;
		Connection con = MyConnection.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from users where email = ? and pass = ?");
			ps.setString(1, lobj.getEmail());
			ps.setString(2, lobj.getPass());
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				reg = new Register();
				reg.setId(rs.getString("id"));
				reg.setName(rs.getString("name"));
				reg.setEmail(rs.getString("email"));
				reg.setPass("pass");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reg;
	}

}
