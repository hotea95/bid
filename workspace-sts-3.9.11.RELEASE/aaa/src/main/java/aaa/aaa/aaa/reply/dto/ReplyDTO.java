package aaa.aaa.aaa.reply.dto;

import org.springframework.stereotype.Component;

@Component
public class ReplyDTO {

	private String  BNO;
	private String  RNO;
	private String  ID;
	private String  CONTENT;
	private String  PARENT_RNO;
	private String INDENTED_CONTENT;
	private int indentation;
	private String level;
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
	public String getPARENT_RNO() {
		return PARENT_RNO;
	}
	public void setPARENT_RNO(String pARENT_RNO) {
		PARENT_RNO = pARENT_RNO;
	}
	public String getINDENTED_CONTENT() {
		return INDENTED_CONTENT;
	}
	public void setINDENTED_CONTENT(String iNDENTED_CONTENT) {
		INDENTED_CONTENT = iNDENTED_CONTENT;
	}
	public int getIndentation() {
		return indentation;
	}
	public void setIndentation(int indentation) {
		this.indentation = indentation;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	@Override
	public String toString() {
		return "ReplyDTO [BNO=" + BNO + ", RNO=" + RNO + ", ID=" + ID + ", CONTENT=" + CONTENT + ", PARENT_RNO="
				+ PARENT_RNO + ", INDENTED_CONTENT=" + INDENTED_CONTENT + ", indentation=" + indentation + ", level="
				+ level + "]";
	}
	
}
