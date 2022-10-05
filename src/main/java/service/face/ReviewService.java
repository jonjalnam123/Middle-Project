package service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.Hotel;
import dto.Review;
import dto.ReviewImage;
import dto.Semi_User;

public interface ReviewService {

	public List<Review> selectAllReview(HttpServletRequest request);
	
	public List<List<ReviewImage>> selectAllReviewImage(HttpServletRequest request);
	
	public void writeReview(HttpServletRequest req);
	
	public Hotel selectHotelByHotelNo(HttpServletRequest request, int hotel_no);
	
	public List<Semi_User> selectAllReviewWriterByHotelNo(HttpServletRequest request, int hotel_no);
	

}
