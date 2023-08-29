package aaa.aaa.aaa.board.dto;

import org.springframework.stereotype.Component;

@Component
public class BoardDTO {

	private String BNO;
	private String TITLE;
	private String CONTENT;
	private String WRITER;
	private String REG_DATETIME;
	public String getBNO() {
		return BNO;
	}
	public void setBNO(String bNO) {
		BNO = bNO;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getWRITER() {
		return WRITER;
	}
	public void setWRITER(String wRITER) {
		WRITER = wRITER;
	}
	public String getREG_DATETIME() {
		return REG_DATETIME;
	}
	public void setREG_DATETIME(String rEG_DATETIME) {
		REG_DATETIME = rEG_DATETIME;
	}
	@Override
	public String toString() {
		return "BoardDTO [BNO=" + BNO + ", TITLE=" + TITLE + ", CONTENT=" + CONTENT + ", WRITER=" + WRITER
				+ ", REG_DATETIME=" + REG_DATETIME + "]";
	}
	
}
