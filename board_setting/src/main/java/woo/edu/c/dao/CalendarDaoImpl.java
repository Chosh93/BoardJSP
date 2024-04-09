package woo.edu.c.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import woo.edu.c.controller.HomeController;
import woo.edu.c.vo.CalendarVo;

@Repository
public class CalendarDaoImpl implements CalendarDao {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	//mybatis
	@Inject
	private SqlSession sql;
	
	private static String namespace = "calendarMapper";
	
	// 스케쥴 목록
	@Override
	public List<CalendarVo> allScheduleList(String year, String month) {
	    Map<String, String> params = new HashMap<String, String>();
	    params.put("year", year);
	    params.put("month", month);
	    return sql.selectList(namespace + ".scheduleAll", params);
	}
	
	@Override
	public List<CalendarVo> scheduleList(String year, String month, String day){
		Map<String, String> params = new HashMap<String, String>();
	    params.put("year", year);
	    params.put("month", month);
	    params.put("day", day);
	    return sql.selectList(namespace + ".schedule", params);
	}
	
	@Override
	public void writeSchedule(CalendarVo vo) throws Exception {
		sql.insert(namespace + ".write", vo);
	}
	
	@Override
	public void deleteSchedule(int calno) {
		sql.delete(namespace + ".delete", calno);
	}
}
