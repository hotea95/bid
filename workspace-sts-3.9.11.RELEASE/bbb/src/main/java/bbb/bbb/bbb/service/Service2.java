package bbb.bbb.bbb.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;


import bbb.bbb.bbb.dao.DAO;
import bbb.bbb.bbb.dto.Criteria;
import bbb.bbb.bbb.dto.DTO;
import bbb.bbb.bbb.dto.SearchCriteria;

@Service
public class Service2 {

	@Autowired
	private DAO dao;
	
	//작성
	public void insert(DTO dto) {
		try {
			dao.insert(dto);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace( );
		}
	}
	
	//전체조회
	  public List<DTO> selectall() { 
		  return dao.selectall(); 
		  }
	  
	 //상세조회
	 public DTO select(DTO dto) {
		 return dao.select(dto);
	 }
	 
	 //수정
	 public void update(DTO dto) {
		 dao.update(dto);
	 }
	 
	 //목록
	 public List<DTO> list() throws Exception {
		 return dao.list();
	 }
	 
	 //목록 + 페이징
	 public List<DTO> listpage(Criteria cri) throws Exception {
		 return dao.listpage(cri);
	 }
	 
	 //게시물 총 갯수
	 public int listcount() throws Exception {
		 return dao.listcount();
	 }
	 
	 //목록 + 페이징 + 검색
	 public List<DTO> listSearch(SearchCriteria scri) throws Exception {
		 return dao.listSearch(scri);
	 }
	 
	 //검색 결과 갯수
	 public int countSearch(SearchCriteria scri) throws Exception {
		 return dao.countSearch(scri);
	 }
	 
	 //엑셀@@@@@@@@@@@@@@@@@@@@@@@@@@
	 
	 
}
