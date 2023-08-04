package bbb.bbb.bbb.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bbb.bbb.bbb.dto.Criteria;
import bbb.bbb.bbb.dto.DTO;
import bbb.bbb.bbb.dto.SearchCriteria;

@Repository
public class DAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//작성
	  public void insert(DTO dto) { 
		  sqlSessionTemplate.insert("insert",dto); 
	  }
	 
	//전체조회
	  public List<DTO> selectall() {
		  return sqlSessionTemplate.selectList("selectall"); 
		  }
	  
	 //상세조회
	  public DTO select(DTO dto) {
		  return sqlSessionTemplate.selectOne("select",dto);
	  }
	 
	  //수정
	  public void update(DTO dto) {
		  sqlSessionTemplate.update("update",dto);
	  }
	  
	  //페이징
	  public List<DTO> list() throws Exception {
		  return sqlSessionTemplate.selectList("list");
	  }
	  //목록 + 페이징
	  public List<DTO> listpage(Criteria cri) throws Exception {
		  return sqlSessionTemplate.selectList("listpage",cri);
	  }
	  
	  public int listcount() throws Exception {
		  return sqlSessionTemplate.selectOne("listCount");
	  }
	  //목록+페이징+검색
	  public List<DTO> listSearch(SearchCriteria scri) throws Exception {
		  return sqlSessionTemplate.selectList("listSearch", scri);
	  }
	  //검색 결과 갯수
	  public int countSearch(SearchCriteria scri) throws Exception {
		  return sqlSessionTemplate.selectOne("countSearch",scri);
	  }
	  
}
