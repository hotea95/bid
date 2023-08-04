package aaa.aaa.aaa.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import aaa.aaa.aaa.dto.AaaDTO;

@Repository
public class AaaDAO {

	@Autowired
	
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<AaaDTO> selectAll( ) {
		return sqlSessionTemplate.selectList("selectAll");
		}
}
