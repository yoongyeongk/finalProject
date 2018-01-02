package com.hi.users;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UsersDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE = "usersMapper.";

	public int join(UsersDTO usersDTO) {
		return sqlSession.insert(NAMESPACE + "join", usersDTO);
	}

}
