package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/hotel/booking")
public class BookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/hotel/booking [GET] 호출 성공");
		
		int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
		int room_no = Integer.parseInt(req.getParameter("hotel_no"));
		
		HttpSession session = req.getSession();
		Integer user_no = (Integer) session.getAttribute("user_no");
		
		// 체크인, 체크아웃 날짜 
		String from = (String) req.getParameter("from");			
		String to = (String) req.getParameter("to");
		System.out.println("체크인날짜 : " + from + "체크아웃날짜 : " + to );
		
		
		
	}

}
