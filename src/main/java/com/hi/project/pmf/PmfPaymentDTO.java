package com.hi.project.pmf;

public class PmfPaymentDTO {

	private int pnum;
	private int num;
	private String pay_kind;
	private int pay_value;
	
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPay_kind() {
		return pay_kind;
	}
	public void setPay_kind(String pay_kind) {
		this.pay_kind = pay_kind;
	}
	public int getPay_value() {
		return pay_value;
	}
	public void setPay_value(int pay_value) {
		this.pay_value = pay_value;
	}
	
}
