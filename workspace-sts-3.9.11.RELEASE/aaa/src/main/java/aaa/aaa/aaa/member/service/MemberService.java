package aaa.aaa.aaa.member.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import aaa.aaa.aaa.member.controller.MemberController;
import aaa.aaa.aaa.member.dao.MemberDAO;
import aaa.aaa.aaa.member.dto.Criteria;
import aaa.aaa.aaa.member.dto.MemberDTO;
import aaa.aaa.aaa.member.dto.SearchCriteria;

@Service
public class MemberService {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberDAO memberDAO;
	
	//멤버 전체조회
	public List<MemberDTO>memberSelectAll() {
		return memberDAO.memberselectAll();
	}
	
	//퇴직자 조회
			public List<MemberDTO> retirement() {
				return memberDAO.retirement();
			}
			
	//예비인력 조회
		public List<MemberDTO> preliminary() {
			return memberDAO.preliminary();
		}
	
	//멤버 전체조회 페이징
	public List<MemberDTO> listPage(Criteria cri) throws Exception {
		return memberDAO.listPage(cri);
	}
	
	public int listCount() throws Exception {
		return memberDAO.listCount();
	}
	
	//검색
	public List<MemberDTO> listSearch(SearchCriteria scri) throws Exception {
		return memberDAO.listSearch(scri);
	}
	
	//정규직만 검색
	public List<MemberDTO> listSearchAsReg(SearchCriteria scri) throws Exception {
		return memberDAO.listSearchAsReg(scri);
	}

	public int countSearch(SearchCriteria scri) throws Exception {
		return memberDAO.countSearch(scri);
	}
	
	
	
	
	//멤버 상세조회
	
	  public MemberDTO memberSelect(MemberDTO memberDTO) { 
		  return memberDAO.memberselect(memberDTO);
		  }
	  
	 
	  public List<MemberDTO> memberSelect2(String NO) {
			return memberDAO.memberselect2(NO);
		}
	  
	/*
	 * public MemberDTO memberSelect(MemberDTO memberDTO) { return
	 * memberDAO.memberselect(memberDTO); }
	 */
	 
	 
	
	//멤버 수정
	
	  public void memberUpdate(MemberDTO memberDTO) { logger.info("서비스 완료");
	 memberDAO.memberupdate(memberDTO); }
	 
	  
	/*
	 * public MemberDTO memberUpdate(String STHKORNAME) { return
	 * memberDAO.memberselect(STHKORNAME); }
	 */
	//멤버작성
	public void memberInsert(MemberDTO memberDTO) {
		try {
			memberDAO.memberinsert(memberDTO);
		} catch(DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}
	//멤버 삭제
	/*
	 * public void memberDelete(String STHKORNAME) {
	 * memberDAO.memberdelete(STHKORNAME); }
	 */
	
	public void memberDelete(MemberDTO memberDTO) {
		memberDAO.memberdelete(memberDTO);
	}
}
