package dao.face;

import java.sql.Connection;
import java.util.List;

import dto.Review;

public interface ReviewDao {
	
	public List<Review> selectAll(Connection conn, int hotel_no);	
	
	public int selectNextReviewno(Connection conn);
	
	public int insert(Connection conn, Review review);

}
