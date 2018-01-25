package com.hi.tender;

public class TenderDTO {

	private int num;
	private String writer;
	private String name;
	private String corporate_phone;
	private String corporation;
	private int bidding_price;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCorporate_phone() {
		return corporate_phone;
	}
	public void setCorporate_phone(String corporate_phone) {
		this.corporate_phone = corporate_phone;
	}
	public String getCorporation() {
		return corporation;
	}
	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}
	public int getBidding_price() {
		return bidding_price;
	}
	public void setBidding_price(int bidding_price) {
		this.bidding_price = bidding_price;
	}
	
	
}
