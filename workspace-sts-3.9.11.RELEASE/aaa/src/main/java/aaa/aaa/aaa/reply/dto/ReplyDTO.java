package aaa.aaa.aaa.reply.dto;

import org.springframework.stereotype.Component;

@Component
public class ReplyDTO {

	private String  BNO;
	private String  RNO;
	private String  ID;
	private String  CONTENT;
	private String  RE_LEVEL;
	public String getBNO() {
		return BNO;
	}
	public void setBNO(String bNO) {
		BNO = bNO;
	}
	public String getRNO() {
		return RNO;
	}
	public void setRNO(String rNO) {
		RNO = rNO;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getRE_LEVEL() {
		return RE_LEVEL;
	}
	public void setRE_LEVEL(String rE_LEVEL) {
		RE_LEVEL = rE_LEVEL;
	}
	@Override
	public String toString() {
		return "ReplyDTO [BNO=" + BNO + ", RNO=" + RNO + ", ID=" + ID + ", CONTENT=" + CONTENT + ", RE_LEVEL="
				+ RE_LEVEL + "]";
	}
	
}
