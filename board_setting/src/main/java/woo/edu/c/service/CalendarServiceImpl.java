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
	
	// 전체 스케쥴 목록
	@Override
	public List<CalendarVo> allSchedule(String year, String month) throws Exception {
		return calendarDao.allScheduleList(year, month);
	}
	
	// 해당 날 스케줄 목록
	@Override
	public List<CalendarVo> schedule(String year, String month, String day) throws Exception {
		return calendarDao.scheduleList(year, month, day);
	}
	
	// 스케줄 작성
	@Override
	public void writeSchedule(CalendarVo vo) throws Exception {
		calendarDao.writeSchedule(vo);
	}
	
	// 스케줄 삭제
	@Override
	public void deleteSchedule(int calno) throws Exception {
		calendarDao.deleteSchedule(calno);
	}
}
