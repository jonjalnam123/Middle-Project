package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.JDBCTemplate;
import dao.face.PaymentDao;
import dto.Booking;
import dto.Payment;

public class PaymentDaoImpl implements PaymentDao {
	
	private PreparedStatement ps; //SQL수행 객체
	private ResultSet rs; //SQL조회 결과 객체
	private SimpleDateFormat formatter = new SimpleDateFormat("yyyy.mm.dd hh:mm");

	
	@Override
	public List<Map<String, Object>> selectAllPayedHotelByUserNo(Connection conn, int user_no) {

		String sql = "";
		sql += "select h.hotel_photo, p.pay_no, b.booking_no, p.user_no, p.pay_total, p.pay_kind, p.pay_ok, p.pay_date, b.room_no, b.hotel_no, b.hotel_in, b.hotel_out, b.room_price, r.room_type, h.hotel_name from payment p";
		sql += " join booking b";
		sql += " on p.booking_no = b.booking_no";
		sql += " join room r";
		sql += " on r.room_no = b.room_no";
		sql += " join hotel h";
		sql += " on h.hotel_no = b.hotel_no";
		sql += " where p.user_no = ?";
		
		//결과 저장할 List
		List<Map<String, Object>> resultlist = new ArrayList<>();
		Map<String, Object> map;
		
		try {
			ps = conn.prepareStatement(sql); //SQL수행 객체
			
			ps.setInt(1, user_no);
			
			rs = ps.executeQuery(); //SQL수행 및 결과 집합 저장
								
			//조회 결과 처리
			while(rs.next()) {

			//결과값 저장 객체
			Payment p = new Payment(); 
			Booking b = new Booking();
			
			p.setUser_no(rs.getInt("user_no"));
			p.setBooking_no(rs.getInt("booking_no"));
			p.setPay_no(rs.getInt("pay_no"));
			p.setPay_total(rs.getInt("pay_total"));
			p.setPay_kind(rs.getString("pay_kind"));
			p.setPay_ok(rs.getInt("pay_ok"));
			
			String dateStr = rs.getString("pay_date");
	        Date date = formatter.parse(dateStr);			
			p.setPay_date(date);

			b.setBooking_no(rs.getInt("booking_no"));
			b.setRoom_no(rs.getInt("room_no"));
			b.setUser_no(rs.getInt("user_no"));
			b.setHotel_no(rs.getInt("hotel_no"));
			b.setHotel_in(rs.getString("hotel_in"));
			b.setHotel_out(rs.getString("hotel_out"));

			//넣을 map 생성
			map = new HashMap<>();
			
			map.put("p", p);
			map.put("b", b);
			map.put("hotel_name", rs.getString("hotel_name"));
			map.put("room_name", rs.getString("room_name"));
			map.put("hotel_photo", rs.getString("hotel_photo"));

			
			//list에 map 넣기
			resultlist.add(map);
						
		}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			//DB객체 닫기
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		//최종 결과 반환
	return resultlist;
	}
	
	

}
