package service.impl;

import java.sql.Connection;

import common.JDBCTemplate;
import dao.face.HotelDao;
import dao.impl.HotelDaoImpl;
import dto.Hotel;
import service.face.HotelService;

public class HotelServiceImpl implements HotelService {
	
	private HotelDao hotelDao = new HotelDaoImpl();
	
	@Override
	public Hotel detail(int hotel_no) {
		
		Connection conn = JDBCTemplate.getConnection();

		return hotelDao.selectHotelByHotelNo(conn, hotel_no);
		
	}
	
	@Override
	public Hotel insertMark(int hotel_no) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		if( hotelDao.insertMarkByhotelno(conn, hotel_no) > 0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		Hotel hotel = hotelDao.selectHotelByHotelNo(conn, hotel_no);
		
		return hotel;
	}
}
