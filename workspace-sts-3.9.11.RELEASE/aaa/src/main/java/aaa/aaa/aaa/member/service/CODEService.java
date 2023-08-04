package aaa.aaa.aaa.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import aaa.aaa.aaa.member.controller.CODEController;
import aaa.aaa.aaa.member.dao.CODEDAO;
import aaa.aaa.aaa.member.dao.CODEmapper;
import aaa.aaa.aaa.member.dto.CODEMDTO;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CODEService {
	private static final Logger logger = LoggerFactory.getLogger(CODEService.class);
	private CODEmapper mapper;
	
	@Autowired
	private CODEDAO codedao;
	

	public List<CODEMDTO> getCodeVal(String CODE) {
		logger.info(CODE);
		return codedao.getCodeVal(CODE);
	}
	
//	public CODEMDTO getCodeVal(String CODE) {
//		logger.info(CODE);
//		return codedao.getCodeVal(CODE);
//	}
}
