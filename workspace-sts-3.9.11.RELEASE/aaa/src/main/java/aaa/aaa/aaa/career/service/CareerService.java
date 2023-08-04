package aaa.aaa.aaa.career.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import aaa.aaa.aaa.career.dao.CareerDAO;
import aaa.aaa.aaa.career.dto.CareerDTO;
import aaa.aaa.aaa.project.dto.ProjectDTO;

@Service
public class CareerService {

	@Autowired
	private CareerDAO careerDAO;
	
	//전체조회
	public List<CareerDTO>careerselectAll() {
		return careerDAO.careerselectAll();
	}
	//상세조회
	
	  public CareerDTO careerselect(CareerDTO careerDTO) { 
		  return
	  careerDAO.careerselect(careerDTO); 
		  }
	  
	//상세조회22
		
	  public CareerDTO careerselect2(ProjectDTO projectDTO) { 
		  return
	  careerDAO.careerselect2(projectDTO); 
		  }
	 
	
	//수정
	
	  public void careerupdate(CareerDTO careerDTO) {
	  careerDAO.careerupdate(careerDTO); 
	  }
	  
	  //작성
	  public void careerinsert(CareerDTO careerDTO) {
		  try {
			careerDAO.careerinsert(careerDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	  }
	 
}
