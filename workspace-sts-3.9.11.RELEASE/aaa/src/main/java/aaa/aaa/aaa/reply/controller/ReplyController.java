package aaa.aaa.aaa.reply.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import aaa.aaa.aaa.reply.service.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;
}
