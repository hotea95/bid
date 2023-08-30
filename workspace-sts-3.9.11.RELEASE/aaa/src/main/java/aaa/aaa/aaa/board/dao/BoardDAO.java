package aaa.aaa.aaa.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import aaa.aaa.aaa.board.dto.BoardDTO;



@Repository
public class BoardDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//게시판 작성
	public void BoardInsert(BoardDTO boardDTO) {
		sqlSessionTemplate.insert("boardinsert",boardDTO);
	}
	
	//게시판 전체조회
	public List<BoardDTO> boardselectall() {
		return sqlSessionTemplate.selectList("boardselectall");
	}
	
	//게시판 상세보기
	public BoardDTO boardselect(String BNO) {
		return sqlSessionTemplate.selectOne("boardselect",BNO);
	}
}
