package controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Booking;
import service.face.BookingService;
import service.impl.BookingServiceImpl;


@WebServlet("/booking")
public class BookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BookingService bookingService = new BookingServiceImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("WEB-INF/views/bookingPage.jsp").forward(req, resp);
	
		//Booking bookingparam = new Booking();
		Booking bookingparam = bookingService.GetBooking(1);
		
		//Booking viewBooking = BookingService.view(hotel_no);
		
		//req.setAttribute("viewBooking", viewBooking);
		
		req.getParameter("hotel_no");
	
		
	}
	

}
