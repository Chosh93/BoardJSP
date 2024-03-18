package woo.edu.c.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import woo.edu.c.controller.HomeController;
import woo.edu.c.vo.BoardVo;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	// mybatis
	@Inject
	private SqlSession sql;
	
	private static String namespace = "boardMapper";
	
	// 게시판 목록
	@Override
	public List<BoardVo> board() {
		return sql.selectList(namespace + ".board");
	}
	
	// 게시판 작성
	@Override
	public void write(BoardVo vo) throws Exception {
		sql.insert(namespace + ".write", vo);
		
	}

	// 게시판 상세정보
	@Override
	public BoardVo detail(int bnum) {
		return sql.selectOne(namespace + ".detail", bnum);
	}

	//게시판 삭제
	@Override
	public void delete(int bnum) {
		sql.delete(namespace + ".delete", bnum);
	}

	@Override
	public void update(BoardVo vo) {
		sql.update(namespace + ".update", vo);
	}
}
