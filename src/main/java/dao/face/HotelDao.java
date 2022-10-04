package dao.face;

import java.sql.Connection;

import dto.Hotel;

public interface HotelDao {
	
	public Hotel selectHotelByHotelNo(Connection conn, int hotel_no);
	
	

}
