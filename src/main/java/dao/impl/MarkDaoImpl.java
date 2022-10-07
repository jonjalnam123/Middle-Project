package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;

public class MarkDaoImpl implements MarkDao {

	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	@Override
	public int updateMark(Connection conn, int hotel_no, int user_no) {

		String sql = "";
		sql += "INSERT INTO mark VALUES";
		sql += "(mark2_seq.nextval, ?, ?)";

		int updateRes = 0;

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, hotel_no);
			ps.setInt(2, user_no);

			updateRes = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		return updateRes;
	}

	@Override
	public Mark selectMark2(Connection conn, int hotel_no, int user_no) {

		String sql = "";
		sql += "SELECT * FROM mark WHERE hotel_no=? and user_no=?";
		Mark mark = null;

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, hotel_no);
			ps.setInt(2, user_no);

			rs = ps.executeQuery();

			while (rs.next()) {

				mark = new Mark();

				mark.setMark_no(rs.getInt("mark_no"));
				mark.setUser_no(rs.getInt("user_no"));
				mark.setHotel_no(rs.getInt("hotel_no"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		return mark;
	}

	@Override
	public int checkMarkCount(Connection conn, int hotel_no, int user_no) {

		String sql = "";
		sql += "select count(*) cnt FROM mark WHERE hotel_no=? and user_no=?";

		int count = 0;

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, hotel_no);
			ps.setInt(2, user_no);

			rs = ps.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		return count;
	}
	
	@Override
	public void deleteMark(Connection conn, int hotel_no, int user_no) {
		
		String sql ="";
		sql += "delete from mark where hotel_no=? and user_no=?";
		
		int res = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, hotel_no);
			ps.setInt(2, user_no);
			
			res = ps.executeUpdate();
			
			if( res > 0 ) {
				JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
	}
	
	@Override
	public List<Mypage> myPageInfo(Connection conn, int user_no) {
		
		String sql = "";
		sql += "SELECT h.hotel_name, h.hotel_tel, h.hotel_photo, u.user_name";
		sql += " FROM mark m";
		sql += " JOIN hotel h ON (m.hotel_no = h.hotel_no)";
		sql += " JOIN semi_user u ON (m.user_no = u.user_no)";
		sql += " WHERE m.user_no = ?";
		
		List<Mypage> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, user_no);
			rs = ps.executeQuery();
			
			
			while (rs.next()) {

				Mypage mypage = new Mypage();

				mypage.setHotel_name(rs.getString("hotel_name"));
				mypage.setHotel_tel(rs.getString("hotel_tel"));
				mypage.setHotel_photo(rs.getString("hotel_photo"));
				mypage.setUser_name(rs.getString("user_name"));

				list.add(mypage);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return list;
	}

}