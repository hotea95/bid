package aaa.aaa.aaa.project.controller;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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

	    try {
	        projectService.myproinsert(myproDTO);
	        logger.info("컨트롤러: " + myproDTO);
	        return "./project/mypro_insert_view";
	    } catch (DataIntegrityViolationException e) {
	        model.addAttribute("errorMessage", "프로젝트 등록 중 오류가 발생했습니다.");
	        return "./project/myproj_insert_error"; // 에러 페이지 경로
	    }
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
	
	//프로젝트마다 들어간 인원 조회2222222222
	  @RequestMapping(value = "/participants", method = RequestMethod.GET, produces = "application/json")
	    @ResponseBody
	    public List<MYPRODTO> getParticipants(@RequestParam("pno") String PNO) {
	        List<MYPRODTO> participants = projectService.getParticipantsByPno(PNO);
	        return participants;
	    }
	  
	  //개인프로젝트 한거 확인
	  @RequestMapping(value = "/prolist", method = RequestMethod.GET)
	  public String comproselectList(@RequestParam("NO") String NO,Model model) {
		 model.addAttribute("list",projectService.myprolist(NO));
		  return "./project/pro_list";
	  }
	  
	  //개인프로젝트 삭제2233
	  @RequestMapping(value = "/myprodelete", method = RequestMethod.POST)
	  public String myprodelete(String NO) {
		  System.out.println("ZZZZZZZZZZZ"+NO);
		  projectService.myprodelete2(NO);
		  return "./project/mypro_delect_view";
		  //return "./redirect:/
	  }
	  
	  @RequestMapping(value = "/Myproinsert3", method = RequestMethod.POST)
	    public String myproinsert3(Model model, HttpServletRequest request, MYPRODTO myProDTO) {
		  
		  try {
	        //split으로 컬럼별로 한개의 문자열을 배열에 하나씩 변환
	        String NO = myProDTO.getNO();
	        String[] NoList = NO.split(",");
	        String PNO = myProDTO.getPNO();
	        String[] PNOList = PNO.split(",");
	        String STMDATE = myProDTO.getSTMDATE();
	        String[] STMDATEList = STMDATE.split(",");
	        String ENDMDATE = myProDTO.getENDMDATE();
	        String[] ENDMDATEList = ENDMDATE.split(",");
	        String ROLE = myProDTO.getROLE();
	        String[] ROLEList = ROLE.split(",");
	        String PRONAME = myProDTO.getPRONAME();
	        String[] PRONAMEList = PRONAME.split(",");

	        //그 배열을 컬럼별로 리스트에 넣는다
	        int count = NoList.length;
	        
	        
	        for (int i = 0; i < count; i++) {
	        	
	        	myProDTO.setNO(NoList[i]);
	        	myProDTO.setPNO(PNOList[i]);
	        	myProDTO.setSTMDATE(STMDATEList[i]);
	        	myProDTO.setENDMDATE(ENDMDATEList[i]);
	        	myProDTO.setROLE(ROLEList[i]);
	        	myProDTO.setPRONAME(PRONAMEList[i]);
	        	
	        	projectService.myproinsert(myProDTO);
				
			}


		  return "./project/mypro_insert_view";
		  }catch (DataIntegrityViolationException e) {
			  return "./project/myproj_insert_error2"; // 에러 페이지 경로
		}
	    }
	  
	  
	  //공통 프로젝트 수정
	  @RequestMapping(value = "ComproUpdate", method = RequestMethod.GET)
	  public String comproupdate(Model model, COMMONPRODTO commonprodto) {
		//model.addAttribute("list",projectService.comproselectall());
		model.addAttribute("list",projectService.comselect(commonprodto));
		return "./project/compro_update";
	  }
	  
	  @RequestMapping(value = "ComproUpdate", method = RequestMethod.POST)
	  public String comproupdate(COMMONPRODTO commonprodto) {
		  
		  projectService.comproupdate(commonprodto);
		  return "./project/compro_update_view";
	  }
	  
	  
	  //공통 플젝 상세조회
	  @RequestMapping(value = "Comproselectone", method = RequestMethod.GET)
	  public String selectone(Model model, COMMONPRODTO commonprodto) {
		  model.addAttribute("list",projectService.comselect(commonprodto));
		  return "./project/compro_selectone_view";
	  }
	  
	  
	  //공통플젝 삭제
		  @RequestMapping(value = "/Comprodelete", method = RequestMethod.POST)
	  public String comprodelete(String PNO) {
		 System.out.println("컨트롤러 플젝 삭제"+ PNO);
		 System.out.println("컨트롤러 플젝 삭제"+ PNO);
		 System.out.println("컨트롤러 플젝 삭제"+ PNO);
		 System.out.println("컨트롤러 플젝 삭제"+ PNO);
		 System.out.println("컨트롤러 플젝 삭제"+ PNO);
		 
		  projectService.comprodelete2(PNO);
		  return "./project/compro_delete";
	  }
	
	//개인플젝 수정
		  @RequestMapping(value = "/MyproUpdate", method = RequestMethod.GET)
		  public String myproupdate(Model model, MYPRODTO myprodto) {
			 model.addAttribute("list",projectService.myproselectOne(myprodto));
			  return "./project/mypro_update";
		  }
		  
		  @RequestMapping(value = "/MyproUpdate", method = RequestMethod.POST)
		  public String myproupdate(MYPRODTO myprodto) {
			  projectService.myproupdate(myprodto);
			  return "./project/mypro_update_view";
		  }
		  
		  //개인플젝 조건2개 조회
		  @RequestMapping(value = "/MyproselectOne", method = RequestMethod.GET)
		  public String myproselectOne(Model model, MYPRODTO myprodto) {
			  model.addAttribute("list",projectService.myproselectOne(myprodto));
			  return "./project/mypro_selectone";
		  }
		  
	}


