package dao.face;


import java.sql.Connection;
import java.util.List;

import dto.Semi_User;

public interface Semi_UserDao {
	
	
	/**
	 * 이메일과 비번 동시에 만족하는 회원 수 조회
	 * 
	 * @param sUer
	 * @return int - 0: 존재x, 1: 존재o
	 */
	public int selectCntByUserEmailPw(Connection conn, Semi_User sUer);
	
	
	public Semi_User selectUserByUseremail(Connection conn, Semi_User sUser);
	
	//-----------------------------------------------------------------------------

	
	/**
	 * 이메일과 폰번호 동시에 만족하는 회원 수 조회
	 * 
	 * @param connection
	 * @param sUser
	 * @return
	 */
	public int selectCntByEmailPhone(Connection conn, Semi_User sUser);
	
	
	/**
	 * 이메일/폰번호로 비번 찾기
	 * 
	 * @param conn
	 * @param sUser
	 * @return
	 */
	public Semi_User findPwByUseremailPhone(Connection conn, Semi_User sUser);
	
	
	
	//-----------------------------------------------------------------------------

	
	/**
	 * 회원정보 삽입
	 * 
	 * @param conn
	 * @param sUser
	 * @return int - 1: 인서트 성공, 0: 인서트 실패
	 */
	public int insert(Connection conn, Semi_User sUser);
	
	
	/**
	 * 이메일 중복 확인을 위한 cnt 조회
	 * 
	 * @param conn
	 * @param sUer
	 * @return
	 */
	public int selectCntByUserEmail(Connection conn, Semi_User sUser);
	
	
	//-----------------------------------------------------------------------------
	

}
