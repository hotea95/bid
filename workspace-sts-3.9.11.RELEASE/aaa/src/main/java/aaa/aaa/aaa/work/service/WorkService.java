package aaa.aaa.aaa.work.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import aaa.aaa.aaa.career.dto.CareerDTO;
import aaa.aaa.aaa.work.dao.WorkDAO;
import aaa.aaa.aaa.work.dto.WorkDTO;

@Service
public class WorkService {

	@Autowired
	private WorkDAO workDAO;
	
	
	  //전체조회
	public List<WorkDTO> workselectAll() {
		return workDAO.workselectAll();
	  }
	  
	  //프로젝트 상세조회 
	public WorkDTO workselect(WorkDTO workDTO) { 
		return workDAO.workselect(workDTO); 
		}
	
	  //프로젝트 상세조회 22
		public WorkDTO workselect2(CareerDTO careerDTO) { 
			return workDAO.workselect2(careerDTO); 
			}
	  
	  //수정
	public void workupdate(WorkDTO workDTO) {
		workDAO.workupdate(workDTO); 
		}
	 
	//작성
	public void workinsert(WorkDTO workDTO) {
		try {
			workDAO.workinsert(workDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}
}
