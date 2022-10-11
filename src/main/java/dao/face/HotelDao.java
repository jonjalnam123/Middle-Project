package dao.face;

import java.sql.Connection;
import java.util.List;

import dto.Hotel;

public interface HotelDao {
	
	public Hotel selectHotelByHotelNo(Connection conn, int hotel_no);

	public int insertMarkByhotelno(Connection conn, int hotel_no);

	public int hotelInsert(Connection conn, Hotel hotelparam, int nextSeq);

	public int hotelNextSeq(Connection conn);

	public List<Hotel> selectAllHotelList(Connection conn);
}
