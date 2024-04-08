package woo.edu.c.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	// 스케쥴 가져오기
	@RequestMapping(value = "/getSchedule", method = RequestMethod.POST)
	public String getSchedule(Model model, String year, String month) throws Exception{
		logger.info("/getSchedule 진입");
		List<CalendarVo> test = calendarService.schedule(year, month);
		System.out.println(test);
		model.addAttribute("scheduleList", test);
		return "calendar";
	}
}
