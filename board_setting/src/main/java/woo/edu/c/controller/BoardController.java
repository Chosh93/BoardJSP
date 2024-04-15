package woo.edu.c.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import woo.edu.c.service.BoardService;
import woo.edu.c.vo.BoardVo;

@Controller
public class BoardController {
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   @Inject
   private BoardService boardService;
   
   
   // 硫붿씤  솕硫 
   @RequestMapping(value = "/")
   public String home(Model model, HttpServletRequest req, HttpServletResponse res) throws Exception {
      logger.info("/board/home");
      return "home";
   }
   
   // 게시판홈
   @RequestMapping(value = "/board", method = RequestMethod.GET)
   public String boardList(Model model) throws Exception {
      logger.info("/board");
      List<BoardVo> test = boardService.board();
      model.addAttribute("boardList", test);
      return "/board/list";
   }
   
   // 게시판 작성 페이지 이동
   @RequestMapping(value = "/board/write", method = RequestMethod.GET)
   public void movewriteBoard() {
      logger.info("작성페이지로 이동");
   }
   
   // 게시판 작성
   @RequestMapping(value = "/board/write", method = RequestMethod.POST)
   public String writeBoard(BoardVo vo) throws Exception {
      logger.info("/board/write");
      boardService.write(vo);
      return "redirect:/board";
   }
   
   // 게시판 수정 페이지로 이동
   @RequestMapping(value = "/board/update", method = RequestMethod.GET)
   public String moveupdateBoard(Model model, int bnum) throws Exception {
      BoardVo data = boardService.detail(bnum);
      model.addAttribute("data", data);
      logger.info("/board/update");
      return "/board/update";
   }
   
   // 게시판 수정
   @RequestMapping(value = "/board/update", method = RequestMethod.POST)
   public String updateBoard(BoardVo vo) throws Exception {
      boardService.update(vo);
      return "redirect:/board";
   }
   
   // 게시물 상세페이지
   @RequestMapping(value = "/board/detail", method = RequestMethod.GET)
   public String movedetailBoard(Model model, int bnum) {
      logger.info("/board/detail");
      BoardVo data = boardService.detail(bnum);
      model.addAttribute("data", data);
      return "/board/detail";
   }
   
   // 게시판 삭제
   @RequestMapping(value = "/board/delete", method = RequestMethod.GET)
   public String boardDelete(int bnum) throws Exception{
      logger.info("/board/delete");
      boardService.delete(bnum);
      return "redirect:/board";
   }
   

   // 게시판 Ajax 이동
   @RequestMapping(value = "/board/ajaxList", method = RequestMethod.GET)
   public void moveAjaxList() throws Exception{
      logger.info("/board/ajaxList");
      logger.info("게시판 Ajax 목록 이동");
   }

   
   // ajax List 가져오기
   @RequestMapping(value = "/ajax/list", method = RequestMethod.GET)
   @ResponseBody
   public List<BoardVo> ajaxList() throws Exception {
      logger.info("ajax List 실행");
      List<BoardVo> list = boardService.board();
      return list;
   }
    
   // ajax 삭제
   @RequestMapping(value = "/ajax/delete", method = RequestMethod.POST)
   @ResponseBody
   public List<BoardVo> ajaxDelete(@RequestParam(name = "bnum") int bnum) throws Exception {
      logger.info("ajax 삭제 진행");
      boardService.delete(bnum);
      List<BoardVo> list = boardService.board();
      return list;
   }
   
   // ajax 글쓰기 
   @RequestMapping(value = "/ajax/write", method = RequestMethod.POST)
   @ResponseBody
   public List<BoardVo> ajaxWrite(@RequestBody BoardVo vo) throws Exception {
        logger.info("ajax 글쓰기 진행");
        boardService.write(vo);
        List<BoardVo> list = boardService.board();
        return list;
    }
   
   // ajax 상세정보
   @RequestMapping(value = "/ajax/detail", method = RequestMethod.GET)
   @ResponseBody
   public BoardVo ajaxDetail(@RequestParam("bnum") int bnum) throws Exception {
      logger.info("ajax 상세정보 진행");
      BoardVo boardVo = boardService.detail(bnum);
      return boardVo;
   }
   
   // 계산기 페이지 이동
   @RequestMapping(value = "/test/gugudan", method = RequestMethod.GET)
   public void moveGugudan() throws Exception {
	   logger.info("/test/calc 페이지 이동");
   }
   
   // 색상 변경 페이지 이동
   @RequestMapping(value = "/test/color", method = RequestMethod.GET)
   public void moveColor() throws Exception {
	   logger.info("/test/color 페이지 이동");
   }
   
   // 시퀀스 페이지 이동
   @RequestMapping(value = "/test/sequence", method = RequestMethod.GET)
   public void moveSequence() throws Exception {
	   logger.info("/test/sequence 페이지 이동");
   }
   
   // 선택삭제
   @RequestMapping(value = "/ajax/selectDel", method = RequestMethod.POST)
   @ResponseBody
   public List<BoardVo> ajaxSeletDel(@RequestBody List<String> bnumList) throws Exception {
	   System.out.println(bnumList);
	   logger.info("/ajax/selectDel 진행");
	   List<Integer> bnumArr = new ArrayList<Integer>();
	   for(String bnum : bnumList) {
		   bnumArr.add(Integer.parseInt(bnum));
	   }
	   for(int bnum : bnumArr) {
		   boardService.delete(bnum);
	   }
	   System.out.println(bnumArr);
	   List<BoardVo> list = boardService.board();
	   return list;
   }
   
   // 계산기페이지 이동
   @RequestMapping(value = "/calc", method = RequestMethod.GET)
   public void moveCalc() throws Exception {
	   logger.info("/calc 페이지 이동");
   }
   
   // 게시판  검색 페이지
   @RequestMapping(value = "/board/search", method = RequestMethod.GET)
   public void moveBoardSearch() throws Exception {
	   logger.info("/board/search 페이지 이동");
   }
   
   @RequestMapping(value = "/ajax/listCnt", method = RequestMethod.GET)
   @ResponseBody
   public int listCnt() throws Exception {
	   logger.info("/ajax/listCnt 진입");
	   return boardService.listCnt();
   }
   
   @RequestMapping(value = "/ajax/search", method = RequestMethod.POST)
   @ResponseBody
   public List<BoardVo> searchList(@RequestParam("searchData") String searchData) throws Exception {
	   logger.info("/ajax/search 진입");
	   System.out.println(searchData);
	   List<BoardVo> list = boardService.search(searchData);
	   return list;
   }
}



