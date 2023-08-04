package aaa.aaa.aaa.work.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import aaa.aaa.aaa.career.dto.CareerDTO;
import aaa.aaa.aaa.work.dto.WorkDTO;

@Repository
public class WorkDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//전체조회
	public List<WorkDTO> workselectAll() {
		return sqlSessionTemplate.selectList("workselectAll");
	}
	
	//근무정보 상세조회
	public WorkDTO workselect(WorkDTO workDTO) {
		return sqlSessionTemplate.selectOne("workselect",workDTO);
	}
	
	//근무정보 상세조회22
		public WorkDTO workselect2(CareerDTO careerDTO) {
			return sqlSessionTemplate.selectOne("workselect2",careerDTO);
		}
	
	//수정
	public void workupdate(WorkDTO workDTO) {
		sqlSessionTemplate.update("workupdate",workDTO);
	}
	
	//작성
	public void workinsert(WorkDTO workDTO) {
		sqlSessionTemplate.insert("workinsert",workDTO);
	}
}
