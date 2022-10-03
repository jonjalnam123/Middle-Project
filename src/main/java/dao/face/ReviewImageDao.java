package dao.face;

import java.sql.Connection;

import dto.ReviewImage;

public interface ReviewImageDao {
	
	public int reviewImageDao(Connection conn);
	
	public int insert(Connection conn, ReviewImage reviewImage);

}
