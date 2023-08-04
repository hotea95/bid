package ccc.ccc.ccc.service;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import ccc.ccc.ccc.dao.MemberDAO;
import ccc.ccc.ccc.dto.Criteria;
import ccc.ccc.ccc.dto.MemberDTO;
import ccc.ccc.ccc.dto.SearchCriteria;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	//전체조회
	public List<MemberDTO> selectall() {
		return memberDAO.selectall();
	}
	
	//작성
	public void insert(MemberDTO memberdDTO) {
		try {
			memberDAO.insert(memberdDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace( );
		}
	}
	
	//페이징
	public List<MemberDTO> listPage(Criteria cri) throws Exception {
		return memberDAO.listPage(cri);
	}
	
	//총갯수
	public int listCount() throws Exception {
		return memberDAO.listCount();
	}
	
	//검색
	public List<MemberDTO> listSearch(SearchCriteria scri) throws Exception {
		return memberDAO.listSearch(scri);
	}
	//검색 갯수
	public int countSearch(SearchCriteria scri) throws Exception {
		return memberDAO.countSearch(scri);
	}
}

