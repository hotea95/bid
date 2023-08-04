package aaa.aaa.aaa.client.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import aaa.aaa.aaa.client.dao.ClientDAO;
import aaa.aaa.aaa.client.dto.ClientDTO;
import aaa.aaa.aaa.member.dto.Criteria;
import aaa.aaa.aaa.member.dto.MemberDTO;
import aaa.aaa.aaa.member.dto.SearchCriteria;

@Service
public class ClientService {

	@Autowired
	private ClientDAO clientDAO;
	
	//전체조회
	public List<ClientDTO> clientselectAll() {
		return clientDAO.clientselectAll();
	}
	
	//상세조회
	public ClientDTO clientselect(String CLINAME) {
		return clientDAO.clientselect(CLINAME);
	}
	
	//수정
	public void clientupdate(ClientDTO clientDTO) {
		clientDAO.clientupdate(clientDTO);
	}
	
	//삭제
	public void clientdelete(String CLINAME) {
		clientDAO.clientdelete(CLINAME);
	}
	
	//작성
	public void clientinsert(ClientDTO clientDTO) {
		try {
			clientDAO.clientinsert(clientDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}
	//페이징
	public List<ClientDTO> listPage(Criteria cri) throws Exception {
		return clientDAO.listPage(cri);
	}
	
	public int listCount() throws Exception {
		return clientDAO.listCount();
	}
	
	//검색
		public List<ClientDTO> listSearch(SearchCriteria scri) throws Exception {
			return clientDAO.listSearch(scri);
		}
		
		public int countSearch(SearchCriteria scri) throws Exception {
			return clientDAO.countSearch(scri);
		}
		
}
