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
	private Connection conn;

	@Override
	public int selectCntByUserEmailPw(Semi_User sUser) {

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
			
			System.out.println("user_email" + rs.getString("user_email"));
			
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













