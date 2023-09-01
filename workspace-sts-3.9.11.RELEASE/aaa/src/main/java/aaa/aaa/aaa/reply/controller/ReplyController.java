package aaa.aaa.aaa.reply.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import aaa.aaa.aaa.reply.dto.ReplyDTO;
import aaa.aaa.aaa.reply.service.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	//댓글작성
	@RequestMapping(value = "/ReplyInsert", method = RequestMethod.POST)
		public String replyinsert(ReplyDTO replyDTO,Model model,String BNO) {
			
		String LEVEL = null;
			
			if (replyDTO.getPARENT_RNO() =="") {
				replyDTO.setPARENT_RNO("0");
			}
			
			model.addAttribute("level",LEVEL);
			replyService.replyinsert(replyDTO);
			System.out.println("BNO값"+BNO); 
		/* return "./reply/reply_insert_view"; */
			return "redirect:/BoardSelect?BNO="+(BNO);
		}
		
	//댓글 조회
//	@RequestMapping(value = "/Replyselectall", method = RequestMethod.GET)
//		public String list(@RequestParam("BNO") String BNO,Model model) {
//			model.addAttribute("list",replyService.replyselectall(BNO));
//			return "./reply/reply_select_all";
//		}
	
	//댓글 조회
	@RequestMapping(value = "/Replyselectall", method = RequestMethod.GET)
	public String list(@RequestParam("BNO") String BNO, Model model, ReplyDTO reply) {
	    List<ReplyDTO> replyList = replyService.replyselectall(BNO);
	    List<String> indentedContentList = generateIndentedContents(replyList);
	    model.addAttribute("list", indentedContentList);
	    System.out.println(reply.getLevel());
	    return "./reply/reply_select_all";
	}


	
	//댓글 상세조회
	@RequestMapping(value = "/Replyselect", method = RequestMethod.GET)
	public String replyselect(@RequestParam("BNO") String BNO,Model model,ReplyDTO replyDTO) {
		model.addAttribute("list",replyService.replyselect(replyDTO, BNO));
		System.out.println("컨트롤러 댓글 값 " + BNO);
		System.out.println("컨트롤러 댓글 값 " + BNO);
		System.out.println("컨트롤러 댓글 값 " + BNO);
		return "./reply/reply_select";
	}
	
//	//댓글 상세조회
//	@RequestMapping(value = "/Replyselect", method = RequestMethod.GET)
//	public String replyselect(@RequestParam("BNO") String BNO, Model model, ReplyDTO replyDTO) {
//	    List<ReplyDTO> replyList = (List<ReplyDTO>) replyService.replyselect(replyDTO, BNO);
//	    List<String> indentedContentList = generateIndentedContents(replyList);
//
//	    model.addAttribute("list", indentedContentList);
//	    System.out.println("컨트롤러 댓글 값 " + BNO);
//	    System.out.println("컨트롤러 댓글 값 " + BNO);
//	    System.out.println("컨트롤러 댓글 값 " + BNO);
//
//	    return "./reply/reply_select";
//	}

	private List<String> generateIndentedContents(List<ReplyDTO> replyList) {
		   List<String> indentedContents = new ArrayList<>();

		   for (ReplyDTO reply : replyList) {
		       String content = generateIndentedContent(reply.getIndentation(), reply.getCONTENT());
		       indentedContents.add(content);
		   }

		  return indentedContents;
		}

		private String generateIndentedContent(int indentation, String CONTETN) {
		  final int INDENT_SIZE = 2; // 들여쓰기 크기 (2칸)

		  StringBuilder sb = new StringBuilder();

		  for (int i = 0; i < indentation; i++) {
		      for (int j = 0; j < INDENT_SIZE; j++) {
		          sb.append(" "); // 공백으로 들여쓰기
		      }
		  }

		  sb.append(CONTETN); // 내용 추가

		  return sb.toString();
		}

}
