package bbb.bbb.bbb.dto;

import org.springframework.stereotype.Component;

import oracle.sql.DATE;

@Component
public class DTO {

	private Integer expense_no;
	private String name;
	private String use_date;
	private String use_price;
	private String approve_price;
	private String process_status;
	private String registration_date;
	private String receipt;
	private String process_date;
	private String remark;
	public Integer getExpense_no() {
		return expense_no;
	}
	public void setExpense_no(Integer expense_no) {
		this.expense_no = expense_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUse_date() {
		return use_date;
	}
	public void setUse_date(String use_date) {
		this.use_date = use_date;
	}
	public String getUse_price() {
		return use_price;
	}
	public void setUse_price(String use_price) {
		this.use_price = use_price;
	}
	public String getApprove_price() {
		return approve_price;
	}
	public void setApprove_price(String approve_price) {
		this.approve_price = approve_price;
	}
	public String getProcess_status() {
		return process_status;
	}
	public void setProcess_status(String process_status) {
		this.process_status = process_status;
	}
	public String getRegistration_date() {
		return registration_date;
	}
	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
	}
	public String getReceipt() {
		return receipt;
	}
	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}
	public String getProcess_date() {
		return process_date;
	}
	public void setProcess_date(String process_date) {
		this.process_date = process_date;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "DTO [expense_no=" + expense_no + ", name=" + name + ", use_date=" + use_date + ", use_price="
				+ use_price + ", approve_price=" + approve_price + ", process_status=" + process_status
				+ ", registration_date=" + registration_date + ", receipt=" + receipt + ", process_date=" + process_date
				+ ", remark=" + remark + "]";
	}

}
