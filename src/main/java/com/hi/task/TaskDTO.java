package com.hi.task;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.hi.checklist.ChecklistDTO;
import com.hi.comment.CommentDTO;
import com.hi.file.FileDTO;
import com.hi.users.UsersDTO;

public class TaskDTO {
	private int task_id;
	private int project_id;
	private String title;
	private String contents;
	private List<ChecklistDTO> checklist;
	private Date start_date;
	private Date close_date;
	private String tag;
	private int point;
	private List<UsersDTO> members;
	private List<UsersDTO> followers;
	private List<CommentDTO> comment;
	private MultipartFile[] files;
	private List<FileDTO> filenames;

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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public List<ChecklistDTO> getChecklist() {
		return checklist;
	}

	public void setChecklist(List<ChecklistDTO> checklist) {
		this.checklist = checklist;
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

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public List<UsersDTO> getMembers() {
		return members;
	}

	public void setMembers(List<UsersDTO> members) {
		this.members = members;
	}

	public List<UsersDTO> getFollowers() {
		return followers;
	}

	public void setFollowers(List<UsersDTO> followers) {
		this.followers = followers;
	}

	public List<CommentDTO> getComment() {
		return comment;
	}

	public void setComment(List<CommentDTO> comment) {
		this.comment = comment;
	}

	public MultipartFile[] getFiles() {
		return files;
	}

	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}

	public List<FileDTO> getFilenames() {
		return filenames;
	}

	public void setFilenames(List<FileDTO> filenames) {
		this.filenames = filenames;
	}

}
