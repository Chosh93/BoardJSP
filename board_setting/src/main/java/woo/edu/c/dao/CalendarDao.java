package woo.edu.c.dao;

import java.util.List;

import woo.edu.c.vo.CalendarVo;

public interface CalendarDao {
	
	List<CalendarVo> scheduleList(String year, String month) throws Exception;
}