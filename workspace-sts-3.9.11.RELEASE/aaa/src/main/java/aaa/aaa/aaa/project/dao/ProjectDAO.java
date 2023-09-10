package aaa.aaa.aaa.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import aaa.aaa.aaa.certificate.dto.CertificateDTO;
import aaa.aaa.aaa.project.dto.COMMONPRODTO;
import aaa.aaa.aaa.project.dto.MYPRODTO;
import aaa.aaa.aaa.project.dto.ProjectDTO;
import aaa.aaa.aaa.project.service.ProjectService;

@Repository
public class ProjectDAO {
	private static final Logger logger = LoggerFactory.getLogger(ProjectDAO.class);

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//프로젝트 전체조회
	public List<ProjectDTO> projectselectAll() {
		return sqlSessionTemplate.selectList("projectselectAll");
	}
	
	//프로젝트 상세조회
	public ProjectDTO projectselect(ProjectDTO projectDTO) {
		return sqlSessionTemplate.selectOne("projectselect", projectDTO);
	}
	
	//프로젝트 상세조회22
		public ProjectDTO projectselect2(CertificateDTO certificateDTO) {
			return sqlSessionTemplate.selectOne("projectselect2", certificateDTO);
		}
	
	//프로젝트 작성
	public void projectinsert(ProjectDTO projectDTO) {
		sqlSessionTemplate.insert("projectinsert",projectDTO);
	}
	
	//프로젝트 수정
	public void projectupdate(ProjectDTO projectDTO) {
		sqlSessionTemplate.update("projectupdate",projectDTO);
	}
	
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	//개인프로젝트조회
		public MYPRODTO myproselectall(MYPRODTO myproDTO) {
			logger.info("dao도착");
		return sqlSessionTemplate.selectOne("myproselectall", myproDTO);
	}
		
		//개인 프로젝트 작성
		public void myproinsert(MYPRODTO myproDTO) {
			logger.info("dao도착"+myproDTO);
			sqlSessionTemplate.insert("myproinsert",myproDTO);
			
		}
		
		//공통 프로젝트 작성
		public void comproinsert(COMMONPRODTO commonprodto) {
			sqlSessionTemplate.insert("comproinsert", commonprodto);
		}
		
		//공통 플젝 전체조회
		public List<COMMONPRODTO> comproselectall() {
			return sqlSessionTemplate.selectList("comproselectall");
		}
		
		//공통 플젝 상세조회
		public List<COMMONPRODTO> getComVal(String PNO) {
			return sqlSessionTemplate.selectList("comproselectall2",PNO);
		}
		
		public List<MYPRODTO> getParticipantsByPno(String PNO) {
			return sqlSessionTemplate.selectList("getParticipantsByPno",PNO);
		}
		
		//개인 플젝 삭제
		public void myprodelete3(String NO, String PNO) {
		    Map<String, String> paramMap = new HashMap<>();
		    paramMap.put("NO", NO);
		    paramMap.put("PNO", PNO);
		    System.out.println("DAO값"+NO+PNO);
		    sqlSessionTemplate.delete("myprodelect", paramMap); // NO와 PNO를 맵에 담아 SQL 쿼리에 전달
		}

		
		// 개인 프로젝트 다중작성
		public void myproinsert3(List<MYPRODTO> myproDTOList) {
	        sqlSessionTemplate.insert("myproinsert3", myproDTOList);
	    }
		
		//개인 플젝 중복체크
		public List<MYPRODTO> che(String NO) {
			return sqlSessionTemplate.selectList("che",NO);
		}
		
		//공통 플젝 상세조회
		public COMMONPRODTO comselect(COMMONPRODTO commonprodto) {
			return sqlSessionTemplate.selectOne("comselect",commonprodto);
		}
		
		//공통 플젝 삭제하기
		public int comprodelete3(String PNO) {
			
//			int result = sqlSessionTemplate.selectOne("getParticipantsByPno",PNO);
//			
//			if (result > 0 ) {
//				System.out.println("실패");
//				 return result;
//			}else {
//				
//			}
//			int result1 = sqlSessionTemplate.delete("comprodelete",PNO);
//			System.out.println("성공");
//			return result1;
//			
		
			
			
			
			System.out.println("DAO"+PNO);
			
			int result = sqlSessionTemplate.delete("comprodelete",PNO);
			
			System.out.println(result);
			
			if ( result > 0 ) {
				System.out.println("성공");
			}else {
				System.out.println("ㅗ");
			}
			
			return result;
			
		}
		
		//개인플젝 전체조회리스트
		public List<MYPRODTO> myproselectall3() {
			return 	sqlSessionTemplate.selectList("myproselectall3");
		}
		
		//공통 플젝 수정
		public void comproupdate(COMMONPRODTO commonprodto) {
			sqlSessionTemplate.update("comproupdate",commonprodto);
		}
		
		//개인 플젝 수정
		public void myproupdate(MYPRODTO myprodto) {
			sqlSessionTemplate.update("myproupdate",myprodto);
		}
		
		//개인플젝 상세조회2개
		public MYPRODTO myproselectOne(MYPRODTO myprodto) {
			return sqlSessionTemplate.selectOne("myproselectone",myprodto);
		}
		
		//개인플젝 확인
		public List<MYPRODTO> myprolist(String NO) {
			return sqlSessionTemplate.selectList("myprolist",NO);
		}
}
