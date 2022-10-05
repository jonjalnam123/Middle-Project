package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Review;
import dto.ReviewImage;
import service.face.ReviewService;
import service.impl.ReviewServiceImpl;

@WebServlet("/review")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ReviewService reviewService = new ReviewServiceImpl();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/review [GET]");

		//n번 호텔의 리뷰를 보겠다-> n번이 쿼리스트링으로 넘어옴
		int hotel_no = Integer.parseInt(request.getParameter("hotel_no"));
		request.setAttribute("hotel_no",hotel_no);

		//n번 호텔의 리스트를 최신순으로 보여주는 서비스 작동
		List<Review> reviewList = reviewService.selectAllReview(request);
		System.out.println("리뷰리스트 불러오기 성공");
		System.out.println(reviewList.size());
		List<List<ReviewImage>> reviewimageList = reviewService.selectAllReviewImage(request);
		System.out.println("리뷰이미지리스트 불러오기 성공");
		System.out.println(reviewimageList.size());

		request.setAttribute("reviewList",reviewList);
		request.setAttribute("reviewimageList",reviewimageList);
		
		request.getRequestDispatcher("/WEB-INF/views/reviewShow_ok.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}

}
