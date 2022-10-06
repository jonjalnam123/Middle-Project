package service.face;

import javax.servlet.http.HttpServletRequest;

import dto.Semi_User;

public interface Semi_UserService {
	
	/**
	 * 로그인 정보 추출
	 * 
	 * @param req
	 * @return
	 */
	public Semi_User getLoginUser(HttpServletRequest req);
	

}
