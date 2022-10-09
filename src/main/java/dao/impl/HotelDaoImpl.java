package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import dao.face.HotelDao;
import dto.Hotel;

public class HotelDaoImpl implements HotelDao {

	private PreparedStatement ps; // SQL수행 객체
	private ResultSet rs; // SQL조회 결과 객체

	@Override
	public Hotel selectHotelByHotelNo(Connection conn, int hotel_no) {

		// SQL작성
		String sql = "";
		sql += "SELECT * FROM hotel";
		sql += " WHERE hotel_no = ? ";

		Hotel hotel = new Hotel(); // 결과값 저장 객체

		try {
			ps = conn.prepareStatement(sql); // SQL수행 객체
			ps.setInt(1, hotel_no);
			rs = ps.executeQuery();

			// 조회 결과 처리
			while (rs.next()) {

				// 결과값 한 행씩 처리
				hotel.setHotel_no(rs.getInt("hotel_no"));
				hotel.setHotel_name(rs.getString("hotel_name"));
				hotel.setHotel_addr(rs.getString("hotel_addr"));
				hotel.setHotel_tel(rs.getString("hotel_tel"));
				hotel.setHotel_info(rs.getString("hotel_info"));
				hotel.setHotel_photo(rs.getString("hotel_photo"));
				hotel.setMark_hit(rs.getInt("mark_hit"));
				hotel.setHotel_intime(rs.getString("hotel_intime"));
				hotel.setHotel_outtime(rs.getString("hotel_outtime"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// DB객체 닫기
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		// 최종 결과 반환
		return hotel;
	}

	@Override
	public int insertMarkByhotelno(Connection conn, int hotel_no) {

		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "";
		sql += "UPDATE hotel";
		sql += "	SET mark_hit = mark_hit + 1";
		sql += " WHERE hotel_no = ?";

		int res = 0;

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, hotel_no);

			res = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		return res;

	}

	@Override
	public int hotelInsert(Connection conn, Hotel hotelparam, int nextSeq) {

		String sql = "";
		sql += "INSERT INTO hotel VALUES";
		sql += "(?, ?, ?, ?, ?, ?, ?, ?, ?)";

		int result = 0;

		try {
			ps = conn.prepareStatement(sql);

			ps.setInt(1, nextSeq);
			ps.setString(2, hotelparam.getHotel_name());
			ps.setString(3, hotelparam.getHotel_addr());
			ps.setString(4, hotelparam.getHotel_tel());
			ps.setString(5, hotelparam.getHotel_info());
			ps.setString(6, hotelparam.getHotel_photo());
			ps.setInt(7, hotelparam.getMark_hit());
			ps.setString(8, hotelparam.getHotel_intime());
			ps.setString(9, hotelparam.getHotel_outtime());

			result = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}

		return result;
	}
	
	@Override
	public int hotelNextSeq(Connection conn) {
		
		String sql = "";
		sql += "select hotel_seq.nextval from dual";
		
		int seqNum = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				seqNum = rs.getInt(1);
			}
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return seqNum;
	}

}