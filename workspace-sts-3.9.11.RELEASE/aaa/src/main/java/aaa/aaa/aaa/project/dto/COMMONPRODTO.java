package aaa.aaa.aaa.project.dto;

import org.springframework.stereotype.Component;

@Component
public class COMMONPRODTO {

	private String PNO;
	private String STDATE;
	private String ENDDATE;
	private String PRONAME;
	public String getPNO() {
		
		return PNO;
	}
	public void setPNO(String pNO) {
		PNO = pNO;
	}
	public String getSTDATE() {
		return STDATE;
	}
	public void setSTDATE(String sTDATE) {
		STDATE = sTDATE;
	}
	public String getENDDATE() {
		return ENDDATE;
	}
	public void setENDDATE(String eNDDATE) {
		ENDDATE = eNDDATE;
	}
	public String getPRONAME() {
		return PRONAME;
	}
	public void setPRONAME(String pRONAME) {
		PRONAME = pRONAME;
	}
	@Override
	public String toString() {
		return "COMMONPRODTO [PNO=" + PNO + ", STDATE=" + STDATE + ", ENDDATE=" + ENDDATE + ", PRONAME=" + PRONAME
				+ "]";
	}
	
	
}
