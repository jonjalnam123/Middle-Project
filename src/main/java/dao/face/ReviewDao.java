package dao.face;

import java.sql.Connection;
import java.util.List;

import dto.Review;

public interface ReviewDao {
	
	public int selectNextReviewno(Connection conn);
	
	public int insert(Connection conn, Review review);
	
	public List<Review> selectAll(Connection conn, int hotel_no);
	
	//--------------------별점순
	public List<Review> selectAllByScore(Connection conn, int hotel_no);

}
