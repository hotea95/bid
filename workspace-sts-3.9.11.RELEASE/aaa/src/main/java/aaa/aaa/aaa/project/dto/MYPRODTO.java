package aaa.aaa.aaa.project.dto;

import org.springframework.stereotype.Component;

@Component
public class MYPRODTO {

	private String NO;
	private String PNO;
	private String STMDATE;
	private String ENDMDATE;
	private String ROLE;
	private String PRONAME;
	public String getNO() {
		return NO;
	}
	public void setNO(String nO) {
		NO = nO;
	}
	public String getPNO() {
		return PNO;
	}
	public void setPNO(String pNO) {
		PNO = pNO;
	}
	public String getSTMDATE() {
		return STMDATE;
	}
	public void setSTMDATE(String sTMDATE) {
		STMDATE = sTMDATE;
	}
	public String getENDMDATE() {
		return ENDMDATE;
	}
	public void setENDMDATE(String eNDMDATE) {
		ENDMDATE = eNDMDATE;
	}
	public String getROLE() {
		return ROLE;
	}
	public void setROLE(String rOLE) {
		ROLE = rOLE;
	}
	public String getPRONAME() {
		return PRONAME;
	}
	public void setPRONAME(String pRONAME) {
		PRONAME = pRONAME;
	}
	@Override
	public String toString() {
		return "MYPRODTO [NO=" + NO + ", PNO=" + PNO + ", STMDATE=" + STMDATE + ", ENDMDATE=" + ENDMDATE + ", ROLE="
				+ ROLE + ", PRONAME=" + PRONAME + "]";
	}

}
