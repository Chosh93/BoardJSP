package woo.edu.c.service;

import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import woo.edu.c.controller.HomeController;
import woo.edu.c.dao.BoardDao;
import woo.edu.c.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private BoardDao boardDao;

	// 게시물 목록
	@Override
	public List<BoardVo> board() throws Exception {
        try {
            return boardDao.board();
        } catch (Exception e) {
            logger.error("Error occurred while fetching board data", e);
            return Collections.emptyList(); 
        }
    }

	// 게시물 작성
	@Override
	public void write(BoardVo vo) throws Exception {
		boardDao.write(vo);
		
	}

	// 게시물 상세정보
	@Override
	public BoardVo detail(int bnum) {
		return boardDao.detail(bnum);
	}

	// 게시물 삭제
	@Override
	public void delete(int bnum) throws Exception {
		boardDao.delete(bnum);
		
	}

	// 게시물 수정
	@Override
	public void update(BoardVo vo) throws Exception {
		boardDao.update(vo);
	}
	
}
