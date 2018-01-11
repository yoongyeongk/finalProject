package com.hi.project.pmf;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.hi.project.AbstractTest;
import com.hi.project.pmfReply.PmfReplyDAO;
import com.hi.project.pmfReply.PmfReplyDTO;
import com.hi.project.util.ListData;

public class PmfReplyTest extends AbstractTest {

	@Inject
	PmfReplyDAO pmfReplyDAO;
	
	public void delete() throws Exception {
		int result = pmfReplyDAO.delete(3);
		
		assertEquals(result, 1);
		System.out.println(1);
	}
	
	public void update() throws Exception {
		PmfReplyDTO pmfReplyDTO = new PmfReplyDTO();
		pmfReplyDTO.setRnum(1);
		pmfReplyDTO.setContents("test Reply");
		
		int result = pmfReplyDAO.update(pmfReplyDTO);
		
		assertEquals(result, 1);
		System.out.println(1);
	}
	
	public void insert() throws Exception {
		PmfReplyDTO pmfReplyDTO = new PmfReplyDTO();
		pmfReplyDTO.setNum(10);
		pmfReplyDTO.setWriter("yoon");
		pmfReplyDTO.setContents("test Reply");
		
		int result  = pmfReplyDAO.insert(pmfReplyDTO);
		
		assertEquals(result, 1);
	}
	
	public void selectList() throws Exception {
		ListData listData = new ListData();
		List<PmfReplyDTO> ar = pmfReplyDAO.selectList(listData.makeRow());
		for(PmfReplyDTO dto: ar) {
			System.out.print(dto.getWriter()+" ");
			System.out.println(dto.getContents());
		}
	}
	
	@Test
	public void test() {
		try {
			this.delete();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
