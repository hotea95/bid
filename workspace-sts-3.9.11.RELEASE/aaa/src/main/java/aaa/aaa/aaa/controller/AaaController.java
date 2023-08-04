package aaa.aaa.aaa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import aaa.aaa.aaa.service.AaaService;

@Controller
public class AaaController {

	@Autowired
	private AaaService aaaService;
	
	@RequestMapping(value = "/AaaSelect", method = RequestMethod.GET)
	public String list(Model model) {
	model.addAttribute("list", aaaService.aaaSelectAll( ));
	return "./aaa/aaa_select_all_view";
}
}
