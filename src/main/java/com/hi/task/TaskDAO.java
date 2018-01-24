package com.hi.task;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TaskDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "taskMapper.";

	public List<TaskDTO> list(int project_id) {
		return sqlSession.selectList(NAMESPACE + "list", project_id);
	}

}
