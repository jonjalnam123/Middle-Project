package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import dao.face.ReviewImageDao;
import dto.ReviewImage;

public class ReviewImageDaoImpl implements ReviewImageDao {
	
	private PreparedStatement ps; //SQL수행 객체
	private ResultSet rs; //SQL조회 결과 객체
	
	@Override
	public int reviewImageDao(Connection conn) {

		return 0;
	}

	@Override
	public int insert(Connection conn, ReviewImage reviewImage) {

		String sql = "";
		sql += "INSERT INTO reviewimage( reviewimage_no, review_no, originname, storedname )";
		sql += " VALUES( reviewimage_seq.nextval, ?, ?, ? )";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			
			//ps.setInt(1, reviewImage.getReviewimage_no());
			ps.setInt(1, reviewImage.getReview_no());
			ps.setString(2, reviewImage.getOriginname());
			ps.setString(3, reviewImage.getStoredname());
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
		return res;
	}

}