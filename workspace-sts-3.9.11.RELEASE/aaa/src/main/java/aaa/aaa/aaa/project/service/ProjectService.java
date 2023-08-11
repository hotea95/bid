package aaa.aaa.aaa.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import aaa.aaa.aaa.certificate.dto.CertificateDTO;
import aaa.aaa.aaa.member.controller.MemberController;
import aaa.aaa.aaa.project.dao.ProjectDAO;
import aaa.aaa.aaa.project.dto.COMMONPRODTO;
import aaa.aaa.aaa.project.dto.MYPRODTO;
import aaa.aaa.aaa.project.dto.ProjectDTO;

@Service
public class ProjectService {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectService.class);

	@Autowired
	private ProjectDAO projectDAO;
	
	//프로젝트 전체조회
	public List<ProjectDTO> projectselectAll() {
		return projectDAO.projectselectAll();
	}
	
	//프로젝트 상세조회
	public ProjectDTO projectselect(ProjectDTO projectDTO) {
		return projectDAO.projectselect(projectDTO);
	}
	
	//프로젝트 상세조회22
		public ProjectDTO projectselect2(CertificateDTO certificateDTO) {
			return projectDAO.projectselect2(certificateDTO);
		}
	
	//프로젝트 작성
	public void projectinsert(ProjectDTO projectDTO) {
		try {
			projectDAO.projectinsert(projectDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}
	
	//프로젝트 수정
	public void projectupdate(ProjectDTO projectDTO) {
		projectDAO.projectupdate(projectDTO);
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	//개인프로젝트 조회
	public MYPRODTO myproselectall(MYPRODTO myprodto) {
		logger.info("서비스도착");
		 return projectDAO.myproselectall(myprodto);
	}
	
	//개인 프로젝트 작성
	public void myproinsert(MYPRODTO myproDTO) {
		try {
			projectDAO.myproinsert(myproDTO);
			logger.info("서비스"+ myproDTO);
		} catch(DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}
	
	//공통 프로젝트 작성
	public void comproinsert(COMMONPRODTO commonprodto) {
		projectDAO.comproinsert(commonprodto);
	}
	
	//공통 플젝 전체조회
	public List<COMMONPRODTO> comproselectall() {
		return projectDAO.comproselectall();
	} 
	
	//공통 플젝 상세조회
	public List<COMMONPRODTO> getComVal(String PNO) {
		return projectDAO.getComVal(PNO);
	}
	
	//플젝 담당 인원 불러오기
	public List<MYPRODTO> getParticipantsByPno(String PNO) {
		return projectDAO.getParticipantsByPno(PNO);
	}
	
	//개인 플젝 삭제
	public void myprodelete2(String NO) {
		projectDAO.myprodelete3(NO);
	}
	
	//개인플펙 다중 작성
	public void myproinsert3(List<MYPRODTO> myproDTOList) {
        projectDAO.myproinsert3(myproDTOList);
    }
	
	//개인플젝 중복체크
	public List<MYPRODTO> che(String NO) {
		return projectDAO.che(NO);
	}
	
	//공통 플젝 상세조회
	public COMMONPRODTO comselect(COMMONPRODTO commonprodto) {
		return projectDAO.comselect(commonprodto);
	}
	
	//공통 플젝 삭제
	public void comprodelete2(String PNO) {
		projectDAO.comprodelete3(PNO);
	}
	
	//개인플젝 조회리스트
	public List<MYPRODTO> myproselectall3() {
		return projectDAO.myproselectall3();
	}
	
	//공통 플제 수정
	public void comproupdate(COMMONPRODTO commonprodto) {
		projectDAO.comproupdate(commonprodto);
	}
}
