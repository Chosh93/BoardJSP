package woo.edu.c.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import woo.edu.c.controller.HomeController;
import woo.edu.c.dao.LoginDao;
import woo.edu.c.vo.LoginVo;

@Service
public class LoginServiceImpl implements LoginService{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private LoginDao loginDao;
	
	@Override
	public boolean login(String memberId, String memberPw) throws Exception {
		return loginDao.login(memberId, memberPw);
	}
	
	@Override
	public int idCheck(String memberId) throws Exception {
		return loginDao.idCheck(memberId);
	}
	
	@Override
	public void join(LoginVo vo) throws Exception {
		loginDao.join(vo);
	}
}
