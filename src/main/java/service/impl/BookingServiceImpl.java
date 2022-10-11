package service.impl;

import java.sql.Connection;

import common.JDBCTemplate;
import dao.face.BookingDao;
import dao.impl.BookingDaoImpl;
import dto.Booking;
import service.face.BookingService;

public class BookingServiceImpl implements BookingService{

	private BookingDao bookingDao = new BookingDaoImpl();
	
	@Override
	public Booking insert(int hotel_no, int room_no, int user_no, String from, String to) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		return bookingDao.bookingInsert(conn, hotel_no, room_no, user_no, from, to);
	}
	
}
