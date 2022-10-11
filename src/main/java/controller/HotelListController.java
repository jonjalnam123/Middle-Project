package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Hotel;
import service.face.HotelService;
import service.impl.HotelServiceImpl;

@WebServlet("/hotel/list")
public class HotelListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HotelService hotelService = new HotelServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		List<Hotel> hotelList = hotelService.list();
		
		req.setAttribute("hotelList", hotelList);

		req.getRequestDispatcher("/WEB-INF/views/hotelList.jsp").forward(req, resp);
	}
}
