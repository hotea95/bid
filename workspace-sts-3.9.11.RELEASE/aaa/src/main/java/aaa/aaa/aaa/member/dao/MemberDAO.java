package aaa.aaa.aaa.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import aaa.aaa.aaa.member.controller.MemberController;
import aaa.aaa.aaa.member.dto.Criteria;
import aaa.aaa.aaa.member.dto.MemberDTO;
import aaa.aaa.aaa.member.dto.SearchCriteria;

@Repository
public class MemberDAO {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//멤버 전체조회
	public List<MemberDTO> memberselectAll() {
		return sqlSessionTemplate.selectList("memberselectAll");
	}
	
	//퇴직자 전체조회
			public List<MemberDTO> retirement() {
				return sqlSessionTemplate.selectList("retirement");
			}
			
	//예비인력 전체조회
			public List<MemberDTO> preliminary() {
				return sqlSessionTemplate.selectList("preliminary");
			}
	
	//멤버 페이징
	public List<MemberDTO> listPage(Criteria cri) throws Exception {
		return sqlSessionTemplate.selectList("listpage",cri);
	}
	
	//게시물 총갯수
	public int listCount() throws Exception {
		return sqlSessionTemplate.selectOne("listCount");
	}
	
	//검색
	public List<MemberDTO> listSearch(SearchCriteria scri) throws Exception{
		return sqlSessionTemplate.selectList("listSearch",scri);
	}
	
	//정규직만 검색
	public List<MemberDTO> listSearchAsReg(SearchCriteria scri) throws Exception{
		return sqlSessionTemplate.selectList("listSearchAsReg",scri);
	}
	
	public int countSearch(SearchCriteria scri) throws Exception {
		return sqlSessionTemplate.selectOne("countSearch",scri);
	}
	
	
	

	//멤버 상세보기
	
	  public MemberDTO memberselect(MemberDTO memberDTO) { 
		  return sqlSessionTemplate.selectOne("memberselect",memberDTO); 
		  
	  }
	  
	  public List<MemberDTO> memberselect2(String NO) {
			return sqlSessionTemplate.selectList("memberselect2",NO);
		}
	 
	 
	
	/*
	 * public MemberDTO memberselect(MemberDTO memberDTO) { return
	 * sqlSessionTemplate.selectOne("memberselect"); }
	 */
	
	
	//멤버 수정
	
	 public void memberupdate(MemberDTO memberDTO) { logger.info("dao 수정완료");
	  sqlSessionTemplate.update("memberupdate",memberDTO); }
	 
	  
	/*
	 * public int memberupdate(String STHKORNAME) { return
	 * sqlSessionTemplate.update("memberupdate",STHKORNAME); }
	 */
	
	//멤버 작성하기
	public void memberinsert(MemberDTO memberDTO) {
		sqlSessionTemplate.insert("memberinsert", memberDTO);
	}
	
	//멤버 삭제
	
//	public void memberdelete(MemberDTO memberDTO) {
//		sqlSessionTemplate.delete("memberdelete", memberDTO);
//	}
	
	public void memberdelete(List<String> NO) {
	    sqlSessionTemplate.delete("memberdelete", NO);
	}
	
	//아이디 중복 체크
	public int idChk(MemberDTO memberDTO) throws Exception {
		int result = sqlSessionTemplate.selectOne("idchk",memberDTO);
		return result;
	}
	
	//로그인
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		//return sqlSessionTemplate.selectOne("login", memberDTO);
		return sqlSessionTemplate.selectOne("login2", memberDTO);
	}
	
}

