package aaa.aaa.aaa.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import aaa.aaa.aaa.reply.dao.ReplyDAO;
import aaa.aaa.aaa.reply.dto.ReplyDTO;

@Service
public class ReplyService {

	@Autowired
	private ReplyDAO replyDAO;
	
	//댓글작성
	public void replyinsert(ReplyDTO replyDTO) {
		replyDAO.replyinsert(replyDTO);
	}
	
	//댓글조회
	public List<ReplyDTO> replyselectall(String BNO) {
		return replyDAO.replyselectall(BNO);
	}
	
	//댓글상세보기
	public ReplyDTO replyselect(ReplyDTO replyDTO,String BNO) {
		return replyDAO.replyselect(replyDTO, BNO);
	}
}
