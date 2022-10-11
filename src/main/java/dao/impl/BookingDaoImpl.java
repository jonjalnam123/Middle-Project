package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import common.JDBCTemplate;
import dao.face.BookingDao;
import dto.Booking;

public class BookingDaoImpl implements BookingDao {
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	@Override
	public int bookingInsert(Connection conn, int hotel_no, int room_no, int user_no, String from, String to,
			int room_price) {

		String sql = "";
		sql += "INSERT INTO booking VALUES(booking_seq.nextval, ?, ?, ?, ?, ?, ?)";

		System.out.println(hotel_no);
		System.out.println(user_no);
		System.out.println(room_no);
		System.out.println(room_price);
		System.out.println(from);
		System.out.println(to);

		int result = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, room_no);
			ps.setInt(2, hotel_no);
			ps.setInt(3, user_no);
			
			// 스트링 -> Date 변환
			SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat afterFormat = new SimpleDateFormat("yyyyMMdd");
			Date date1 = null;
			Date date2 = null;

			date1 = beforeFormat.parse(from);
			date2 = beforeFormat.parse(to);
			from = afterFormat.format(date1);
			to = afterFormat.format(date2);
			ps.setString(4, from);
			ps.setString(5, to);
			ps.setInt(6, room_price);

			result = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}

		return result;
	}

	@Override
	public Booking SelectAllBooking(Connection conn, int hotel_no, int room_no, int user_no, String from, String to,
			int room_price) {

		String sql = "";
		sql += "SELECT * FROM BOOKING WHERE hotel_no=? and room_no=? and user_no=?";
		Booking booking = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, hotel_no);
			ps.setInt(2, room_no);
			ps.setInt(3, user_no);

			rs = ps.executeQuery();

			while (rs.next()) {

				booking = new Booking();

				booking.setBooking_no(rs.getInt("booking_no"));
				booking.setRoom_no(rs.getInt("room_no"));
				booking.setHotel_no(rs.getInt("hotel_no"));
				booking.setUser_no(rs.getInt("user_no"));

				// Date -> String 변환
				Date hotelin = rs.getDate("hotel_in");
				Date hotelout = rs.getDate("hotel_out");
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				String hotel_in = format.format(hotelin);
				String hotel_out = format.format(hotelout);

				booking.setHotel_in(hotel_in);
				booking.setHotel_out(hotel_out);
				booking.setRoom_price(rs.getInt("room_price"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return booking;
	}
}
