package com.hi.comment;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "commentMapper.";

	public List<CommentDTO> list(int task_id) {
		return sqlSession.selectList(NAMESPACE + "list", task_id);
	}

	public int insert(CommentDTO commentDTO) {
		return sqlSession.insert(NAMESPACE + "insert", commentDTO);
	}

	public int update(CommentDTO commentDTO) {
		return sqlSession.update(NAMESPACE + "update", commentDTO);
	}

	public int delete(int comment_id) {
		return sqlSession.delete(NAMESPACE + "delete", comment_id);
	}
}
