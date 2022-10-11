package dao.face;

import java.sql.Connection;

import dto.Booking;

public interface BookingDao {

	Booking bookingInsert(Connection conn, int hotel_no, int room_no, int user_no, String from, String to);

}
