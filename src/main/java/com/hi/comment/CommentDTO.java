package com.hi.comment;

import java.sql.Date;

public class CommentDTO {
	private int comments_id;
	private int task_id;
	private String writer;
	private String contents;
	private Date reg_date;

	public int getComment_id() {
		return comments_id;
	}

	public void setComment_id(int comments_id) {
		this.comments_id = comments_id;
	}

	public int getTask_id() {
		return task_id;
	}

	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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
