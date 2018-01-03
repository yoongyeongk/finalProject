package com.hi.users;

import java.util.HashMap;
import java.util.Map;

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

	public UsersDTO login(String username, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("password", password);
		return sqlSession.selectOne(NAMESPACE + "login", map);
	}

	public int update(UsersDTO usersDTO) {
		return sqlSession.update(NAMESPACE + "update", usersDTO);
	}

	public int delete(String username) {
		return sqlSession.delete(NAMESPACE + "delete", username);
	}

	public int insert(ProfileImgDTO imgDTO) {
		return sqlSession.insert(NAMESPACE + "insertImg", imgDTO);
	}

}
