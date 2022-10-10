package service.impl;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import dao.face.PaymentDao;
import dao.impl.PaymentDaoImpl;
import service.face.PaymentService;

public class PaymentServiceImpl implements PaymentService {
	
	PaymentDao paymentDao = new PaymentDaoImpl();
	

	@Override
	public List<Map<String, Object>> selectAllPayedHotel(HttpServletRequest request) {

		Connection conn = JDBCTemplate.getConnection();
		int user_no =  (int) request.getSession().getAttribute("user_no"); 

		return paymentDao.selectAllPayedHotelByUserNo(conn, user_no);
		

	}

}
