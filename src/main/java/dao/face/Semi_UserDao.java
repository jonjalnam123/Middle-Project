package dao.face;


import java.sql.Connection;
import java.util.List;

import dto.Semi_User;
import dto.Semi_User;

public interface Semi_UserDao {
	
	public int selectCntByUserEmailPw(Semi_User sUer);

	public List<Semi_User> selectAllReviewWriterByHotelNo(Connection conn, int hotel_no);

}
