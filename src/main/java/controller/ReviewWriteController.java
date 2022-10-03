package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.face.ReviewService;
import service.impl.ReviewServiceImpl;

//n번 호텔의 리뷰를 작성하겠다는 요청이 넘어옴
//아리님, 쿼리스트링으로 넘겨주세요
//넘겨주셔야 할 파라미터 : hotel_no, pay_no, booking_no, room_type
@WebServlet("/review/write")
public class ReviewWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ReviewService reviewService = new ReviewServiceImpl();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		//n번 호텔의 리뷰를 작성하겠다는 요청이 넘어옴
//		int hotel_no = Integer.parseInt(request.getParameter("hotel_no"));
//		//jsp에서 호텔 사진 필요하므로 호텔 사진 불러들이는 service 실행
//		Hotel hotel = reviewService.selectHotelByHotelNo(request,hotel_no);
//		String hotelPhotoLocation = hotel.getHotel_photo();
//		String hotel_name = hotel.getHotel_name();
//		//리뷰 작성 jsp에 호텔사진위치 넘겨주기
//		request.setAttribute("hotelPhotoLocation",hotelPhotoLocation);
//		//쿼리스트링에서 pay_no, booking_no, room_type 가져오기
//		String pay_no= request.getParameter("pay_no");
//		String booking_no = request.getParameter("booking_no");
//		String room_type = request.getParameter("room_type");
//		//jsp에 값 넘겨주기 
//		request.setAttribute("pay_no",pay_no);
//		request.setAttribute("booking_no",booking_no);
//		request.setAttribute("room_type",room_type);
//		request.setAttribute("hotel_name",hotel_name);
//		request.setAttribute("hotel_no",hotel_no);

		
		/*
		 * HttpSession session = request.getSession(); 
		 * session.getId();
		 */
		
		request.getRequestDispatcher("/WEB-INF/views/reviewWrite.jsp").forward(request,response);
		

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자가 작성한 리뷰값들이 넘어옴
		
		reviewService.writeReview(request);

		//request.getRequestDispatcher("/WEB-INF/views/").forward(request,response);   //아리님이 쿼리스티링 전달해준 페이지 url로 되돌아가기

	}

}
