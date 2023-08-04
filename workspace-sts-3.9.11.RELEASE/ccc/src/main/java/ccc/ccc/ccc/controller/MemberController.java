package ccc.ccc.ccc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ccc.ccc.ccc.dto.Criteria;
import ccc.ccc.ccc.dto.MemberDTO;
import ccc.ccc.ccc.dto.PageMaker;
import ccc.ccc.ccc.dto.SearchCriteria;
import ccc.ccc.ccc.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	//전체조회
	@RequestMapping(value = "/Selectall", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list",memberService.selectall());
		return "./ccc/ccc_select_all_view";
	}
	
	//작성
	@RequestMapping(value = "/Insert", method = RequestMethod.GET)
	public String insert() {
		return "./ccc/ccc_insert";
	}
	@RequestMapping(value = "/Insert", method = RequestMethod.POST)
	public String insert(Model model, MemberDTO memberDTO) {
		model.addAttribute("list",memberService.selectall());
		memberService.insert(memberDTO);
		return "./ccc/ccc_insert_view";
	}
	
	// 글 목록 + 페이징
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
	   
	   List<MemberDTO> list = memberService.listPage(cri);
	   model.addAttribute("list", list);
	   
	   PageMaker pageMaker = new PageMaker();
	   pageMaker.setCri(cri);
	   pageMaker.setTotalCount(memberService.listCount());
	   model.addAttribute("pageMaker", pageMaker);
	   
	   return "./ccc/ccc_listPage";
	}
	
	// 글 목록 + 페이징 + 검색
	@RequestMapping(value = "/listSearch", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
	   
	   List<MemberDTO> list = memberService.listSearch(scri);
	   model.addAttribute("list", list);
	   
	   PageMaker pageMaker = new PageMaker();
	   pageMaker.setCri(scri);
	   //pageMaker.setTotalCount(service.listCount());
	   pageMaker.setTotalCount(memberService.countSearch(scri));
	   model.addAttribute("pageMaker", pageMaker);
	   
	   return "./ccc/ccc_listSearch";
	}
}
