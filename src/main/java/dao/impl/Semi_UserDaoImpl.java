package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import dao.face.Semi_UserDao;
import dto.Semi_User;
import dto.Semi_User;

public class Semi_UserDaoImpl implements Semi_UserDao {
	
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public int selectCntByUserEmailPw(Connection conn, Semi_User sUser) {

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
	
	
	
	@Override
	public Semi_User selectUserByUseremail(Connection conn, Semi_User sUser) {

		String sql = "";
		sql += "SELECT user_email, user_name, user_pw FROM semi_user";
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
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		
		return result;
	}
	
	//------------------------------------------------------------------------------

	
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
	
	
	//------------------------------------------------------------------------------



	@Override
	public List<Semi_User> selectAllReviewWriterByHotelNo(Connection conn, int hotel_no) {

		String sql = "";
		sql += "select s.user_no, s.user_name, s.user_email, s.user_phone, s.user_pw, s.user_pic  from (select * from review";
		sql += " where hotel_no = ? ) r";
		sql += " left outer join semi_user s";
		sql += " on r.user_email = s.user_email";
		sql += " ORDER BY review_date desc";
		
		List<Semi_User> list =  new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql); //SQL수행 객체
			
			ps.setInt(1, hotel_no);
			
			rs = ps.executeQuery(); //SQL수행 및 결과 집합 저장
								
			//조회 결과 처리
			while(rs.next()) {
			Semi_User r = new Semi_User(); //결과값 저장 객체
						
			//결과값 한 행씩 처리
			r.setUser_no(rs.getInt("user_no"));
			r.setUser_name(rs.getString("user_name"));
			r.setUser_email(rs.getString("user_email"));			
			r.setUser_phone(rs.getString("user_phone"));
			r.setUser_pw(rs.getString("user_pw"));
			r.setUser_pic(rs.getString("user_pic"));

						
			//리스트에 결과값 저장
			list.add(r);
						
		}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//DB객체 닫기
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		//최종 결과 반환
	return list;
	}

	
	@Override
	public List<Semi_User> selectAllReviewWriterByHotelNoByScore(Connection conn, int hotel_no) {

		String sql = "";
		sql += "select s.user_no, s.user_name, s.user_email, s.user_phone, s.user_pw, s.user_pic from (select * from review";
		sql += " where hotel_no = ? ) r";			
		sql += " left outer join semi_user s";
		sql += " on r.user_email = s.user_email";
		sql += " ORDER BY review_score desc";	
		sql += " , review_date desc";
		
		List<Semi_User> list =  new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql); //SQL수행 객체
			
			ps.setInt(1, hotel_no);
			
			rs = ps.executeQuery(); //SQL수행 및 결과 집합 저장
								
			//조회 결과 처리
			while(rs.next()) {
			Semi_User r = new Semi_User(); //결과값 저장 객체
						
			//결과값 한 행씩 처리
			r.setUser_no(rs.getInt("user_no"));
			r.setUser_name(rs.getString("user_name"));
			r.setUser_email(rs.getString("user_email"));			
			r.setUser_phone(rs.getString("user_phone"));
			r.setUser_pw(rs.getString("user_pw"));
			r.setUser_pic(rs.getString("user_pic"));

						
			//리스트에 결과값 저장
			list.add(r);
						
		}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//DB객체 닫기
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		//최종 결과 반환
	return list;
	}

	
}













