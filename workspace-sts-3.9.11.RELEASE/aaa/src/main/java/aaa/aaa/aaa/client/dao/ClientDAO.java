package aaa.aaa.aaa.client.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import aaa.aaa.aaa.client.dto.ClientDTO;
import aaa.aaa.aaa.member.dto.Criteria;
import aaa.aaa.aaa.member.dto.MemberDTO;
import aaa.aaa.aaa.member.dto.SearchCriteria;

@Repository
public class ClientDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//전체조회
	public List<ClientDTO> clientselectAll() {
		return sqlSessionTemplate.selectList("clientselectAll");
	}

	//상세조회
	public ClientDTO clientselect(String CLINAME) {
		return sqlSessionTemplate.selectOne("clientselect",CLINAME);
	}
	
	//수정
	public void clientupdate(ClientDTO clientDTO) {
		sqlSessionTemplate.update("clientupdate",clientDTO);
	}
	
	//삭제
	public void clientdelete(String CLINAME) {
		sqlSessionTemplate.delete("clientdelete",CLINAME);
	}
	
	//작성
	public void clientinsert(ClientDTO clientDTO) {
		sqlSessionTemplate.insert("clientinsert", clientDTO);
	}
	
	//페이징
	public List<ClientDTO> listPage(Criteria cri) throws Exception {
		return sqlSessionTemplate.selectList("clilistpage",cri);
	}
	
	//게시물 총갯수
		public int listCount() throws Exception {
			return sqlSessionTemplate.selectOne("clilistCount");
		}
		
		//검색
		public List<ClientDTO> listSearch(SearchCriteria scri) throws Exception{
			return sqlSessionTemplate.selectList("clilistSearch",scri);
		}
		
		
		public int countSearch(SearchCriteria scri) throws Exception {
			return sqlSessionTemplate.selectOne("countSearch2",scri);
		}
}
