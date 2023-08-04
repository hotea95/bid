package aaa.aaa.aaa.certificate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import aaa.aaa.aaa.certificate.dao.CertificateDAO;
import aaa.aaa.aaa.certificate.dto.CertificateDTO;
import aaa.aaa.aaa.education.dto.EducationDTO;

@Service
public class CertificateService {

	@Autowired
	private CertificateDAO certificateDAO;
	
	//자격증 전체조회
	public List<CertificateDTO> certificateSelectAll() {
		return certificateDAO.CertificateselectAll();
	}
	
	//자격증 상세조회
	public CertificateDTO certificateSelect(CertificateDTO certificateDTO) {
		return certificateDAO.certificateselect(certificateDTO);
	}
	
	//자격증 상세조회 22
		public CertificateDTO certificateSelect2(EducationDTO educationDTO) {
			return certificateDAO.certificateselect2(educationDTO);
		}
	
	//자격증 수정
	public void certificateUpdate(CertificateDTO certificateDTO) {
		certificateDAO.certificateupdate(certificateDTO);
	}
	
	//자격증 삭제
	public void certificateDelete(String CERJUMIN) {
		certificateDAO.certificatedelete(CERJUMIN);
	}
	
	//자격증 작성
	public void certificateInsert(CertificateDTO certificateDTO) {
		try {
			certificateDAO.certificateinsert(certificateDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}
}
