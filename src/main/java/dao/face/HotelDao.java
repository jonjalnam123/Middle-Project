package dao.face;

import java.sql.Connection;

import dto.Hotel;

public interface HotelDao {
	
	public Hotel selectHotelByHotelNo(Connection conn, int hotel_no);

	public int insertMarkByhotelno(Connection conn, int hotel_no);

	public int hotelInsert(Connection conn, Hotel hotelparam, int nextSeq);

	public int hotelNextSeq(Connection conn);
}
