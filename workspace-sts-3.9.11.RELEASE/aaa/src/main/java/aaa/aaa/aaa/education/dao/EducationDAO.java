package aaa.aaa.aaa.education.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import aaa.aaa.aaa.education.dto.EducationDTO;
import aaa.aaa.aaa.member.dto.MemberDTO;

@Repository
public class EducationDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//전체조회
	public List<EducationDTO> educationselectAll() {
		return sqlSessionTemplate.selectList("educationselectAll");
	}
	
	//상세조회 - MemberDTO
	public EducationDTO educationselect(EducationDTO educationDTO) {
		return sqlSessionTemplate.selectOne("educationselect",educationDTO);
    
	}
	
	//상세조회 - Member
	public EducationDTO educationselectM(MemberDTO memberDTO) {
		return sqlSessionTemplate.selectOne("educationselectM",memberDTO);
	}
	//수정
	public void educationupdate(EducationDTO educationDTO) {
		sqlSessionTemplate.update("educationupdate",educationDTO);
	}
	
	//작성
	public void educationinsert(EducationDTO educationDTO) {
		sqlSessionTemplate.insert("educationinsert", educationDTO);
	}
}
