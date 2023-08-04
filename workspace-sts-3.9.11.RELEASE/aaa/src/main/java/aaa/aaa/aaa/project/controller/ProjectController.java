package aaa.aaa.aaa.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import aaa.aaa.aaa.career.service.CareerService;
import aaa.aaa.aaa.member.dto.MemberDTO;
import aaa.aaa.aaa.member.service.MemberService;
import aaa.aaa.aaa.project.dto.COMMONPRODTO;
import aaa.aaa.aaa.project.dto.MYPRODTO;
import aaa.aaa.aaa.project.dto.ProjectDTO;
import aaa.aaa.aaa.project.service.ProjectService;

@Controller
public class ProjectController {

	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(ProjectController.class);
	@Autowired
	private ProjectService projectService;
	@Autowired
	private CareerService careerService;
	@Autowired
	private MemberService memberService;
	
	//프로젝트 전체보기
	@RequestMapping(value = "/ProjectSelect", method = RequestMethod.GET)
	public String projectlist(Model model) {
		model.addAttribute("list",projectService.projectselectAll());
		logger.info("list",model);
		return "./project/project_select_all_view";
	}
	
	
	
	/*
	 * //프로젝트 상세보기
	 * 
	 * @RequestMapping(value= "/ProjectSelectDetail", method = RequestMethod.GET)
	 * public String projectselectdetail(Model model, ProjectDTO projectDTO) {
	 * model.addAttribute("projectDTO",projectService.projectselect(projectDTO));
	 * return "./project/project_select_view"; }
	 */
	
	//프로젝트 작성하기
	@RequestMapping(value = "/ProjectInsert", method = RequestMethod.GET)
	public String projectinsert() {
		return "./project/project_insert";
	}
	@RequestMapping(value = "/ProjectInsert", method = RequestMethod.POST)
	public String projectinsert(Model model, ProjectDTO projectDTO) {

		projectService.projectinsert(projectDTO);
		
		model.addAttribute("MemberInfo", projectService.projectselect(projectDTO));
		
		return "./career/career_insert";
	}
	
	//프로젝트 수정하기
	@RequestMapping(value = "/ProjectUpdate", method = RequestMethod.GET)
	public String projectupdate(Model model, ProjectDTO projectDTO) {
		model.addAttribute("projectDTO",projectService.projectselect(projectDTO));
		return "./project/project_update";
	}
	@RequestMapping(value = "/ProjectUpdate", method = RequestMethod.POST)
	public String projectupdate(ProjectDTO projectDTO, Model model) {
		
	
		projectService.projectupdate(projectDTO);
		model.addAttribute("update",projectService.projectselect(projectDTO));
		model.addAttribute("careerDTO",careerService.careerselect2(projectDTO));
		return "./career/career_update";
	}
	
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	//공통 프로젝트
/*	public String myproselectall(Model model) {
		model.addAttribute("list",projectService.myproselectall(null));
		return "./project/mypro_selectall";
	}*/
	
	//개인 프로젝트 작성하기
	@RequestMapping(value = "/Myproinsert", method = RequestMethod.GET)
	public String myproinsert(Model model, MYPRODTO myproDTO, HttpServletRequest request, MemberDTO memberDTO) {
		String NO = request.getParameter("NO");
		//model.addAttribute("list2",memberService.memberSelect(memberDTO));
		model.addAttribute("list2",memberService.memberSelectAll());
		model.addAttribute("list3", projectService.comproselectall());
		
		
		
		//model.addAttribute("list2",memberService.memberSelect2(NO));
		System.out.println(myproDTO);
		return "./project/mypro_insert";
	}
	
	@RequestMapping(value = "Myproinsert", method = RequestMethod.POST)
	public String myproinsert1(Model model, MYPRODTO myproDTO, HttpServletRequest request) {
		String NO = request.getParameter("NO");
		//model.addAttribute("list", projectService.myproselectall(myproDTO));
		projectService.myproinsert(myproDTO);
		logger.info("컨트롤러--------"+myproDTO);
		return "./project/mypro_insert_view";
	}
	
	//공통 프로젝트 작성
	@RequestMapping(value = "/Comproinsert", method = RequestMethod.GET)
	public String comproinsert() {
		
		return "./project/compro_insert";
	}
	
	@RequestMapping(value = "/Comproinsert", method = RequestMethod.POST)
	public String  comproinsert(Model model, COMMONPRODTO commonprodto) {
		projectService.comproinsert(commonprodto);
		model.addAttribute("list",projectService.comproselectall());
		return "./project/compro_insert_view";
		}
	
	//공통 프로젝트 전체조회
	@RequestMapping(value = "/Comproselectall", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list",projectService.comproselectall());
		return "./project/compro_selectall";
	}
	
	//공통 플젝 상세조회
	@ResponseBody
	@RequestMapping(value = "/Comproselectall", method = RequestMethod.GET, produces = "application/json")
	public List<COMMONPRODTO> list() {
		List<COMMONPRODTO> pro = projectService.comproselectall();
		return pro;
	}
	
	@ResponseBody
	@RequestMapping(value = "/Comproselectall2", method = RequestMethod.GET, produces = "application/json")
	public List<COMMONPRODTO> getcom(@RequestParam("pno") String pno) {
		List<COMMONPRODTO> pro = projectService.getComVal(pno);
		return pro;
	}
	
	//프로젝트마다 들어간 인원 조회
	  @RequestMapping(value = "/participants", method = RequestMethod.GET, produces = "application/json")
	    @ResponseBody
	    public List<MYPRODTO> getParticipants(@RequestParam("pno") String PNO) {
	        List<MYPRODTO> participants = projectService.getParticipantsByPno(PNO);
	        return participants;
	    }
	  
	  //개인프로젝트 삭제
	  @RequestMapping(value = "/myprodelete", method = RequestMethod.POST)
	  public String myprodelete(String NO) {
		  projectService.myprodelete2(NO);
		  return "./project/mypro_delect_view";
		  //return "./redirect:/
	  }
	  
	  @RequestMapping(value = "/Myproinsert3", method = RequestMethod.POST)
	    public String myproinsert3(Model model, HttpServletRequest request) {
	        List<MYPRODTO> myproDTOList = new ArrayList<>();

	        // 예시로 3개의 객체를 리스트에 추가합니다. 필요에 따라 객체를 생성하고 값을 설정해야 합니다.
	        for (int i = 0; i < 3; i++) {
	            MYPRODTO dto = new MYPRODTO();
	            dto.setNO("NO" + i);
	            dto.setPNO("PNO" + i);
	            dto.setSTMDATE("STMDATE" + i);
	            dto.setENDMDATE("ENDMDATE" + i);
	            dto.setROLE("ROLE" + i);
	            dto.setPRONAME("PRONAME" + i);
	            myproDTOList.add(dto);
	        }

	        projectService.myproinsert3(myproDTOList);

	        logger.info("컨트롤러--------" + myproDTOList);
	        return "./project/mypro_insert_view";
	    }
	}


