package aaa.aaa.aaa.member.dto;

import org.springframework.stereotype.Component;

@Component
public class CODEMDTO {

	private String CODE;
	private String CODENUM;
	private String CODEM;
	
	public String getCODE() {
		return CODE;
	}
	public void setCODE(String cODE) {
		CODE = cODE;
	}
	public String getCODENUM() {
		return CODENUM;
	}
	public void setCODENUM(String cODENUM) {
		CODENUM = cODENUM;
	}
	public String getCODEM() {
		return CODEM;
	}
	public void setCODEM(String cODEM) {
		CODEM = cODEM;
	}
	@Override
	public String toString() {
		return "CODEMDTO [CODE=" + CODE + ", CODENUM=" + CODENUM + ", CODEM=" + CODEM + "]";
	}
	
}
