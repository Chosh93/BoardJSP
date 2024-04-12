package woo.edu.c.dao;

public interface LoginDao {

	// 로그인
	boolean login(String memberId, String memberPw) throws Exception;
	
	// 아이디 체크
	int idCheck(String memberId) throws Exception;
}
