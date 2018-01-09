package com.hi.task;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.users.UsersDTO;

@Repository
public class ProjectDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "projectMapper.";

	public List<ProjectDTO> list() {
		return sqlSession.selectList(NAMESPACE + "list");
	}

	public String member(UsersDTO usersDTO) {
		return sqlSession.selectOne(NAMESPACE + "manager", usersDTO);
	}

	public int create(ProjectDTO projectDTO) {
		return sqlSession.insert(NAMESPACE + "create", projectDTO);
	}
}
