package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

	private BookingService bookingService = new BookingServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/hotel/booking [GET] 호출 성공");
		
		HttpSession session = req.getSession();
		int user_no = (Integer) session.getAttribute("userno");
		int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
		int room_no = Integer.parseInt(req.getParameter("room_no"));
		int room_price = Integer.parseInt(req.getParameter("room_price"));
//		String room_price = req.getParameter("room_price");
		String from = (String) req.getParameter("checkin");
		String to = (String) req.getParameter("checkout");
		
		System.out.println("호텔번호 :" + hotel_no);
		System.out.println("유저번호 :" + user_no);
		System.out.println("객실번호 :" + room_no);
		System.out.println("객실가격 :" + room_price);
		System.out.println("체크인날짜 : " + from);
		System.out.println("체크아웃날짜 : " + to);
		
//		String from = "";
//		String to = "";
//
//		if문으로 활용하기
//		if (req.getParameter("from") != null && req.getParameter("to") != null) {
//
//			 if (req.getParameter("from") != null && req.getParameter("to") != null) {
//
//			from = (String) req.getParameter("from");
//			to = (String) req.getParameter("to");
//
//			SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyyMMdd");
//			SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-MM-dd");
//			Date date1 = null;
//			Date date2 = null;
//
//			try {
//				date1 = beforeFormat.parse(from);
//				date2 = beforeFormat.parse(to);
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//
//			from = afterFormat.format(date1);
//			to = afterFormat.format(date2);
//
//
//			 }
//		}
//		HttpSession session = req.getSession();
//		int user_no = (Integer) session.getAttribute("userno");
//		int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
//		int room_no = Integer.parseInt(req.getParameter("room_no"));
//		String room_price = req.getParameter("room_price");
//		
//		System.out.println("호텔번호 :" + hotel_no);
//		System.out.println("유저번호 :" + user_no);
//		System.out.println("객실번호 :" + room_no);
//		System.out.println("객실가격 :" + room_price);
//		System.out.println("from : " + from);
//		System.out.println("to : " + to);
//		
		// 예약DB 삽입 후 반환
		Booking booking = bookingService.insert(hotel_no, room_no, user_no, from, to, room_price);
		System.out.println(booking);
	}

	//
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/hotel/booking [POST] 요청 성공");
//		String hotel_no = req.getParameter("hotel_no");
//		String room_no = req.getParameter("room_no");
//		
//		HttpSession session = req.getSession();
//		int user_no = (Integer) session.getAttribute("userno");
//		int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
//		int room_no = Integer.parseInt(req.getParameter("room_no"));
//		String room_price = req.getParameter("room_price");
//		String from = (String) req.getParameter("checkin");
//		String to = (String) req.getParameter("checkout");
//		
//		System.out.println("호텔번호 :" + hotel_no);
//		System.out.println("유저번호 :" + user_no);
//		System.out.println("객실번호 :" + room_no);
//		System.out.println("객실가격 :" + room_price);
//		System.out.println("from : " + from);
//		System.out.println("to : " + to);
		
//		Booking booking = bookingService.insert(hotel_no, room_no, user_no, from, to, room_price);
//		System.out.println(booking);
	}

}