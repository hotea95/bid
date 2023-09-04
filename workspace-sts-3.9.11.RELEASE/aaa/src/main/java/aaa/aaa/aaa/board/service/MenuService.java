package aaa.aaa.aaa.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import aaa.aaa.aaa.board.dao.MenuDAO;
import aaa.aaa.aaa.board.dto.MenuDTO;

@Service
public class MenuService {

	@Autowired
	MenuDAO menuDAO;
	
	public  List<MenuDTO> menu(String authno) {
		return menuDAO.menu(authno);
	}
}
