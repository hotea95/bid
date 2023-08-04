package aaa.aaa.aaa.member.dto;

import org.springframework.stereotype.Component;

@Component
public class CODEDTO {

	private String CODE;
	private String CODENAME;
	public String getCODE() {
		return CODE;
	}
	public void setCODE(String cODE) {
		CODE = cODE;
	}
	public String getCODENAME() {
		return CODENAME;
	}
	public void setCODENAME(String cODENAME) {
		CODENAME = cODENAME;
	}
	@Override
	public String toString() {
		return "CODEDTO [CODE=" + CODE + ", CODENAME=" + CODENAME + "]";
	}
	
}
