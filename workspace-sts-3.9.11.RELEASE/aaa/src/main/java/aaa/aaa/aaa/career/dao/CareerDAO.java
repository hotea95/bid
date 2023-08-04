package aaa.aaa.aaa.career.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import aaa.aaa.aaa.career.dto.CareerDTO;
import aaa.aaa.aaa.project.dto.ProjectDTO;

@Repository
public class CareerDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//전체조회
	public List<CareerDTO> careerselectAll() {
		return sqlSessionTemplate.selectList("careerselectAll");
	}
	
	//상세조회
	
	  public CareerDTO careerselect(CareerDTO careerDTO) { 
		  return
	 sqlSessionTemplate.selectOne("careerselect",careerDTO); 
		  }
	  
	//상세조회22
		
	  public CareerDTO careerselect2(ProjectDTO projectDTO) { 
		  return
	 sqlSessionTemplate.selectOne("careerselect2",projectDTO); 
		  }
	 
	
	//수정
	
	  public void careerupdate(CareerDTO careerDTO) {
	  sqlSessionTemplate.update("careerupdate",careerDTO); 
	  }
	  
	  //작성
	  public void careerinsert(CareerDTO careerDTO) {
		  sqlSessionTemplate.insert("careerinsert",careerDTO);
	  }
	 
}
