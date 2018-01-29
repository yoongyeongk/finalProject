package com.hi.task;

import java.sql.Date;
import java.util.List;

import com.hi.comment.CommentDTO;
import com.hi.file.FileDTO;

public class TaskDTO {
	private int task_id;
	private int project_id;
	private String title;
	private Date start_date;
	private Date close_date;
	private String status;
	private List<CommentDTO> comment;
	private List<FileDTO> filename;

	public int getTask_id() {
		return task_id;
	}

	public void setTask_id(int task_id) {
		this.task_id = task_id;
	}

	public int getProject_id() {
		return project_id;
	}

	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getClose_date() {
		return close_date;
	}

	public void setClose_date(Date close_date) {
		this.close_date = close_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<CommentDTO> getComment() {
		return comment;
	}

	public void setComment(List<CommentDTO> comment) {
		this.comment = comment;
	}

	public List<FileDTO> getFilename() {
		return filename;
	}

	public void setFilename(List<FileDTO> filename) {
		this.filename = filename;
	}

}
