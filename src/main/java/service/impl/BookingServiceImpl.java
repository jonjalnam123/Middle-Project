package service.impl;

import java.sql.Connection;

import common.JDBCTemplate;
import dao.face.BookingDao;
import dao.impl.BookingDaoImpl;
import dto.Booking;
import service.face.BookingService;

public class BookingServiceImpl implements BookingService {

	private BookingDao bookingDao = new BookingDaoImpl();

	@Override
	public Booking insert(int hotel_no, int room_no, int user_no, String from, String to, String room_price) {

		Connection conn = JDBCTemplate.getConnection();

		int result = bookingDao.bookingInsert(conn, hotel_no, room_no, user_no, from, to, room_price);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		return bookingDao.SelectAllBooking(conn, hotel_no, room_no, user_no, from, to, room_price);
	}

}
