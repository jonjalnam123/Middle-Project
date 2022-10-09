package controller;


import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import dto.Room;
import service.face.RoomService;
import service.impl.RoomServiceImpl;


@WebServlet("/room/detail")
public class RoomDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//서비스 객체
	RoomService roomService = new RoomServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//호텔번호 받아오기
		String parameter = req.getParameter("hotel_no");

		int hotel_no = 0;

		if(parameter != null && !"".equals(parameter)) {
			hotel_no = Integer.parseInt(parameter);
		}

		Room roominfo = roomService.detail(hotel_no);

		req.setAttribute("roominfo", roominfo);
		req.getRequestDispatcher("WEB-INF/views/roomList.jsp").forward(req, resp);


	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
		
		Room roominfo = roomService.detail(hotel_no);
		req.setAttribute("roominfo", roominfo);
		
		resp.sendRedirect("/roomDetail");

	}

}
