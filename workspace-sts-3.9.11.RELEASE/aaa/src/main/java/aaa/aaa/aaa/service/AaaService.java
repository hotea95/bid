package aaa.aaa.aaa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import aaa.aaa.aaa.dao.AaaDAO;
import aaa.aaa.aaa.dto.AaaDTO;

@Service
public class AaaService {

	@Autowired
	private AaaDAO aaaDAO;
	
	public List<AaaDTO> aaaSelectAll( ) {
		return aaaDAO.selectAll( );
		}

}
