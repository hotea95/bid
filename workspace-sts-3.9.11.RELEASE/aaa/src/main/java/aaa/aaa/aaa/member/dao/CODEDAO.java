package aaa.aaa.aaa.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import aaa.aaa.aaa.member.dto.CODEMDTO;
import aaa.aaa.aaa.member.service.CODEService;

@Repository
public class CODEDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(CODEDAO.class);
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

//	public CODEMDTO getCodeVal (String CODE) {
//		logger.info(CODE);
//		return sqlSessionTemplate.selectOne("code",CODE);
//	}
	
	public List<CODEMDTO> getCodeVal (String CODE) {
		logger.info(CODE);
		return sqlSessionTemplate.selectList("code",CODE);
	}
}
