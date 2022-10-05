package dao.face;

import java.sql.Connection;
import java.util.List;

import dto.ReviewImage;

public interface ReviewImageDao {
	
	public List<List<ReviewImage>> selectAll(Connection conn, int hotel_no);
	
	public int insert(Connection conn, ReviewImage reviewImage);

}
