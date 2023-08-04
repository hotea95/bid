package ccc.ccc.ccc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ccc.ccc.ccc.dto.Criteria;
import ccc.ccc.ccc.dto.MemberDTO;
import ccc.ccc.ccc.dto.SearchCriteria;

@Repository
public class MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//전체조회
	public List<MemberDTO> selectall() {
		return sqlSessionTemplate.selectList("selectall");
	}
	
	//작성
	public void insert(MemberDTO dto) {
		sqlSessionTemplate.insert("insert",dto);
	}
	
	//페이징
	public List<MemberDTO> listPage(Criteria cri) throws Exception {
		return sqlSessionTemplate.selectList("listPage",cri);
	}
	
	//총갯수
	public int listCount() throws Exception {
		return sqlSessionTemplate.selectOne("listCount");
	}
	
	//검색
	public List<MemberDTO> listSearch(SearchCriteria scri) throws Exception {
		return sqlSessionTemplate.selectList("listSearch",scri);
	}
	//검색 결과 갯수
	public int countSearch(SearchCriteria scri) throws Exception {
		return sqlSessionTemplate.selectOne("countSearch", scri);
	}
}
