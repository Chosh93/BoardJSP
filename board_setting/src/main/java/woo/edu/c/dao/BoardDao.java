package woo.edu.c.dao;

import java.util.List;

import woo.edu.c.vo.BoardVo;

public interface BoardDao {

	// 게시판 목록
	List<BoardVo> board() throws Exception;
	
	// 게시판 작성
	void write(BoardVo vo) throws Exception;
	
	// 게시판 상세
	BoardVo detail (int bnum);
	
	// 게시판 삭제
	void delete (int bnum);
	
	// 게시판 수정
	void update (BoardVo vo);
}
