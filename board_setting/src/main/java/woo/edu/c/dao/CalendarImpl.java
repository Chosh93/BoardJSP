package woo.edu.c.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import woo.edu.c.controller.HomeController;
import woo.edu.c.vo.CalendarVo;

@Repository
public class CalendarImpl implements CalendarDao {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	//mybatis
	@Inject
	private SqlSession sql;
	
	private static String namespace = "calendarMapper";
	
	// 스케쥴 목록
	@Override
	public List<CalendarVo> scheduleList(String year, String month) {
		return sql.selectList(namespace + ".calendar");
	}
}
