package aaa.aaa.aaa.career.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import aaa.aaa.aaa.career.dto.CareerDTO;
import aaa.aaa.aaa.career.service.CareerService;
import aaa.aaa.aaa.project.service.ProjectService;
import aaa.aaa.aaa.work.service.WorkService;

@Controller
public class CareerController {

	@Autowired
	private CareerService careerService;
	@Autowired
	private WorkService workService;
	
	//전체조회
	@RequestMapping(value = "/CareerSelectAll", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list",careerService.careerselectAll());
		return "./career/career_select_all_view";
	}
	
	 //상세조회
	@RequestMapping(value = "/CareerSelect", method = RequestMethod.GET)
	public String careerselectdetail(Model model, CareerDTO careerDTO) {
	  model.addAttribute("careerDTO",careerService.careerselect(careerDTO)); 
	  return "./career/career_select_view"; } 
	
	//수정하기
	  @RequestMapping(value = "/CareerUpdate", method = RequestMethod.GET) 
	  public String careerupdate(Model model, CareerDTO careerDTO) {
	  model.addAttribute("careerDTO",careerService.careerselect(careerDTO));
	  return "./career/career_update";
	  }
	  
	  @RequestMapping(value = "/CareerUpdate", method = RequestMethod.POST) 
	  public String careerupdate(CareerDTO careerDTO, Model model) {
	  careerService.careerupdate(careerDTO);
	  model.addAttribute("update",careerService.careerselect(careerDTO));
	  model.addAttribute("workDTO",workService.workselect2(careerDTO));
	  return "./work/work_update";
	  }
	  
	  //작성하기
	  @RequestMapping(value = "/CareerInsert", method = RequestMethod.GET)
	  public String careerinsert() {
		  return "./career/career_insert";
	  }
	  @RequestMapping(value = "/CareerInsert", method = RequestMethod.POST)
	  public String careerinsert(Model model, CareerDTO careerDTO) {
		  careerService.careerinsert(careerDTO);
		  model.addAttribute("MemberInfo", careerService.careerselect(careerDTO));
		  return "./work/work_insert";
	  }
	 
}
