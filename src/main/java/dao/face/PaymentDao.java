package dao.face;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

public interface PaymentDao {

	public List<Map<String, Object>> selectAllPayedHotelByUserNo(Connection conn, int user_no);
	
	
}
