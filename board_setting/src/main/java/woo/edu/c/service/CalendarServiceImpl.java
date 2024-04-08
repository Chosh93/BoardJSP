package woo.edu.c.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import woo.edu.c.controller.HomeController;
import woo.edu.c.dao.CalendarDao;
import woo.edu.c.vo.CalendarVo;

@Service
public class CalendarServiceImpl implements CalendarService{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private CalendarDao calendarDao;
	
	// 스케쥴 목록
	@Override
	public List<CalendarVo> schedule(String year, String month) throws Exception {
		return calendarDao.scheduleList(year, month);
	}
}
