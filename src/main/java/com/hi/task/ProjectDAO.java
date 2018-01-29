package com.hi.task;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.users.UsersDTO;

@Repository
public class ProjectDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "projectMapper.";

	public List<ProjectDTO> list(UsersDTO usersDTO) {
		return sqlSession.selectList(NAMESPACE + "list", usersDTO);
	}

	public ProjectDTO setting(int project_id) {
		return sqlSession.selectOne(NAMESPACE + "setting", project_id);
	}

	public int create(ProjectDTO projectDTO) {
		return sqlSession.insert(NAMESPACE + "create", projectDTO);
	}

	public int insert(Map<String, Object> map) {
		return sqlSession.insert(NAMESPACE + "insert", map);
	}

	public int update(ProjectDTO projectDTO) {
		return sqlSession.update(NAMESPACE + "update", projectDTO);
	}

	public int delete(int project_id) {
		return sqlSession.delete(NAMESPACE + "delete", project_id);
	}
}
