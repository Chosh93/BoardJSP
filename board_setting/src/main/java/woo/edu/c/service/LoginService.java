package woo.edu.c.service;

public interface LoginService {
	
	// 로그인
	boolean login(String memberId, String memberPw) throws Exception;
	
	// 아이디 체크
	int idCheck(String memberId) throws Exception;

}
