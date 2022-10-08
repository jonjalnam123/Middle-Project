package dao.face;

import java.sql.Connection;
import java.util.List;

import dto.ReviewImage;

public interface ReviewImageDao {
	
	public int insert(Connection conn, ReviewImage reviewImage);
	

}
