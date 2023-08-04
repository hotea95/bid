package aaa.aaa.aaa.work.dto;

import org.springframework.stereotype.Component;

@Component
public class WorkDTO {

	private String WORKNAME;
	private String WORKJUMIN;
	private String WORKJUMIN2;
	private String WORKPRO;
	private String WORKPLA;
	private String WORKST;
	private String WORKEND;
	private String WORKSAL;
	private String WORKSCH;
	private String WORKDATE;
	private String WORKCLI;
	public String getWORKNAME() {
		return WORKNAME;
	}
	public void setWORKNAME(String wORKNAME) {
		WORKNAME = wORKNAME;
	}
	public String getWORKJUMIN() {
		return WORKJUMIN;
	}
	public void setWORKJUMIN(String wORKJUMIN) {
		WORKJUMIN = wORKJUMIN;
	}
	public String getWORKJUMIN2() {
		return WORKJUMIN2;
	}
	public void setWORKJUMIN2(String wORKJUMIN2) {
		WORKJUMIN2 = wORKJUMIN2;
	}
	public String getWORKPRO() {
		return WORKPRO;
	}
	public void setWORKPRO(String wORKPRO) {
		WORKPRO = wORKPRO;
	}
	public String getWORKPLA() {
		return WORKPLA;
	}
	public void setWORKPLA(String wORKPLA) {
		WORKPLA = wORKPLA;
	}
	public String getWORKST() {
		return WORKST;
	}
	public void setWORKST(String wORKST) {
		WORKST = wORKST;
	}
	public String getWORKEND() {
		return WORKEND;
	}
	public void setWORKEND(String wORKEND) {
		WORKEND = wORKEND;
	}
	public String getWORKSAL() {
		return WORKSAL;
	}
	public void setWORKSAL(String wORKSAL) {
		WORKSAL = wORKSAL;
	}
	public String getWORKSCH() {
		return WORKSCH;
	}
	public void setWORKSCH(String wORKSCH) {
		WORKSCH = wORKSCH;
	}
	public String getWORKDATE() {
		return WORKDATE;
	}
	public void setWORKDATE(String wORKDATE) {
		WORKDATE = wORKDATE;
	}
	public String getWORKCLI() {
		return WORKCLI;
	}
	public void setWORKCLI(String wORKCLI) {
		WORKCLI = wORKCLI;
	}
	@Override
	public String toString() {
		return "WorkDTO [WORKNAME=" + WORKNAME + ", WORKJUMIN=" + WORKJUMIN + ", WORKJUMIN2=" + WORKJUMIN2
				+ ", WORKPRO=" + WORKPRO + ", WORKPLA=" + WORKPLA + ", WORKST=" + WORKST + ", WORKEND=" + WORKEND
				+ ", WORKSAL=" + WORKSAL + ", WORKSCH=" + WORKSCH + ", WORKDATE=" + WORKDATE + ", WORKCLI=" + WORKCLI
				+ "]";
	}
	
}
