package aaa.aaa.aaa.board.dto;

import org.springframework.stereotype.Component;

@Component
public class MenuDTO {

	private String MENUNO;
	private String MENUNM;
	private String MENUURL;
	private String AUTONO;
	public String getMENUNO() {
		return MENUNO;
	}
	public void setMENUNO(String mENUNO) {
		MENUNO = mENUNO;
	}
	public String getMENUNM() {
		return MENUNM;
	}
	public void setMENUNM(String mENUNM) {
		MENUNM = mENUNM;
	}
	public String getMENUURL() {
		return MENUURL;
	}
	public void setMENUURL(String mENUURL) {
		MENUURL = mENUURL;
	}
	public String getAUTONO() {
		return AUTONO;
	}
	public void setAUTONO(String aUTONO) {
		AUTONO = aUTONO;
	}
	@Override
	public String toString() {
		return "MenuDTO [MENUNO=" + MENUNO + ", MENUNM=" + MENUNM + ", MENUURL=" + MENUURL + ", AUTONO=" + AUTONO + "]";
	}
	
}
