package woo.edu.c.service;

import java.util.List;

import woo.edu.c.vo.CalendarVo;

public interface CalendarService {
	
	// 전체 스케쥴 목록
	List<CalendarVo> allSchedule(String year, String month) throws Exception;
	
	// 해당 날 스케쥴 목록
	List<CalendarVo> schedule(String year, String month, String day) throws Exception;
	
	// 스케줄 작성
	void writeSchedule(CalendarVo vo) throws Exception;
	
	// 스케줄 삭제
	
	void deleteSchedule(int calno) throws Exception;
}
