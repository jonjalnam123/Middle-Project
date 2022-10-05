package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import dao.face.Semi_UserDao;
import dto.semi_User;

public class semi_UserDaoImpl implements Semi_UserDao {
	
	private PreparedStatement ps;
	private ResultSet rs;
	private Connection conn;

	@Override
	public int selectCntByUserEmailPw(semi_User sUser) {

		String sql = "";
		sql += "SELECT count(*) cnt FROM semi_user";
		sql += " WHERE useremail = ?";
		sql += " AND userpw = ?";
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sUser.getUser_email());
			ps.setString(2, sUser.getUser_pw());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				cnt = rs.getInt("cnt");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return cnt;
	}
	

}













