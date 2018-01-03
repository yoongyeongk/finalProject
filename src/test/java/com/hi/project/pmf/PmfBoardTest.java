package com.hi.project.pmf;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.hi.project.AbstractTest;
import com.hi.project.pmf.PmfBoardDAO;
import com.hi.project.util.ListData;

public class PmfBoardTest extends AbstractTest {

	@Inject
	private PmfBoardDAO boardDAO;
	
	public void selectList() throws Exception {
		ListData listData = new ListData();
		List<PmfBoardDTO> ar = boardDAO.selectList(listData.makeRow());
		
		for(PmfBoardDTO dto: ar){
			System.out.print(dto.getTitle()+"  ");
			System.out.print(dto.getWorks()+"  ");
			System.out.println(dto.getProject_name());
		}
	}
	
	public void insert() throws Exception {
		Calendar cal = Calendar.getInstance();
		long date = cal.getTimeInMillis();
		long date2 = date+(1000*60*60*60*24);
		PmfBoardDTO pmfBoardDTO = new PmfBoardDTO();
		pmfBoardDTO.setTitle("test");
		pmfBoardDTO.setWriter("test");
		pmfBoardDTO.setMajor_key("test");
		pmfBoardDTO.setSub_key("test");
		pmfBoardDTO.setWorks("test");
		pmfBoardDTO.setProject_name("test");
		pmfBoardDTO.setStart_date(new Date(date));
		pmfBoardDTO.setEnd_date(new Date(date));
		pmfBoardDTO.setProject_detail("test");
		pmfBoardDTO.setWork_kind("test");
		pmfBoardDTO.setAdmin_id("test");
		pmfBoardDTO.setAdmin_email("test");
		pmfBoardDTO.setAdmin_phone("test");
		pmfBoardDTO.setDuration_kind("마감일 설정");
		pmfBoardDTO.setDuration_end(new Date(date2));
		
		boardDAO.insert(pmfBoardDTO);
		pmfBoardDTO.getNum();
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
