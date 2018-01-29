package com.hi.task;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hi.comment.CommentDTO;
import com.hi.taskFile.TaskFileDTO;

@Service
public class TaskService {

	@Inject
	private TaskDAO taskDAO;

	public List<TaskDTO> list(int project_id) {
		return taskDAO.list(project_id);
	}

	public TaskDTO view(int task_id) {
		return taskDAO.view(task_id);
	}
	
	public int create(TaskDTO taskDTO) {
		return taskDAO.create(taskDTO);
	}
	
	public int update(TaskDTO taskDTO) {
		return taskDAO.update(taskDTO);
	}
	
	public int delete(int task_id) {
		return taskDAO.delete(task_id);
	}

	public List<TaskFileDTO> fileList(int task_id) {
		return taskDAO.fileList(task_id);
	}

	public int fileUpload(TaskFileDTO taskFileDTO) {
		return taskDAO.fileUpload(taskFileDTO);
	}

	public int fileDelete(int file_id) {
		return taskDAO.fileDelete(file_id);
	}

	public List<CommentDTO> commentList(int task_id) {
		return taskDAO.commentList(task_id);
	}

	public int commentWrite(CommentDTO commentDTO) {
		return taskDAO.commentWrite(commentDTO);
	}

	public int commentUpdate(CommentDTO commentDTO) {
		return taskDAO.commentUpdate(commentDTO);
	}

	public int commentDelete(int comment_id) {
		return taskDAO.commentDelete(comment_id);
	}

}
