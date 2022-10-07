package service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.Hotel;
import dto.Review;
import dto.ReviewImage;
import dto.Semi_User;


public interface ReviewService {
	
	//-------------리뷰 write에 필요한 메서드
	public void writeReview(HttpServletRequest req);
	
	public Hotel selectHotelByHotelNo(HttpServletRequest request, int hotel_no);
	
	//--------------리뷰 list 최신순에 필요한 메서드

	public List<Review> selectAllReview(HttpServletRequest request);
	
	public List<List<ReviewImage>> selectAllReviewImage(HttpServletRequest request);
	
	public List<Semi_User> selectAllReviewWriterByHotelNo(HttpServletRequest request, int hotel_no);
	
	//--------------리뷰 list 별점순에 필요한 메서드
	
	public List<Review> selectAllReviewByScore(HttpServletRequest request);
	
	List<List<ReviewImage>> selectAllReviewImageByScore(HttpServletRequest request);
	
	public List<Semi_User> selectAllReviewWriterByHotelNoByScore(HttpServletRequest request, int hotel_no);

}
