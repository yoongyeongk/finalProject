package com.hi.project.pmf;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.springframework.web.servlet.ModelAndView;

import com.hi.project.AbstractTest;
import com.hi.project.pmf.PmfBoardService;
import com.hi.project.util.ListData;

public class PmfBoardServiceTest extends AbstractTest{

	@Inject
	private PmfBoardService boardService;
	
	public void selectList() throws Exception {
		ListData listData = new ListData();
		ModelAndView mv = boardService.selectList(listData);
		Map<String, Object> map = mv.getModel();
		List<PmfBoardDTO> ar = (List<PmfBoardDTO>)map.get("list");
		
		for(PmfBoardDTO dto: ar) {
			System.out.print(dto.getTitle());
			System.out.print("  ");
			System.out.print(dto.getProject_name());
			System.out.print("  ");
			System.out.println(dto.getSub_key());
		}
	}
	
	public void insert() throws Exception {
		Calendar cal = Calendar.getInstance();
		long date = cal.getTimeInMillis();
		long date2 = date+(1000*60*60*60*24);
		PmfBoardDTO pmfBoardDTO = new PmfBoardDTO();
		pmfBoardDTO.setTitle("aaaa");
		pmfBoardDTO.setWriter("bbbb");
		pmfBoardDTO.setMajor_key("aaaa");
		pmfBoardDTO.setSub_key("aaaa");
		pmfBoardDTO.setWorks("aaaaa");
		pmfBoardDTO.setProject_name("project_name");
		pmfBoardDTO.setStart_date(new Date(date));
		pmfBoardDTO.setEnd_date(new Date(date));
		pmfBoardDTO.setProject_detail("aaaa");
		pmfBoardDTO.setWork_kind("bbbb");
		pmfBoardDTO.setAdmin_id("aaaa");
		pmfBoardDTO.setAdmin_email("aaaa");
		pmfBoardDTO.setAdmin_phone("aaaa");
		pmfBoardDTO.setDuration_kind("상시 모집");
		
		int result = boardService.insert(pmfBoardDTO);
		assertEquals(result, 1);
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
