package dao.face;

import java.sql.Connection;

import dto.Booking;
import dto.Reserve;

public interface BookingDao {

	public int bookingInsert(Connection conn, int hotel_no, int room_no, int user_no, String from, String to, int room_price);

	public Booking SelectAllBooking(Connection conn, int hotel_no, int room_no, int user_no, String from, String to,
			int room_price);

	public Reserve SelectAllByBookingNo(Connection conn, int booking_no);

}
