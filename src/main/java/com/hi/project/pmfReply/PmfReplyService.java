package com.hi.project.pmfReply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PmfReplyService {

	@Inject
	private PmfReplyDAO pmfReplyDAO;
	
	public List<PmfReplyDTO> selectList(int num) throws Exception {
		return pmfReplyDAO.selectList(num);
	}
	
	public int insert(PmfReplyDTO pmfReplyDTO) throws Exception {
		return pmfReplyDAO.insert(pmfReplyDTO);
	}
	
	public int update(PmfReplyDTO pmfReplyDTO) throws Exception {
		return pmfReplyDAO.update(pmfReplyDTO);
	}
	
	public int delete(int rnum) throws Exception {
		return pmfReplyDAO.delete(rnum);
	}
	
	@Transactional
	public int reply(PmfReplyDTO pmfReplyDTO) throws Exception {
		int result = pmfReplyDAO.reply(pmfReplyDTO);
		pmfReplyDAO.stepUpdate(pmfReplyDTO);
		
		return result;
	}
}
