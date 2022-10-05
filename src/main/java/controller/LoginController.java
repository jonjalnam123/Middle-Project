package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.face.Semi_UserDao;
import dao.impl.semi_UserDaoImpl;
import dto.Semi_User;
import service.face.semi_UserService;
import service.impl.semi_UserServiceImpl;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	private semi_UserService sUserService = new semi_UserServiceImpl();
	private Semi_UserDao sUserDao = new semi_UserDaoImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//전달파라미터 로그인 정보 얻어오기
		Semi_User sUser = sUserService.getLoginUser(req);
		
		int res = sUserDao.selectCntByUserEmailPw(sUser);
		
		
	}

}






