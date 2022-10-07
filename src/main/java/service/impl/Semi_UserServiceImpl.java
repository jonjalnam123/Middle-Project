package service.impl;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;

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
	
	
	//--------------------------------------------------------------------------------------------

	
	@Override
	public Semi_User getEmailPhone(HttpServletRequest req) {
		
		Semi_User sUser = new Semi_User();
		
		sUser.setUser_email(req.getParameter("findPwEmail"));
		sUser.setUser_phone(req.getParameter("findPwPhone"));
		
		return sUser;
	}
	
	
	@Override
	public boolean exists(Semi_User sUser) {
		if(sUserDao.selectCntByEmailPhone(JDBCTemplate.getConnection(), sUser) > 0) {
			return true;
		} else {
		return false;
		}
	}
	
	
	@Override
	public Semi_User findPw(Semi_User sUser) {
		return sUserDao.selectUserByUseremail(JDBCTemplate.getConnection(), sUser);
	}

	//--------------------------------------------------------------------------------------------

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











