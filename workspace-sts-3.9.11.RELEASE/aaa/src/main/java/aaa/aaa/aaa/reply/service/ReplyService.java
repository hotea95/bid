package aaa.aaa.aaa.reply.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import aaa.aaa.aaa.reply.dao.ReplyDAO;

@Service
public class ReplyService {

	@Autowired
	private ReplyDAO replyDAO;
}
