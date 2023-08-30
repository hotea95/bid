package aaa.aaa.aaa.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import aaa.aaa.aaa.board.dto.BoardDTO;
import aaa.aaa.aaa.board.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	//게시판작성
	@RequestMapping(value = "/BoardInsert", method = RequestMethod.GET)
	public String boardinsert() {
		return "./board/board_insert";
	}
	@RequestMapping(value = "/BoardInsert", method = RequestMethod.POST)
	public String boardinsert(BoardDTO boardDTO) {
		boardService.BoardInsert(boardDTO);
		return "./board/board_insert_view";
	}
	
	//게시판 전체조회
	@RequestMapping(value = "/BoardSelectall", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list",boardService.boardselectall());
		
		return "./board/board_selectall";
	}
	
	//일반 회원 게시판 전체조회
	@RequestMapping(value = "/BoardSelectall1", method = RequestMethod.GET)
	public String list2(Model model) {
		model.addAttribute("list",boardService.boardselectall());
		return "./board/board_selectall1";
	}
	
	//게시판 상세보기
	@RequestMapping(value = "/BoardSelect", method = RequestMethod.GET)
	public String boardselect(@RequestParam("BNO") String BNO, Model model,BoardDTO boardDTO) {
		model.addAttribute("list",boardService.boardselect(BNO));
		System.out.println("컨트롤러 게시판 상세보기 값" + BNO);
		return "./board/board_select";
	
	}
}
