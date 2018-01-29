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

	public int idCheck(String username) {
		return sqlSession.selectOne(NAMESPACE + "idCheck", username);
	}

	public UsersDTO login(UsersDTO usersDTO) {
		return sqlSession.selectOne(NAMESPACE + "login", usersDTO);
	}

	public UsersDTO selectOne(String username) {
		return sqlSession.selectOne(NAMESPACE + "selectOne", username);
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
	//서연 추가 
	public String nicknameCheck(String nickname){
		System.out.println("DAO ID : "+nickname);
		return sqlSession.selectOne(NAMESPACE+"nicknameCheck", nickname);
	}

}
