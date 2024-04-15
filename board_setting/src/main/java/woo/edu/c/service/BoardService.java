package woo.edu.c.service;

import java.util.List;

import woo.edu.c.vo.BoardVo;

public interface BoardService {
	
	// 게시물 목록
	List<BoardVo> board() throws Exception;

	// 게시물 작성
	void write(BoardVo vo) throws Exception;
	
	// 게시물 상세정보
	BoardVo detail(int bnum);
	
	// 게시물 삭제
	void delete(int bnum) throws Exception;
	
	// 게시물 수정
	void update(BoardVo vo) throws Exception;
	
	// 게시물 카운트
	int listCnt() throws Exception;
	
	// 게시글 검색
	List<BoardVo> search(String searchData) throws Exception;
	
	// 게시물 페이징
	List<BoardVo> listPage(int displayPost, int postNum) throws Exception;
}
