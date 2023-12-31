package aaa.aaa.aaa.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import aaa.aaa.aaa.board.dao.BoardDAO;
import aaa.aaa.aaa.board.dto.BoardDTO;
import aaa.aaa.aaa.member.dto.MemberDTO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	//게시판작성
	public void BoardInsert(BoardDTO boardDTO) {
		try {
			boardDAO.BoardInsert(boardDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}
	
	//게시판 전체조회
	public List<BoardDTO> boardselectall() {
		return boardDAO.boardselectall();
	}
	
	//게시판 상세조회
	public BoardDTO boardselect(String BNO) {
		return boardDAO.boardselect(BNO);
	}
	
	//게시판 삭제하기
	public void boarddelete(List<String> BNO) {
	    boardDAO.boarddelete(BNO);
	}
	
	//게시판 수정하기
	public void boardupdate(BoardDTO boardDTO) { 
	 boardDAO.boardupdate(boardDTO); 
	 }
}
