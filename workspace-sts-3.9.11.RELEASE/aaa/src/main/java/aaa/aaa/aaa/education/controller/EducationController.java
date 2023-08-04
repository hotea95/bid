package aaa.aaa.aaa.education.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import aaa.aaa.aaa.certificate.service.CertificateService;
import aaa.aaa.aaa.education.dto.EducationDTO;
import aaa.aaa.aaa.education.service.EducationService;
import aaa.aaa.aaa.member.dto.MemberDTO;
import aaa.aaa.aaa.member.service.MemberService;

@Controller
public class EducationController {

	@Autowired
	private EducationService educationService;
	@Autowired
	private MemberService memberservice;
	@Autowired
	private CertificateService certificateservice;
	
	//전체조회
	@RequestMapping(value = "/EducationSelectAll", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list",educationService.educationselectAll());
		return "./education/education_select_all_view";
	}
	
	//상세조회
	@RequestMapping(value = "/EducationSelect", method = RequestMethod.GET)
	public String educationselectdetail(Model model, EducationDTO educationDTO) {
		model.addAttribute("educationDTO",educationService.educationselect(educationDTO));
		return "./education/education_select_view";
	}
	
	//수정하기
	@RequestMapping(value = "/EducationUpdate", method = RequestMethod.GET)
	public String educationupdate(Model model, EducationDTO educationDTO, MemberDTO memberDTO) {		
		model.addAttribute("educationDTO",educationService.educationselect(educationDTO));
		return "./education/education_update";
	}
	@RequestMapping(value = "/EducationUpdate", method = RequestMethod.POST)
	public String educationupdate(EducationDTO educationDTO, Model model) {
		educationService.educationupdate(educationDTO);
		model.addAttribute("update",educationService.educationselect(educationDTO));
		model.addAttribute("certificateDTO",certificateservice.certificateSelect2(educationDTO));
		return "./certificate/certificate_update"; 
	}
	
	//작성하기
	@RequestMapping(value = "/EducationInsert", method = RequestMethod.GET)
	public String educationinsert() {
		return "./education/education_insert";
	}
	@RequestMapping(value = "/EducationInsert", method = RequestMethod.POST)
	public String educationinsert(Model model, EducationDTO educationDTO) {
		educationService.educationinsert(educationDTO);
		model.addAttribute("MemberInfo", educationService.educationselect(educationDTO));
		return "./certificate/certificate_insert"; 
	}
}
