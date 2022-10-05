package service.impl;

import javax.servlet.http.HttpServletRequest;

import dao.face.Semi_UserDao;
import dao.impl.semi_UserDaoImpl;
import dto.semi_User;
import service.face.semi_UserService;

public class semi_UserServiceImpl implements semi_UserService {
	
	//Dao객체
	private Semi_UserDao sUserDao = new semi_UserDaoImpl();

	@Override
	public semi_User getLoginUser(HttpServletRequest req) {
		
		semi_User sUser = new semi_User();
		
		sUser.setUser_email(req.getParameter("useremail"));
		sUser.setUser_pw(req.getParameter("userpw"));
		
		return sUser;
	}


	
}











