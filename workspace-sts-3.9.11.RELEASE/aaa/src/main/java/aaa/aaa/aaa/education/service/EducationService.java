package aaa.aaa.aaa.education.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import aaa.aaa.aaa.education.dao.EducationDAO;
import aaa.aaa.aaa.education.dto.EducationDTO;
import aaa.aaa.aaa.member.dto.MemberDTO;

@Service
public class EducationService {

	@Autowired
	private EducationDAO educationDAO;
	
	//전체조회
	public List<EducationDTO>educationselectAll() {
		return educationDAO.educationselectAll();
	}
	
	//상세조회
	public EducationDTO educationselect(EducationDTO educationDTO) {
		return educationDAO.educationselect(educationDTO);
	}
	
	//상세조회 - MemberDTO
	public EducationDTO educationselectM(MemberDTO memberDTO) {
		return educationDAO.educationselectM(memberDTO);
	}
	
	//수정
	public void educationupdate(EducationDTO educationDTO) {
		educationDAO.educationupdate(educationDTO);
	}
	
	//작성
	public void educationinsert(EducationDTO educationDTO) {
		try {
			educationDAO.educationinsert(educationDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}
}
