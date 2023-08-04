package aaa.aaa.aaa.dto;

import org.springframework.stereotype.Component;
@Component
public class AaaDTO {

	
	private String aaa;
	private String bbb;
	public String getAaa() {
		return aaa;
	}
	public void setAaa(String aaa) {
		this.aaa = aaa;
	}
	public String getBbb() {
		return bbb;
	}
	public void setBbb(String bbb) {
		this.bbb = bbb;
	}
	@Override
	public String toString() {
		return "aaaDTO [aaa=" + aaa + ", bbb=" + bbb + "]";
	}
	
}
