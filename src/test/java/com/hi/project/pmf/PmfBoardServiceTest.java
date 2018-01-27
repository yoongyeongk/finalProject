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
