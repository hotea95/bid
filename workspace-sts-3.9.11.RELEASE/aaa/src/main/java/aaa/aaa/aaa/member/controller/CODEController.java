package aaa.aaa.aaa.member.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import aaa.aaa.aaa.member.dto.CODEMDTO;
import aaa.aaa.aaa.member.service.CODEService;

@Controller
@RequestMapping(value = "/code")
public class CODEController {

	private static final Logger logger = LoggerFactory.getLogger(CODEController.class);
	@Autowired
	private CODEService comeService;
	
	@ResponseBody
	@RequestMapping(value = "/codeVal", produces = "application/json", method = RequestMethod.GET)
	public List<CODEMDTO> getCodeVal(@RequestParam String codeVal) {
		logger.info(codeVal);

		List<CODEMDTO> codes = comeService.getCodeVal(codeVal);
		logger.info("가져온값=========="+codes);
		return codes;
	}
}
