package com.hi.task;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.comment.CommentDTO;

@Repository
public class TaskDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "taskMapper.";

	public List<TaskDTO> list(int project_id) {
		return sqlSession.selectList(NAMESPACE + "list", project_id);
	}

	public TaskDTO view(int task_id) {
		return sqlSession.selectOne(NAMESPACE + "view", task_id);
	}
	
	public int create(TaskDTO taskDTO) {
		return sqlSession.insert(NAMESPACE+"create", taskDTO);
	}
	
	public int update(TaskDTO taskDTO) {
		return sqlSession.update(NAMESPACE + "update", taskDTO);
	}
	
	public int delete(int task_id) {
		return sqlSession.delete(NAMESPACE+"delete", task_id);
	}

	public int fileDelete(int file_id) {
		return sqlSession.delete(NAMESPACE + "fileDelete", file_id);
	}

	public List<CommentDTO> commentList(int task_id) {
		return sqlSession.selectList(NAMESPACE + "commentList", task_id);
	}

	public int commentWrite(CommentDTO commentDTO) {
		return sqlSession.insert(NAMESPACE + "commentWrite", commentDTO);
	}

	public int commentUpdate(CommentDTO commentDTO) {
		return sqlSession.update(NAMESPACE + "commentUpdate", commentDTO);
	}

	public int commentDelete(int comment_id) {
		return sqlSession.delete(NAMESPACE + "commentDelete", comment_id);
	}

}
