package service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Hotel;
import dto.Review;

public interface ReviewService {

	public List<Review> selectAll(HttpServletRequest request);
	
	public void writeReview(HttpServletRequest req);
	
	public Hotel selectHotelByHotelNo(HttpServletRequest request, int hotel_no);
	

}
