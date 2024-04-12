package woo.edu.c.dao;

public interface LoginDao {

	// 로그인
	boolean login(String memberId, String memberPw) throws Exception;
}
