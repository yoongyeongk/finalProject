package com.hi.comment;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class CommentService {

	@Inject
	private CommentDAO commentDAO;

	public List<CommentDTO> list(int task_id) {
		return commentDAO.list(task_id);
	}

	public int insert(CommentDTO commentDTO) {
		return commentDAO.insert(commentDTO);
	}

	public int update(CommentDTO commentDTO) {
		return commentDAO.update(commentDTO);
	}

	public int delete(int comment_id) {
		return commentDAO.delete(comment_id);
	}

}
