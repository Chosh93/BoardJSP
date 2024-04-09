package woo.edu.c.dao;

import java.util.List;

import woo.edu.c.vo.CalendarVo;

public interface CalendarDao {
	
	// 스케줄 전체 리스트
	List<CalendarVo> allScheduleList(String year, String month) throws Exception;
	
	
	// 스케줄 날짜별 리스트
	List<CalendarVo> scheduleList(String year, String month, String day) throws Exception;
	
	// 스케줄 작성
	void writeSchedule(CalendarVo vo) throws Exception;
}
