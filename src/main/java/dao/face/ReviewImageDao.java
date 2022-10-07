package dao.face;

import java.sql.Connection;
import java.util.List;

import dto.ReviewImage;

public interface ReviewImageDao {
	
	public int insert(Connection conn, ReviewImage reviewImage);
	
	//최신순 리스트 메서드
	public List<List<ReviewImage>> selectAll(Connection conn, int hotel_no);
	
	//별점순 리스트 메서드
	public List<List<ReviewImage>> selectAllByScore(Connection conn, int hotel_no);

}
