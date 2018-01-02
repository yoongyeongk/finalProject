package com.hi.project.pmf;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.Calendar;

import javax.inject.Inject;

import org.junit.Test;

import com.hi.project.AbstractTest;
import com.hi.project.pmf.PmfBoardDAO;

public class PmfBoardTest extends AbstractTest {

	@Inject
	private PmfBoardDAO boardDAO;
	
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
		pmfBoardDTO.setDuration_kind("마감일 선택");
		pmfBoardDTO.setDuration_end(new Date(date2));
		
		boardDAO.insert(pmfBoardDTO);
		pmfBoardDTO.getNum();
	}
	
	@Test
	public void test() {
		try {
			this.insert();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
