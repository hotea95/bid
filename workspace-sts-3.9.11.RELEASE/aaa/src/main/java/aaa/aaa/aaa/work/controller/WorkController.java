package aaa.aaa.aaa.work.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import aaa.aaa.aaa.work.dto.WorkDTO;
import aaa.aaa.aaa.work.service.WorkService;

@Controller
public class WorkController {

	@Autowired
	private WorkService workService;
	
	//전체보기
	@RequestMapping(value = "/WorkSelectAll", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list",workService.workselectAll());
		return "./work/work_select_all_view";
	}
	
	//상세보기
	@RequestMapping(value = "/WorkSelect", method = RequestMethod.GET)
	public String workselectdetail(Model model, WorkDTO workDTO) {
		model.addAttribute("workDTO",workService.workselect(workDTO));
		return "./work/work_select_view";
	}
	
	//수정하기
	@RequestMapping(value = "/WorkUpdate", method = RequestMethod.GET)
	public String workupdate(Model model, WorkDTO workDTO) {
		model.addAttribute("workDTO",workService.workselect(workDTO));
		return "./work/work_update";
	}
	@RequestMapping(value = "/WorkUpdate", method = RequestMethod.POST)
	public String workupdate(WorkDTO workDTO) {
		workService.workupdate(workDTO);
		return "./work/work_update_view";
	}
	
	//작성하기
	@RequestMapping(value = "/WorkInsert", method = RequestMethod.GET)
	public String workinsert() {
		return "./work/work_insert";
	}
	@RequestMapping(value = "/WorkInsert", method = RequestMethod.POST)
	public String workinsert(WorkDTO workDTO, Model model) {
		workService.workinsert(workDTO);
		model.addAttribute("MemberInfo", workService.workselect(workDTO));
		return "./work/work_insert_view";
	}
}
