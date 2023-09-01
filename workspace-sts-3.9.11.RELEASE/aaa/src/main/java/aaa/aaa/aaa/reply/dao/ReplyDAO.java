package aaa.aaa.aaa.reply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import aaa.aaa.aaa.reply.dto.ReplyDTO;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//댓글작성
	public void replyinsert(ReplyDTO replyDTO) {
		sqlSessionTemplate.insert("replyinsert", replyDTO);
	}
	
	//댓글조회
	public List<ReplyDTO> replyselectall(String BNO) {
		return sqlSessionTemplate.selectList("replyselectall",BNO);
	}
	
	//댓글 상세조회
	public ReplyDTO replyselect(ReplyDTO replyDTO,String BNO) {
		return sqlSessionTemplate.selectOne("replyselect", BNO);
	}
}
