package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.face.Semi_UserDao;
import dao.impl.Semi_UserDaoImpl;
import dto.Semi_User;
import service.face.Semi_UserService;
import service.impl.Semi_UserServiceImpl;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	private Semi_UserService sUserService = new Semi_UserServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//전달파라미터로 로그인 정보 얻기
		Semi_User sUser = sUserService.getLoginUser(req);
		
		//로그인 인증
		boolean login = sUserService.login(sUser);
		
		if(login) {
			
			//로그인 사용자 정보 얻어오기
			sUser = sUserService.info(sUser);
			
			//세션정보 저장
			HttpSession session = req.getSession();
			
			session.setAttribute("login", login);
			session.setAttribute("username", sUser.getUser_name());
			session.setAttribute("userpw", sUser.getUser_pw());
			session.setAttribute("user_email", sUser.getUser_email());
			session.setAttribute("user_no", sUser.getUser_no());
			
		}
		System.out.println("로그인 한 이메일 : " + sUser.getUser_email());
		
		resp.sendRedirect("/Semi/main");
		
	}

}






