package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Booking;
import service.face.BookingService;
import service.impl.BookingServiceImpl;

@WebServlet("/hotel/booking")
public class BookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//private BookingService bookingService = new BookingServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/hotel/booking [GET] 호출 성공");
		
		String hotel_no = req.getParameter("hotel_no");
		String room_no = req.getParameter("room_no");

		HttpSession session = req.getSession();
		Integer user_no = (Integer) session.getAttribute("user_no");
		
		String from = (String) req.getParameter("from");			
		String to = (String) req.getParameter("to");
		System.out.println("호텔번호 : " + hotel_no + "룸번호 : " + room_no);
		System.out.println("체크인날짜 : " + from + "체크아웃날짜 : " + to );
		
	}
	//
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * // 체크인, 체크아웃 날짜 String hotel_no = req.getParameter("hotel_no"); String
		 * room_no = req.getParameter("room_no");
		 * 
		 * String from = (String) req.getParameter("from"); String to = (String)
		 * req.getParameter("to"); System.out.println("체크인날짜 : " + from + "체크아웃날짜 : " +
		 * to ); System.out.println("호텔번호 : " + hotel_no + "룸번호 : " + room_no);
		 */
		
		
	}

}