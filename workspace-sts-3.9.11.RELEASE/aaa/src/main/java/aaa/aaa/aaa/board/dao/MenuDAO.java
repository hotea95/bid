package aaa.aaa.aaa.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import aaa.aaa.aaa.board.dto.MenuDTO;

@Repository
public class MenuDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<MenuDTO> menu(String authno) {
		return sqlSessionTemplate.selectList("menu",authno);
	}
}
