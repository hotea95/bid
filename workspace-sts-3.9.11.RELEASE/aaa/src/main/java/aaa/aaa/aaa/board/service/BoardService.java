package aaa.aaa.aaa.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import aaa.aaa.aaa.board.dao.BoardDAO;
import aaa.aaa.aaa.board.dto.BoardDTO;

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
}
