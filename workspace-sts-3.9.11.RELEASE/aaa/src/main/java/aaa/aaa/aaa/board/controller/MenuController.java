package aaa.aaa.aaa.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import aaa.aaa.aaa.board.dto.MenuDTO;
import aaa.aaa.aaa.board.service.MenuService;

@Controller
public class MenuController {

	@Autowired
	MenuService menuService;
	
	
	@ResponseBody
	@RequestMapping(value = "/menu", method = RequestMethod.GET)
	public List<MenuDTO> getMenuInfoByAuthno(@RequestParam String authno){
		List<MenuDTO> menu= menuService.menu(authno);
		return menu;
	}
}
