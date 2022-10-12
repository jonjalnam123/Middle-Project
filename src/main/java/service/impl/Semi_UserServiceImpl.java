package service.impl;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import dao.face.Semi_UserDao;
import dao.impl.Semi_UserDaoImpl;
import dto.Semi_User;
import service.face.Semi_UserService;

public class Semi_UserServiceImpl implements Semi_UserService {
	
	//Dao객체
	private Semi_UserDao sUserDao = new Semi_UserDaoImpl();

	@Override
	public Semi_User getLoginUser(HttpServletRequest req) {
		
		Semi_User sUser = new Semi_User();
		
		sUser.setUser_email(req.getParameter("useremail"));
		sUser.setUser_pw(req.getParameter("userpw"));
		
		return sUser;
	}
	
	
	@Override
	public boolean login(Semi_User sUser) {
		
		if(sUserDao.selectCntByUserEmailPw(JDBCTemplate.getConnection(), sUser) > 0) {
			return true;
		} else {
		return false;
		}
	}

	
	@Override
	public Semi_User info(Semi_User sUser) {
		return sUserDao.selectUserByUseremail(JDBCTemplate.getConnection(), sUser);
	}
	
	
	//--------------------------------------비밀번호 찾기------------------------------------------------------

	
	@Override
	public Semi_User getEmailPhone(HttpServletRequest req) {
		
		Semi_User sUser = new Semi_User();
		
		sUser.setUser_email(req.getParameter("useremail"));
		sUser.setUser_phone(req.getParameter("userphone"));
		
		return sUser;
	}
	
	
	@Override
	public int exists(Semi_User sUser) {
		if(sUserDao.selectCntByEmailPhone(JDBCTemplate.getConnection(), sUser) > 0) {
			return 1; //조회 성공
		} else {
		return 0; //실패
		}
	}
	
	
	
	@Override
	public String getRamdomPassword(int len) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7',
				'8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 
				'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
				'U', 'V', 'W', 'X', 'Y', 'Z' };

		  int idx = 0;
		  StringBuffer sb = new StringBuffer();
		  
		  for (int i = 0; i < len; i++) {
			
			  idx = (int) (charSet.length * Math.random());
			  sb.append(charSet[idx]);
		  }

		  return sb.toString();
	}
	
	
	@Override
	public Semi_User createTempPw(Semi_User sUser) {

		if(exists(sUser) == 1) {
			
			//dto에 임시비번 10자리 생성해서 저장
			sUser.setUser_pw(getRamdomPassword(10));
		}
		return sUser;
	}
	
	
	@Override
	public boolean isOkUpdateTempPw(Semi_User sUser) {
		Connection conn = JDBCTemplate.getConnection();
		
		if(sUserDao.updateTempPw(conn, sUser) > 0) {
			JDBCTemplate.commit(conn);
			return true; //업뎃 성공
		} else {
			JDBCTemplate.rollback(conn);
			return false; //실패
		}
		
	}
	
	
	//---------------------------------------회원가입-----------------------------------------------------

	@Override
	public Semi_User getJoinMember(HttpServletRequest req) {
		
		//한글 인코딩
		try {
			req.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Semi_User sUser = new Semi_User();
		
		sUser.setUser_name(req.getParameter("username"));
		sUser.setUser_email(req.getParameter("useremail"));
		sUser.setUser_phone(req.getParameter("userphone"));
		sUser.setUser_pw(req.getParameter("userpw"));
		
		return sUser;
	}
	
	
	@Override
	public int existsEmail(Semi_User sUser) {
		if(sUserDao.selectCntByUserEmail(JDBCTemplate.getConnection(), sUser) > 0) {
			return 1;
		} else {
		return 0;
		}
	}
	
	@Override
	public void join(Semi_User sUser) {
		
		//db연결
		Connection conn = JDBCTemplate.getConnection();
		
		//인서트 잘 됐으면 커밋 아니면 롤백
		if(sUserDao.insert(conn, sUser) > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
	}
	
	
	
}











