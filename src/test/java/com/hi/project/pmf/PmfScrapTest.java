package com.hi.project.pmf;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.hi.project.AbstractTest;
import com.hi.project.pmfScrap.PmfScrapDAO;
import com.hi.project.pmfScrap.PmfScrapDTO;

public class PmfScrapTest extends AbstractTest {

	@Inject
	private PmfScrapDAO pmfScrapDAO;
	
	public void selectList() throws Exception {
		List<PmfScrapDTO> ar = pmfScrapDAO.selectList("nickname");
		for(PmfScrapDTO dto: ar) {
			System.out.println(dto.getPmfBoardDTO());
			System.out.println(dto.getPmfBoardDTO().getTitle());
			System.out.println(dto.getPmfBoardDTO().getAdmin_id());
			System.out.println("---------------------");
		}
	}
	
	public void insert() throws Exception {
		PmfScrapDTO pmfScrapDTO = new PmfScrapDTO();
		pmfScrapDTO.setNum(4);
		pmfScrapDTO.setNickname("nickname");
		
		int result = pmfScrapDAO.insert(pmfScrapDTO);
		
		assertEquals(result, 1);
	}
	
	@Test
	public void test() {
		try {
			this.selectList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
