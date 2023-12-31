package aaa.aaa.aaa.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import aaa.aaa.aaa.board.dto.BoardDTO;
import aaa.aaa.aaa.board.service.BoardService;
import aaa.aaa.aaa.reply.dto.ReplyDTO;
import aaa.aaa.aaa.reply.service.ReplyService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyService replyservice;
	
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
	public String boardselect(@RequestParam("BNO") String BNO, Model model,BoardDTO boardDTO, ReplyDTO replyDTO) {
		
		model.addAttribute("list",boardService.boardselect(BNO));
		//model.addAttribute("relist",replyservice.replyselect(replyDTO, BNO));
		model.addAttribute("relist",replyservice.replyselectall(BNO));
		return "./board/board_select";
	
	}
	
	//게시판 삭제하기
	@RequestMapping(value = "/BoardDelete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> boarddelete(@RequestBody List<String> BNOList) {
	    boardService.boarddelete(BNOList);
	    Map<String, Object> resultMap = new HashMap<String, Object>();
	    resultMap.put("result", "success");
	    return resultMap;
	}
	
	//게시판 수정하기
	@RequestMapping(value = "/BoardUpdate", method = RequestMethod.GET)
	public String boardupdate(BoardDTO boardDTO, Model model,String BNO) {
		model.addAttribute("list",boardService.boardselect(BNO));
		return "./board/board_update";
	}
	
	@RequestMapping(value = "/BoardUpdate", method = RequestMethod.POST)
	public String boardupdate(BoardDTO boardDTO, Model model) {
		boardService.boardupdate(boardDTO);
		return "./board/board_update_view";
	}
}
