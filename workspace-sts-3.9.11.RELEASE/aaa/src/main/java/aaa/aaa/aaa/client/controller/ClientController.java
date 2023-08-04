package aaa.aaa.aaa.client.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import aaa.aaa.aaa.client.dto.ClientDTO;
import aaa.aaa.aaa.client.service.ClientService;
import aaa.aaa.aaa.member.dto.Criteria;
import aaa.aaa.aaa.member.dto.MemberDTO;
import aaa.aaa.aaa.member.dto.PageMaker;
import aaa.aaa.aaa.member.dto.SearchCriteria;

@Controller
public class ClientController {

	@Autowired
	private ClientService clientService;
	
	@RequestMapping(value = "/ClientSelectAll", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("list",clientService.clientselectAll());
		return "./client/client_select_all_view";
	}
	@RequestMapping(value = "/ClientSelect", method = RequestMethod.GET)
	public String clientselectdetail(Model model, ClientDTO clientDTO) {
		model.addAttribute("clientDTO",clientService.clientselect(clientDTO.getCLINAME()));
		return "./client/client_select_view";
	}
	
	//수정하기
	@RequestMapping(value = "/ClientUpdate", method = RequestMethod.GET)
	public String clientupdate(Model model, ClientDTO clientDTO) {
		model.addAttribute("clientDTO",clientService.clientselect(clientDTO.getCLINAME()));
		//model.addAttribute("clientDTO",clientService.clientselectAll());
		return "./client/client_update";
	}
	@RequestMapping(value = "/ClientUpdate", method = RequestMethod.POST)
	public String clientupdate(ClientDTO clientDTO) {
		clientService.clientupdate(clientDTO);
		return "./client/client_update_view";
	}
	
	//삭제하기
	@RequestMapping(value = "/ClientDelete", method = RequestMethod.GET)
	public String clientdelete() {
		return "./client/client_delete";
	}
	@RequestMapping(value = "/ClientDelete", method = RequestMethod.POST)
	public String clientdelete(ClientDTO clientDTO) {
		clientService.clientdelete(clientDTO.getCLINAME());
		return "./client/client_delete_view";
	}
	
	//작성하기
	@RequestMapping(value = "/ClientInsert", method = RequestMethod.GET)
	public String clientinsert() {
		return "./client/client_insert";
	}
	@RequestMapping(value = "/ClientInsert", method = RequestMethod.POST)
	public String clientinsert(Model model, ClientDTO clientDTO) {
		model.addAttribute("list",clientService.clientselectAll());
		clientService.clientinsert(clientDTO);
		return "./client/client_insert_view"; 
	}
	
	//전체조회 페이징
	@RequestMapping(value = "/ClilistPage", method = RequestMethod.GET)
	public String listPage(Criteria cri, Model model) throws Exception {
		List<ClientDTO> list = clientService.listPage(cri);
		model.addAttribute("list", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(clientService.listCount());
		model.addAttribute("pageMaker", pageMaker);

		return "./client/listPage";
	}
	
	// 글 목록 + 페이징 + 검색
	@RequestMapping(value = "/ClilistSearch", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
	   
	   List<ClientDTO> list = clientService.listSearch(scri);
	   model.addAttribute("list", list);
	   
	   PageMaker pageMaker = new PageMaker();
	   pageMaker.setCri(scri);
	   //pageMaker.setTotalCount(service.listCount());
	   pageMaker.setTotalCount(clientService.countSearch(scri));
	   model.addAttribute("pageMaker", pageMaker);
	   
	   return "./client/listSearch";
	}
}
