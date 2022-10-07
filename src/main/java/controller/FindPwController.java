package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Semi_User;
import service.face.Semi_UserService;
import service.impl.Semi_UserServiceImpl;

@WebServlet("/findPw")
public class FindPwController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//서비스 객체
	private Semi_UserService sUserService = new Semi_UserServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/findPw.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("##################");
		
		//전달파라미터로 이메일/휴대폰번호 얻기
		Semi_User sUser = sUserService.getEmailPhone(req);
		System.out.println(sUser);
		
		//로그인 인증
		boolean exists = sUserService.exists(sUser);
		System.out.println(exists);
		
		if(exists) {
			
			sUser = sUserService.findPw(sUser);
			
			//세션정보 저장
			HttpSession session = req.getSession();
			
			session.setAttribute("exists", exists);
			session.setAttribute("username", sUser.getUser_name());
			session.setAttribute("userpw", sUser.getUser_pw());
		}
		
		
		
		
		
		resp.sendRedirect("/findPw/result");
		
	}

}
