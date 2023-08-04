package aaa.aaa.aaa.certificate.controller;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import aaa.aaa.aaa.certificate.dto.CertificateDTO;
import aaa.aaa.aaa.certificate.service.CertificateService;
import aaa.aaa.aaa.member.dto.MemberDTO;
import aaa.aaa.aaa.member.service.MemberService;
import aaa.aaa.aaa.project.service.ProjectService;

@Controller
public class CertificateController {

	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(CertificateController.class);
	
	@Autowired
	private CertificateService certificateService;
	@Autowired
	private MemberService memberservice;
	@Autowired
	private ProjectService projectservice;
	
	//자격증 전체조회
	@RequestMapping(value = "/CertificateSelect", method = RequestMethod.GET)
	public String certificatelist(Model model) {
		model.addAttribute("list",certificateService.certificateSelectAll());
		logger.info("list",model);
		return "./certificate/certificate_select_all_view";
	}
	
	//자격증 상세조회
	 @RequestMapping(value = "/CertificateSelectDetail", method = RequestMethod.GET)
	public String certificateselectdetail(Model model, CertificateDTO certificateDTO) {
	model.addAttribute("certificateDTO",certificateService.certificateSelect(certificateDTO));
	return "./certificate/certificate_select_view";
	}
	
	//자격증수정
	 @RequestMapping(value = "/CertificateUpdate", method = RequestMethod.GET)
	  public String certificateupdate(Model model, CertificateDTO certificateDTO, MemberDTO memberDTO) {
		  model.addAttribute("certificateDTO", certificateService.certificateSelect(certificateDTO));
		 // model.addAttribute("memberDTO", memberservice.memberSelect(memberDTO.getSTHKORNAME()));
		//  model.addAttribute("certificateDTO", MemberService.memberSelect(memberDTO.getSTHJUMIN()));
		  return "./certificate/certificate_update";
	  }
	 @RequestMapping(value = "/CertificateUpdate", method = RequestMethod.POST)
	  public String certificateupdate(CertificateDTO certificateDTO, Model model) {
		  certificateService.certificateUpdate(certificateDTO);
		  model.addAttribute("update",certificateService.certificateSelect(certificateDTO));
		  model.addAttribute("projectDTO",projectservice.projectselect2(certificateDTO));
		  return "./project/project_update";
	  }
	 
	 //자격증삭제
	 @RequestMapping(value = "/CertificateDelete", method = RequestMethod.GET)
	 public String certificatedelete(Model model, CertificateDTO certificateDTO) {
		 model.addAttribute("certificateDTO",certificateService.certificateSelect(certificateDTO));
		 return "./certificate/certificate_delete";
	 }
	 @RequestMapping(value = "/CertificateDelete", method = RequestMethod.POST)
	 public String certificatedelete(CertificateDTO certificateDTO) {
		 certificateService.certificateDelete(certificateDTO.getCERJUMIN());
		 return "./certificate/certificate_delete_view";
	 }
	 
	 //자격증 작성
	 @RequestMapping(value = "/CertificateInsert", method = RequestMethod.GET)
	 public String certificateinsert() {
		 return "./certificate/certificate_insert";
	 }
	 @RequestMapping(value = "/CertificateInsert", method = RequestMethod.POST)
	 public String certificateinsert(Model model, CertificateDTO certificateDTO) {
		 
		 System.err.println(certificateDTO);
		 System.err.println(certificateDTO);
		 System.err.println(certificateDTO);
		 System.err.println(certificateDTO);
		 certificateService.certificateInsert(certificateDTO);
		 model.addAttribute("MemberInfo",certificateService.certificateSelect(certificateDTO));
		 
		 return "./project/project_insert";
	 }
}
