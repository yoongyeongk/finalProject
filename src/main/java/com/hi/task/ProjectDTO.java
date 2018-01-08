package com.hi.task;

import java.sql.Date;
import java.util.List;

import com.hi.users.UsersDTO;

public class ProjectDTO {
	private int project_id;
	private String title;
	private String privacy;
	private String status;
	private String star;
	private Date start_date;
	private Date close_date;
	private UsersDTO manager;
	private List<UsersDTO> members;

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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getPrivacy() {
		return privacy;
	}

	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}

	public UsersDTO getManager() {
		return manager;
	}

	public void setManager(UsersDTO manager) {
		this.manager = manager;
	}

	public List<UsersDTO> getMembers() {
		return members;
	}

	public void setMembers(List<UsersDTO> members) {
		this.members = members;
	}

}
