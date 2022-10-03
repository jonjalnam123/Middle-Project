package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import common.JDBCTemplate;
import dao.face.ReviewDao;
import dto.Review;

public class ReviewDaoImpl implements ReviewDao {
	
	private PreparedStatement ps; //SQL수행 객체
	private ResultSet rs; //SQL조회 결과 객체
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssS");
	
	@Override
	public List<Review> selectAll(Connection conn, int hotel_no) {

		//SQL작성
		String sql = "";
		sql += "SELECT * FROM review";
		sql += " WHERE hotel_no = ? ";
		sql += " ORDER BY review_date desc";
				
		//결과 저장할 List
		List<Review> reviewList = new ArrayList<>();
				
		try {
			ps = conn.prepareStatement(sql); //SQL수행 객체
			
			ps.setInt(1, hotel_no);
			
			rs = ps.executeQuery(); //SQL수행 및 결과 집합 저장
					
			//조회 결과 처리
			while(rs.next()) {
			Review r = new Review(); //결과값 저장 객체
						
			//결과값 한 행씩 처리
			r.setPay_no(rs.getInt("pay_no"));
			r.setReview_no(rs.getInt("review_no"));
			r.setHotel_no(rs.getInt("hotel_no"));
			r.setBooking_no(rs.getInt("bookin_no"));
			r.setUser_email(rs.getString("user_email"));
			r.setReview_content(rs.getString("review_content"));
			r.setReview_score(rs.getInt("review_score"));
			r.setReview_date(rs.getDate("review_date"));
						
			//리스트에 결과값 저장
			reviewList.add(r);
						
		}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//DB객체 닫기
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
				
		//최종 결과 반환
	return reviewList;
	}

	@Override
	public int selectNextReviewno(Connection conn) {
		
		String sql = "";
		sql += "SELECT REVIEW_seq.nextval FROM dual";
		
		int nextReviewNo = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				nextReviewNo = rs.getInt("nextval");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return nextReviewNo;
	}

	@Override
	public int insert(Connection conn, Review review) {
		
		

		String sql = "";
		sql += "INSERT INTO review ( pay_no, review_no, hotel_no, booking_no, user_email, review_content, review_score)";
		sql += " VALUES ( ?, ?, ?, ?, ?, ?, ?)";
		
		int res = 0;

		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, review.getPay_no());
			ps.setInt(2, review.getReview_no());
			ps.setInt(3, review.getHotel_no());
			ps.setInt(4, review.getBooking_no());
			ps.setString(5, review.getUser_email());
			ps.setString(6, review.getReview_content());
			ps.setInt(7, review.getReview_score());
			
			//String reviewWriteTime = sdf.format(review.getReview_date());
			//ps.setDate(8, java.sql.Date.valueOf( reviewWriteTime));
			
			res = ps.executeUpdate();
			
			System.out.println(res);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}

}
