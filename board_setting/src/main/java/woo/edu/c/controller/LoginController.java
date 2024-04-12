package woo.edu.c.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import woo.edu.c.service.LoginService;
import woo.edu.c.vo.LoginVo;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private LoginService loginService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String moveLogin() {
		logger.info("/login 진입");
		return "/login/login";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String moveJoin() {
		logger.info("/join 진입");
		return "/login/join";
	}
	
	@RequestMapping(value = "/ajax/login", method = RequestMethod.POST)
	@ResponseBody
	public boolean ajaxLogin(String memberId, String memberPw) throws Exception {
		logger.info("ajax login 진행");
		return loginService.login(memberId, memberPw);
	}
}
