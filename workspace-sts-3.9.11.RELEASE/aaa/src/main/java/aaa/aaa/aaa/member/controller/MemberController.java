package aaa.aaa.aaa.member.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import aaa.aaa.aaa.education.dto.EducationDTO;
import aaa.aaa.aaa.education.service.EducationService;
import aaa.aaa.aaa.file.ProductUploadFileUtils;
import aaa.aaa.aaa.member.dto.CODEMDTO;
import aaa.aaa.aaa.member.dto.Criteria;
import aaa.aaa.aaa.member.dto.MemberDTO;
import aaa.aaa.aaa.member.dto.PageMaker;
import aaa.aaa.aaa.member.dto.SearchCriteria;
import aaa.aaa.aaa.member.service.CODEService;
import aaa.aaa.aaa.member.service.MemberService;
import aaa.aaa.aaa.project.dto.MYPRODTO;
import aaa.aaa.aaa.project.service.ProjectService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private static final String STHKORNAME = null;

	@Autowired
	private MemberService memberService;
	@Autowired
	private EducationService educationService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private CODEService comeService;
	
	   @Autowired(required=false)
	   @Qualifier("uploadPath" )
	   private String uploadPath;

	// 사원 전체조회하기
	@RequestMapping(value = "/MemberSelect", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list", memberService.memberSelectAll());
		logger.info("list", model);
		return "./member/member_select_all_view";
	}
	
	//퇴직자 보기
			@RequestMapping(value = "/Retirement", method = RequestMethod.GET)
				public String retirement(Model model, MemberDTO memberDTO) {
					model.addAttribute("list",memberService.retirement());
					return "./member/retirement_view";
				}
			
	//예비 인력 보기
	@RequestMapping(value = "/Preliminary", method = RequestMethod.GET)
	public String preliminary(Model model, MemberDTO memberDTO) {
		model.addAttribute("list",memberService.preliminary());
		return "./member/preliminary_view";
	}
	

	// 전체조회하기 페이징
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public String listPage(Criteria cri, Model model) throws Exception {
		logger.info("get list page");
		List<MemberDTO> list = memberService.listPage(cri);
		model.addAttribute("list", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberService.listCount());
		model.addAttribute("pageMaker", pageMaker);

		return "./member/listPage";
	}

	// 글 목록 + 페이징 + 검색
	
	  @RequestMapping(value = "/listSearch", method = RequestMethod.GET) 
	  public String listSearch(@ModelAttribute("scri") SearchCriteria scri, Model model)throws Exception { 
		  logger.info("get list search");
	  
	  List<MemberDTO> list = memberService.listSearch(scri);
	  model.addAttribute("list", list);
	  
	  PageMaker pageMaker = new PageMaker(); 
	  pageMaker.setCri(scri);
	 // pageMaker.setTotalCount(memberService.listCount());
	  pageMaker.setTotalCount(memberService.countSearch(scri));
	  model.addAttribute("pageMaker", pageMaker); 
	  
	  return "./member/listSearch";
	  }
	  
	 // 정규직 + 글 목록 + 페이징 + 검색
		  @RequestMapping(value = "/listSearchAsReg", method = RequestMethod.GET) 
		  public String listSearchReg(@ModelAttribute("scri") SearchCriteria scri, Model model)throws Exception { 
			  logger.info("get list search");
		  
		  List<MemberDTO> list = memberService.listSearchAsReg(scri);
		  model.addAttribute("list", list);
		  
		  PageMaker pageMaker = new PageMaker(); 
		  pageMaker.setCri(scri);
		 // pageMaker.setTotalCount(memberService.listCount());
		  pageMaker.setTotalCount(memberService.countSearch(scri));
		  model.addAttribute("pageMaker", pageMaker); 
		  
		  return "./member/listSearchAsReg";
		  }
	  
	
	

	// 사원 상세보기
	@RequestMapping(value = "/MemberSelectDetail", method = RequestMethod.GET)
	public String detail(Model model, MemberDTO memberDTO, MYPRODTO myprodto, String NO) {
		//model.addAttribute("memberDTO",memberService.memberSelect(memberDTO));
		System.err.println(memberDTO);
		//model.addAttribute("list2",projectService.myproselectall(myprodto));
		model.addAttribute("memberDTO", memberService.memberSelect(memberDTO));
		
		//model.addAttribute("compro",projectService.comproselectall());
		//model.addAttribute("memberDTO", memberService.memberSelect2(NO));
		//model.addAttribute("memberDTO",memberService.memberSelectAll());
		
		logger.info("컨트롤러 도착");
		return "./member/member_select_view";
	}

	// 사원 수정하기
	@RequestMapping(value = "/MemberUpdate", method = RequestMethod.GET)
	public String memberupdate(Model model, MemberDTO memberDTO) {
		
		memberDTO = memberService.memberSelect(memberDTO);
		
		/*
		 * String year; String month; String date; String lunOrSol;
		 * 
		 * int firstIndex; int secondIndex; int thirdIndex;
		 * 
		 * firstIndex = memberDTO.getSTHBIRTH().indexOf(",", 0); secondIndex =
		 * memberDTO.getSTHBIRTH().indexOf(",", (firstIndex+1)); thirdIndex =
		 * memberDTO.getSTHBIRTH().indexOf(",", (secondIndex+1));
		 * 
		 * year = memberDTO.getSTHBIRTH().substring(0,firstIndex); month =
		 * memberDTO.getSTHBIRTH().substring(firstIndex+1, secondIndex); date =
		 * memberDTO.getSTHBIRTH().substring(secondIndex+1, thirdIndex); lunOrSol =
		 * memberDTO.getSTHBIRTH().substring(thirdIndex+1);
		 * 
		 * model.addAttribute("memberDTO", memberService.memberSelect(memberDTO));
		 * model.addAttribute("year", year); model.addAttribute("month", month);
		 * model.addAttribute("date", date); model.addAttribute("lunOrSol", lunOrSol);
		 */
		
		logger.info("컨트롤러 수정완료get");
		return "./member/member_update";
	}

	@RequestMapping(value = "/MemberUpdate", method = RequestMethod.POST)
	public String memberupdate(Model model ,MemberDTO memberDTO,EducationDTO educationDTO, MultipartFile multipartFile ,HttpServletRequest httpServletRequest) throws Exception {
        
     // 새로운 파일 등록 되어있는지 확인
     if (multipartFile.getOriginalFilename() != null && multipartFile.getOriginalFilename() != "") {
        
        //기존 파일 삭제
        new File(uploadPath + httpServletRequest.getParameter("pimg")).delete();
        new File(uploadPath + httpServletRequest.getParameter("pthumbimg")).delete();
        
        //새로 첨부한 파일 등록
        String imgUploadPath = uploadPath + File.separator + "imgUpload";
        String ymdPath = ProductUploadFileUtils.calcPath(imgUploadPath);
        String fileName = ProductUploadFileUtils.fileUpload(imgUploadPath, multipartFile.getOriginalFilename(), multipartFile.getBytes() , ymdPath);
        logger.info("사진 업데이트 로그확인 사진 ",fileName);
        
        memberDTO.setSTHPHOTO(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
        logger.info("사진 업데이트 로그확인",memberDTO);
     }else {
    	 memberDTO.setSTHPHOTO(httpServletRequest.getParameter("STHPHOTO"));
     }

	
		memberService.memberUpdate(memberDTO);
		model.addAttribute("update",memberService.memberSelect(memberDTO));
		//memberService.memberUpdate(STHKORNAME);
		logger.info("컨트롤러 수정완료post");
		model.addAttribute("educationDTO",educationService.educationselectM(memberDTO));
		return "./education/education_update";
	}

	// 사원 작성하기
	@RequestMapping(value = "/MemberInsert", method = RequestMethod.GET)
	public String memberinsert(Model model,MemberDTO memberDTO) {
		model.addAttribute("MemberInfo", memberService.memberSelect(memberDTO));
		return "./member/member_insert";
	}

	@RequestMapping(value = "/MemberInsert", method = RequestMethod.POST)
	public String memberinsert(Model model, MemberDTO memberDTO , MultipartFile multipartFile)throws Exception{

	      String imgUploadPath = uploadPath + File.separator + "imgUpload";
	      String ymdPath = ProductUploadFileUtils.calcPath(imgUploadPath);
	      String fileName = null;
	      
	      if (multipartFile != null) {
	         fileName = ProductUploadFileUtils.fileUpload(imgUploadPath, multipartFile.getOriginalFilename(),multipartFile.getBytes(), ymdPath);
	      }else {
	         fileName = uploadPath + File.separator + "imges" + File.separator + "none.png";
	      }
	      
	      memberDTO.setSTHPHOTO(File.separator + "imgUpload" + ymdPath + File.separator + fileName);

		 memberService.memberInsert(memberDTO);
		 
		model.addAttribute("MemberInfo", memberService.memberSelect(memberDTO));
			
	//	return "./education/education_insert";
		return "./member/member_insert_view";
	}

	// 사원 삭제하기
	@RequestMapping(value = "/MemberDelete", method = RequestMethod.GET)
	public String memberdelete(Model model, MemberDTO memberDTO) {
		//model.addAttribute("memberDTO", memberService.memberSelect(memberDTO.getSTHKORNAME()));
		//model.addAttribute("memberDTO", memberService.memberSelect(memberDTO.getSTHJUMIN()));
		model.addAttribute("memberDTO", memberService.memberSelectAll());
		return "./member/member_delete";
	}

	@RequestMapping(value = "/MemberDelete", method = RequestMethod.POST)
	public String memberdelete(MemberDTO memberDTO) {
	//	memberService.memberDelete(memberDTO.getSTHKORNAME());
		memberService.memberDelete(memberDTO);
		return "./member/member_delete_view";
	}
	
	//팝업창 테스트
	@RequestMapping(value = "/Pou", method = RequestMethod.GET)
	public String pou(@ModelAttribute("scri") SearchCriteria scri,MemberDTO memberDTO, Model model,MYPRODTO myprodto) throws Exception {
		model.addAttribute("list",memberService.listSearch(scri));
		model.addAttribute("list2",projectService.comproselectall());
		//model.addAttribute("list3",projectService.myproselectall(myprodto));
		return "./member/pou";
	}
	
	// 중복 체크를 위한 API 엔드포인트 추가
	@RequestMapping(value = "/checkDuplicate", method = RequestMethod.POST)
	@ResponseBody
	public List<MYPRODTO> checkDuplicate(@RequestParam("NO") String no) {
	    // 서비스 레이어에서 중복 체크를 수행하는 메서드를 호출하고 결과를 반환
	    List<MYPRODTO> isDuplicate = projectService.che(no);
	    return isDuplicate;
	}

}
