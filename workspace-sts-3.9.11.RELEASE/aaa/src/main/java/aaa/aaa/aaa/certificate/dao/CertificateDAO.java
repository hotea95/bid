package aaa.aaa.aaa.certificate.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import aaa.aaa.aaa.certificate.dto.CertificateDTO;
import aaa.aaa.aaa.education.dto.EducationDTO;

@Repository
public class CertificateDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//자격증 전체조회
	public List<CertificateDTO> CertificateselectAll() {
		return sqlSessionTemplate.selectList("certificateselectAll");
	}
	
	//자격증 상세조회
	public CertificateDTO certificateselect(CertificateDTO certificateDTO) {
		return sqlSessionTemplate.selectOne("certificateselect", certificateDTO);
	}
	
	//자격증 상세조회22
		public CertificateDTO certificateselect2(EducationDTO educationDTO) {
			return sqlSessionTemplate.selectOne("certificateselect2", educationDTO);
		}
	
	//자격증 수정
	public void certificateupdate(CertificateDTO certificateDTO) {
		sqlSessionTemplate.update("certificateupdate", certificateDTO);
	}
	
	//자격증 삭제
	public void certificatedelete(String CERJUMIN) {
		sqlSessionTemplate.delete("certificatedelete", CERJUMIN);
	}
	
	//자격증 작성
	public void certificateinsert(CertificateDTO certificateDTO) {
		sqlSessionTemplate.insert("certificateinsert",certificateDTO);
	}
}
