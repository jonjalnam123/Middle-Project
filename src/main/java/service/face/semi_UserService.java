package service.face;

import javax.servlet.http.HttpServletRequest;

import dto.semi_User;

public interface semi_UserService {
	
	/**
	 * 로그인 정보 추출
	 * 
	 * @param req
	 * @return
	 */
	public semi_User getLoginUser(HttpServletRequest req);
	

}
