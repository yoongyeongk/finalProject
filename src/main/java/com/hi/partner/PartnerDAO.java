package com.hi.partner;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hi.partner.PartnerDTO;

@Repository
public class PartnerDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NAMESPACE="partnerMapper.";
	
	public int partnerinsert(PartnerDTO partnerDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"partnerInsert", partnerDTO);
	}
	
}
