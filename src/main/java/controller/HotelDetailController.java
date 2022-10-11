package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Hotel;
import service.face.HotelService;
import service.face.MarkService;
import service.impl.HotelServiceImpl;
import service.impl.MarkServiceImpl;

@WebServlet("/hotel/detail")
public class HotelDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HotelService hotelService = new HotelServiceImpl();
	private MarkService markService = new MarkServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
		//int hotel_no = 4;

		HttpSession session = req.getSession();
		Integer user_no = (Integer) session.getAttribute("userno");
		//System.out.println(user_no);
		// 좋아요 클릭상태 체크
		// 클릭전 -> 빈하트, 클릭후 -> 꽉찬하트로 보여지게함
		if (user_no != null) {
			int check = markService.check(hotel_no, user_no);
			System.out.println("체크 :" + check);
			req.setAttribute("like_check", check);
		}

		Hotel hoteldetail = hotelService.detail(hotel_no);
		req.setAttribute("hotelDetail", hoteldetail);
		req.getRequestDispatcher("/WEB-INF/views/hotelDetail.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// ajax로 전달된 파라미터 data(no) 추출
		int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));

		Hotel hotelinfo = hotelService.detail(hotel_no);
		req.setAttribute("hotelinfo", hotelinfo);
		req.getRequestDispatcher("/WEB-INF/views/hotelInfo.jsp").forward(req, resp);

	}

}
