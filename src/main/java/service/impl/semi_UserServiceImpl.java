package service.impl;

import javax.servlet.http.HttpServletRequest;

import dao.face.Semi_UserDao;
import dao.impl.Semi_UserDaoImpl;
import dto.Semi_User;
import service.face.semi_UserService;

public class semi_UserServiceImpl implements semi_UserService {
	
	//Dao객체
	private Semi_UserDao sUserDao = new Semi_UserDaoImpl();

	@Override
	public Semi_User getLoginUser(HttpServletRequest req) {
		
		Semi_User sUser = new Semi_User();
		
		sUser.setUser_email(req.getParameter("useremail"));
		sUser.setUser_pw(req.getParameter("userpw"));
		
		return sUser;
	}


	
}











