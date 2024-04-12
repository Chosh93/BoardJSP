package woo.edu.c.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import woo.edu.c.controller.HomeController;

@Repository
public class LoginDaoImpl implements LoginDao {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "loginMapper";
	
	// 로그인
	@Override
	public boolean login(String memberId, String memberPw) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("memberId", memberId);
		params.put("memberPw", memberPw);
		return !sql.selectList(namespace + ".login", params).isEmpty();
	}
	
	// 아이디 찾기
	@Override
	public int idCheck(String memberId) {
		System.out.println("dao : " + memberId);
		int count = sql.selectOne(namespace + ".idCheck", memberId);
		System.out.println(count);
		return count;
	}
}
