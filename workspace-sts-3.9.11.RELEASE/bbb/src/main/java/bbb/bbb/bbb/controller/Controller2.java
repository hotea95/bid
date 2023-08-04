package bbb.bbb.bbb.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bbb.bbb.bbb.dto.Criteria;
import bbb.bbb.bbb.dto.DTO;
import bbb.bbb.bbb.dto.PageMaker;
import bbb.bbb.bbb.dto.SearchCriteria;
import bbb.bbb.bbb.file.ProductUploadFileUtils;
import bbb.bbb.bbb.service.Service2;

@Controller
public class Controller2 {
	private static final Logger logger = LoggerFactory.getLogger(Controller2.class);
	
	@Autowired
	private Service2 service;
	
	   @Autowired(required=false)
	   @Qualifier("uploadPath" )
	   private String uploadPath;
	
	//작성
	@RequestMapping(value = "/Insert", method = RequestMethod.GET)
	  public String insert() { 
		  return "./bbb/bbb_insert"; 
		  }
	@RequestMapping(value = "/Insert", method = RequestMethod.POST)
	 public String insert(Model model, DTO dto, MultipartFile multipartFile) throws IOException, Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
	      String ymdPath = ProductUploadFileUtils.calcPath(imgUploadPath);
	      String fileName = null;
	      
	      if (multipartFile != null) {
	         fileName = ProductUploadFileUtils.fileUpload(imgUploadPath, multipartFile.getOriginalFilename(),multipartFile.getBytes(), ymdPath);
	      }else {
	         fileName = uploadPath + File.separator + "imges" + File.separator + "none.png";
	      }
	      
	      dto.setReceipt(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		
	      
		model.addAttribute("list",service.select(dto));
		service.insert(dto);
		 return "./bbb/bbb_insert_view";
	 }
	 
	
	//전체조회
	  @RequestMapping(value = "/SelectAll", method = RequestMethod.GET) 
	  public String list(Model model) { 
	model.addAttribute("list",service.selectall());
	  return "./bbb/bbb_select_all_view";
	  }
	  
	  //글목록 + 페이징
	  @RequestMapping(value = "/listPage", method = RequestMethod.GET)
	  public String listpage(Criteria cri, Model model) throws Exception{
		  List<DTO> list = service.listpage(cri);
		  model.addAttribute("list",list);
		  
		  PageMaker pageMaker = new PageMaker();
		  pageMaker.setCri(cri);
		  pageMaker.setTotalCount(service.listcount());
		  model.addAttribute("pageMaker", pageMaker);
		  
		  return "./bbb/bbb_listpage";
	  }
	  
	// 글 목록 + 페이징 + 검색
	  @RequestMapping(value = "/listSearch", method = RequestMethod.GET)
	  public String listPage(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
	     logger.info("get list search");
	     
	     List<DTO> list = service.listSearch(scri);
	     
	     for (int i = 0; i < list.size(); i++) {
			
	    	 String date = list.get(i).getUse_date();
	    	 
	    	 String month =  date.substring(0,2);
	    	 String day = date.substring(3, 5);
	    	 String year4 = date.substring(6);
	    	 String year;
	    	 
	    	 year = year4.substring(2);
		     
	    	 list.get(i).setUse_date(year+"/"+month+"/"+day);

		}
	
	     model.addAttribute("list", list);
	     
	     PageMaker pageMaker = new PageMaker();
	     pageMaker.setCri(scri);
	     //pageMaker.setTotalCount(service.listCount());
	     pageMaker.setTotalCount(service.countSearch(scri));
	     model.addAttribute("pageMaker", pageMaker);
	     
	     return "./bbb/bbb_listSearch";
	  }
	  
	  //상세조회
	  @RequestMapping(value = "/Select", method = RequestMethod.GET)
	  public String detail(Model model, DTO dto) {
		  model.addAttribute("dto",service.select(dto));
		  return "./bbb/bbb_select_view";
	  }
	  
	  //수정
	  @RequestMapping(value = "/Update", method = RequestMethod.GET)
	  public String update(Model model, DTO dto) {
		  model.addAttribute("dto",service.select(dto));
		  return "./bbb/bbb_update";
	  }
	  @RequestMapping(value = "/Update", method = RequestMethod.POST)
	  public String update(DTO dto,MultipartFile multipartFile,HttpServletRequest httpServletRequest) throws IOException, Exception {
		  
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
		        
		        dto.setReceipt(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		        logger.info("사진 업데이트 로그확인",dto);
		     }else {
		    	 dto.setReceipt(httpServletRequest.getParameter("Receipt"));
		     }
		  
		  service.update(dto);
		  return "./bbb/bbb_update_view";
	  }
	  
	  //엑셀
	  @RequestMapping(value = "/Excel", method = RequestMethod.GET)
	  public ModelAndView Convert(@ModelAttribute("scri") SearchCriteria scri, Model model) throws IOException, Exception {
		     
		  List<DTO> list = service.listSearch(scri);
		  List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
			
		  
			for (int i = 0; i < list.size(); i++) {
				
				Map<String,Object> map = new HashMap<String,Object>();
				
				map.put("expense_no", list.get(i).getExpense_no());
				map.put("use_date",list.get(i).getUse_date());
				map.put("name", list.get(i).getName());
				map.put("use_price", list.get(i).getUse_price());
				map.put("approve_price",list.get(i).getApprove_price());
				map.put("process_status", list.get(i).getProcess_status());
				map.put("registration_date", list.get(i).getRegistration_date());
				
				result.add(i, map);
				
				System.err.println(result);
			}
			
			for (int i = 0; i < result.size(); i++) {
			
				Map<String,Object> map = new HashMap<String,Object>();
				
				map.put("expense_no", list.get(i).getExpense_no());
				map.put("use_date",list.get(i).getUse_date());
				map.put("name", list.get(i).getName());
				map.put("use_price", list.get(i).getUse_price());
				map.put("approve_price",list.get(i).getApprove_price());
				map.put("process_status", list.get(i).getProcess_status());
				map.put("registration_date", list.get(i).getRegistration_date());
				
				result.set(i, map);
				
			}
			
			ModelAndView mv = new ModelAndView();
			mv.addObject("result", result);

			mv.setViewName("/bbb/bbb_excelDownLoad");
			
			return mv;
	  }
	 

}
