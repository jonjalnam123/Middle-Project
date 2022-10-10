package dao.face;

import java.sql.Connection;
import java.util.List;

import dto.Room;



public interface RoomDao {

	/**
	 * 
	 * @param conn
	 * @return
	 */
	public List<Room> selectAll(Connection conn);

	/**
	 * 
	 * @param conn
	 * @param roomparam
	 * @return
	 */
	public int insert(Connection conn, Room roomparam);

	/**
	 * 
	 * @param conn
	 * @param hotel_no
	 * @return
	 */
	public Room selectroomByRoomNo(Connection conn, int hotel_no);



}
