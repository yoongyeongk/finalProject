package com.hi.saveboard;

import java.sql.Date;

public class TradeSaveDTO {
	private int save_num;
	private String writer;
	private String title;
	private String contents;
	private Date reg_date;
	

	public int getSave_num() {
		return save_num;
	}
	public void setSave_num(int save_num) {
		this.save_num = save_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
