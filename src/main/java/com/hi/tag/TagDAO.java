package com.hi.tag;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.trade.TradeBoardDTO;

@Repository
public class TagDAO {

	@Inject
	SqlSession sqlSession;
	private static String NAMESPACE  = "tagMapper.";
	
	public int insert (TagDTO tagDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"insert", tagDTO);
	}
<<<<<<< HEAD
=======
	
	public int delete (int num) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"delete",num);
	}
>>>>>>> dc18a591be59a68baccbc32bfcf30b5ac1e94976
}
