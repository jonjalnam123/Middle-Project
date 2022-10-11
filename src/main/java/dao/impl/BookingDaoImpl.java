package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.face.BookingDao;
import dto.Booking;

public class BookingDaoImpl implements BookingDao{
	
	private PreparedStatement ps = null; 
	private ResultSet rs = null; 
	
	@Override
	public Booking bookingInsert(Connection conn, int hotel_no, int room_no, int user_no, String from,
			String to) {
		
		String sql = "";
		sql += "INSERT INTO booking VALUES(booking_seq.nextval, ?, ?, ?, ?, ?, ?)";
		
		
		int result = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, room_no);
			ps.setInt(2, hotel_no);
			ps.setInt(3, user_no);
			ps.setString(4, from);
			ps.setString(1, to);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
}
