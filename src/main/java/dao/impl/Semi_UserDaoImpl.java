package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import dao.face.Semi_UserDao;
import dto.Semi_User;

public class Semi_UserDaoImpl implements Semi_UserDao {
	
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public int selectCntByUserEmailPw(Connection conn, Semi_User sUser) {

		String sql = "";
		sql += "SELECT count(*) cnt FROM semi_user";
		sql += " WHERE user_email = ?";
		sql += " AND user_pw = ?";
		
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
	
	
	@Override
	public Semi_User selectUserByUseremail(Connection conn, Semi_User sUser) {

		String sql = "";
		sql += "SELECT user_email, user_name, user_pw, user_no, user_phone FROM semi_user";
		sql += " WHERE user_email = ?";
		
		//조회 결과 저장 객체
		Semi_User result = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sUser.getUser_email());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				result = new Semi_User();
				
				result.setUser_email(rs.getString("user_email"));
				result.setUser_name(rs.getString("user_name"));
				result.setUser_pw(rs.getString("user_pw"));
				result.setUser_no(rs.getInt("user_no"));
				result.setUser_phone(rs.getString("user_phone"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		
		return result;
	}
	
	
	//----------------------------------비밀번호 찾기--------------------------------------------

	@Override
	public int selectCntByEmailPhone(Connection conn, Semi_User sUser) {

		String sql = "";
		sql += "SELECT count(*) cnt FROM semi_user";
		sql += " WHERE user_email = ?";
		sql += " AND user_phone = ?";
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sUser.getUser_email());
			ps.setString(2, sUser.getUser_phone());
			
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
	
	
	@Override
	public int updateTempPw(Connection conn, Semi_User sUser) {
		
		String sql = "";
		sql += "UPDATE semi_user SET user_pw = ?";
		sql += " WHERE user_email = ? AND user_phone = ?";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, sUser.getUser_pw());
			ps.setString(2, sUser.getUser_email());
			ps.setString(3, sUser.getUser_phone());
			
			rs = ps.executeQuery();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		System.out.println("update쿼리 : " + sUser);
		return res;
	}
	
	
	//------------------------------------회원가입------------------------------------------

	
	@Override
	public int selectCntByUserEmail(Connection conn, Semi_User sUser) {
		
		String sql = "";
		sql += "SELECT count(*) cnt FROM semi_user";
		sql += " WHERE user_email = ?";
		
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sUser.getUser_email());
			
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

	
	
	@Override
	public int insert(Connection conn, Semi_User sUser) {
		
		String sql = "";
		sql += "INSERT INTO semi_user (user_no, user_name, user_email, user_phone, user_pw)";
		sql += " VALUES(semi_user_seq.nextval, ?, ?, ?, ?)";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, sUser.getUser_name());
			ps.setString(2, sUser.getUser_email());
			ps.setString(3, sUser.getUser_phone());
			ps.setString(4, sUser.getUser_pw());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}
	
	
}













