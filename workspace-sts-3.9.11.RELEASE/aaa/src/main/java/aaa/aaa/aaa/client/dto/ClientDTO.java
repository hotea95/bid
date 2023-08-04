package aaa.aaa.aaa.client.dto;

import org.springframework.stereotype.Component;

@Component
public class ClientDTO {

	private String CLINAME;
	private String CLIRE;
	private String CLIREP;
	private String CLIBU;
	private String CLIONE;
	private String CLIADD;
	private String CLINUM;
	private String CLIFAX;
	private String CLIPER;
	private String CLIPHONE;
	public String getCLINAME() {
		return CLINAME;
	}
	public void setCLINAME(String cLINAME) {
		CLINAME = cLINAME;
	}
	public String getCLIRE() {
		return CLIRE;
	}
	public void setCLIRE(String cLIRE) {
		CLIRE = cLIRE;
	}
	public String getCLIREP() {
		return CLIREP;
	}
	public void setCLIREP(String cLIREP) {
		CLIREP = cLIREP;
	}
	public String getCLIBU() {
		return CLIBU;
	}
	public void setCLIBU(String cLIBU) {
		CLIBU = cLIBU;
	}
	public String getCLIONE() {
		return CLIONE;
	}
	public void setCLIONE(String cLIONE) {
		CLIONE = cLIONE;
	}
	public String getCLIADD() {
		return CLIADD;
	}
	public void setCLIADD(String cLIADD) {
		CLIADD = cLIADD;
	}
	public String getCLINUM() {
		return CLINUM;
	}
	public void setCLINUM(String cLINUM) {
		CLINUM = cLINUM;
	}
	public String getCLIFAX() {
		return CLIFAX;
	}
	public void setCLIFAX(String cLIFAX) {
		CLIFAX = cLIFAX;
	}
	public String getCLIPER() {
		return CLIPER;
	}
	public void setCLIPER(String cLIPER) {
		CLIPER = cLIPER;
	}
	public String getCLIPHONE() {
		return CLIPHONE;
	}
	public void setCLIPHONE(String cLIPHONE) {
		CLIPHONE = cLIPHONE;
	}
	@Override
	public String toString() {
		return "ClientDTO [CLINAME=" + CLINAME + ", CLIRE=" + CLIRE + ", CLIREP=" + CLIREP + ", CLIBU=" + CLIBU
				+ ", CLIONE=" + CLIONE + ", CLIADD=" + CLIADD + ", CLINUM=" + CLINUM + ", CLIFAX=" + CLIFAX
				+ ", CLIPER=" + CLIPER + ", CLIPHONE=" + CLIPHONE + "]";
	}
	
}
