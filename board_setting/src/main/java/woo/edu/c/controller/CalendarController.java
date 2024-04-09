package woo.edu.c.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import woo.edu.c.service.CalendarService;
import woo.edu.c.vo.CalendarVo;

@Controller
public class CalendarController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private CalendarService calendarService;
	
    // 캘린더 페이지 이동
    @RequestMapping(value = "/calendar", method = RequestMethod.GET)
    public String moveCalendar() throws Exception {
	    logger.info("/calendar 페이지 이동");
 	    return "calendar";
    }
    
	// 전체 스케쥴 가져오기
	@RequestMapping(value = "/getAllSchedule", method = RequestMethod.POST)
	@ResponseBody
	public List<CalendarVo> getAllSchedule(String year, String month) throws Exception{
		logger.info("/getAllSchedule 진입");
		List<CalendarVo> allscheduleList = calendarService.allSchedule(year, month);
		return allscheduleList;
	}
	
	// 해당 날짜 스케줄 가져오기
	@RequestMapping(value = "/getSchedule", method = RequestMethod.POST)
	@ResponseBody
	public List<CalendarVo> getSchedule(String year, String month, String day) throws Exception{
		logger.info("/getSchedule 진입");
		List<CalendarVo> scheduleList = calendarService.schedule(year, month, day);
		System.out.println(scheduleList);
		return scheduleList;
	}
	
	// 스케줄 작성
	@RequestMapping(value = "/calendar/write", method = RequestMethod.POST)
	@ResponseBody
	public List<CalendarVo> writeSchedule(@RequestBody CalendarVo vo) throws Exception {
		logger.info("스케줄 작성 ajax");
		calendarService.writeSchedule(vo);
		List<CalendarVo> scheduleList = calendarService.allSchedule(vo.getCalyear(), vo.getCalmonth());
		return scheduleList;
	}
	
	// 스케줄 삭제
	@RequestMapping(value = "calendar/delete", method = RequestMethod.POST)
	@ResponseBody
	public List<CalendarVo> deleteSchedule(@RequestBody CalendarVo vo) throws Exception{
		logger.info("스케줄 삭제 ajax");
		calendarService.deleteSchedule(vo.getCalno());
		List<CalendarVo> scheduleList = calendarService.allSchedule(vo.getCalyear(), vo.getCalmonth());
		return scheduleList;
	}
}
