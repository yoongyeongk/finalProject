package com.hi.trade;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.hi.boardFile.FileDTO;
import com.hi.tag.TagDTO;

public class TradeBoardDTO {

	private int num;
	private String writer;
	private String title;
	private String contents;
	private Date reg_date;
	private Date closing_date;
	private int hit;
	private String corporate_phone;
	private int min_price;
	private String [] tag;
	private List<TagDTO> tags;
	private MultipartFile [] img;
	private List<FileDTO> fileNames;
	private String corporation; 
	
	

	public String getCorporation() {
		return corporation;
	}
	public void setCorporation(String corporation) {
		this.corporation = corporation;
	}
	public List<TagDTO> getTags() {
		return tags;
	}
	public void setTags(List<TagDTO> tags) {
		this.tags = tags;
	}
	public List<FileDTO> getFileNames() {
		return fileNames;
	}
	public void setFileNames(List<FileDTO> fileNames) {
		this.fileNames = fileNames;
	}
	public MultipartFile[] getImg() {
		return img;
	}
	public void setImg(MultipartFile[] img) {
		this.img = img;
	}
	
	public String[] getTag() {
		return tag;
	}
	public void setTag(String[] tag) {
		this.tag = tag;
	}
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
	public Date getClosing_date() {
		return closing_date;
	}
	public void setClosing_date(Date closing_date) {
		this.closing_date = closing_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getCorporate_phone() {
		return corporate_phone;
	}
	public void setCorporate_phone(String corporate_phone) {
		this.corporate_phone = corporate_phone;
	}
	public int getMin_price() {
		return min_price;
	}
	public void setMin_price(int min_price) {
		this.min_price = min_price;
	}
	
	
}
