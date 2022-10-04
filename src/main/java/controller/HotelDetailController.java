package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.HOTEL2;
import dto.Hotel;
import service.face.HotelService;
import service.impl.HotelServiceImpl;

@WebServlet("/hotel/detail")
public class HotelDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HotelService hotelService = new HotelServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// 상세페이지에 뿌릴 호텔정보 //
//		String parameter = req.getParameter("hotel_no"); //호텔번호 파라미터
//		
//		int hotel_no = 0;
//		
//		if(parameter != null && !"".equals(parameter)) {
//			hotel_no = Integer.parseInt(parameter);
//		}
//		
//		Hotel hoteldetail = hotelService.detail(hotel_no);
//		
//		req.setAttribute("hotelDetail", hoteldetail);
		
		req.getRequestDispatcher("/WEB-INF/views/hotelDetail.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// ajax로 전달된 파라미터 data(no) 추출
		String parameter = req.getParameter("hotelno");
		// System.out.println("no: " + parameter);

		int hotel_no = 0;

		if (parameter != null && !"".equals(parameter)) {
			hotel_no = Integer.parseInt(parameter);
		}
		
		Hotel hotelinfo = hotelService.detail(hotel_no);
		req.setAttribute("hotelinfo", hotelinfo);
		req.getRequestDispatcher("/WEB-INF/views/hotelInfo.jsp").forward(req, resp);

	}

}
