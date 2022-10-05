package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import dao.face.ReviewImageDao;
import dto.ReviewImage;



public class ReviewImageDaoImpl implements ReviewImageDao {
	
	private PreparedStatement ps; //SQL수행 객체
	private ResultSet rs; //SQL조회 결과 객체
	private PreparedStatement pstmt = null;
	
	
	@Override
	public List<List<ReviewImage>> selectAll(Connection conn, int hotel_no) {
		
		System.out.println("selectAllReviewWriterByHotelNo daoimpl 실행");


		List<List<ReviewImage>> list = new ArrayList<>();
		
		//SQL작성
		String sql = "";
		sql += "select r.review_no, r.hotel_no, r.pay_no, r.booking_no, r.user_email, r.review_content, r.review_score, i.reviewimage_no, i.originname, i.storedname  from review r";
		sql += " left outer join reviewimage i";
		sql += " on r.review_no = i.review_no";
		sql += " where hotel_no = ?";
		sql += " ORDER BY review_date desc";
		
		int pk = 0;
		List<ReviewImage> listImage = new ArrayList<>();;
		


		try {
			//ps = conn.prepareStatement(sql);			
			//rs = ps.executeQuery();
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setInt(1, hotel_no);

			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				ReviewImage reviewImage = new ReviewImage();
				if(pk != rs.getInt("review_no")) {
					if(rs.isFirst()) {
					} else {
					list.add(listImage);
					listImage = new ArrayList<>();
					}


					reviewImage.setReviewimage_no( rs.getInt("reviewimage_no") );
					reviewImage.setReview_no( rs.getInt("review_no") );
					reviewImage.setOriginname( rs.getString("originname") );
					reviewImage.setStoredname( rs.getString("storedname") );
					System.out.println(reviewImage);
					
					listImage.add(reviewImage);
					
					if(rs.isLast()) {
						list.add(listImage);
					}
					pk =  rs.getInt("review_no");

				} else {
					
					reviewImage.setReviewimage_no( rs.getInt("reviewimage_no") );
					reviewImage.setReview_no( rs.getInt("review_no") );
					reviewImage.setOriginname( rs.getString("originname") );
					reviewImage.setStoredname( rs.getString("storedname") );


					listImage.add(reviewImage);

					pk =  rs.getInt("review_no");
					
					if(rs.isLast()) {
						list.add(listImage);
					}

		}
	}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		return list;
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
