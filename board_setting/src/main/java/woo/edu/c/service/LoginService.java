package woo.edu.c.service;

import woo.edu.c.vo.LoginVo;

public interface LoginService {
	
	// 로그인
	boolean login(String memberId, String memberPw) throws Exception;
	
	// 아이디 체크
	int idCheck(String memberId) throws Exception;
	
	// 회원가입
	void join(LoginVo vo) throws Exception;

}
