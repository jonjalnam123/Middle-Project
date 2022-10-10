package controller;


import java.io.IOException;
import java.util.List;

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
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


      int hotel_no = Integer.parseInt(req.getParameter("hotel_no"));
      
      List<Room> roominfo = roomService.detail(hotel_no);
      req.setAttribute("roominfo", roominfo);
      
      req.getRequestDispatcher("/WEB-INF/views/roomDetail.jsp").forward(req, resp);

   }
 
}