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
	
	public void selectOne(int num) throws Exception {
		PmfBoardDTO pmfBoardDTO = boardDAO.selectOne(7);
		boardDAO.hitUpdate(7);
		
		System.out.println("title:"+pmfBoardDTO.getTitle());
		System.out.println("writer:"+pmfBoardDTO.getWriter());
		System.out.println("reg_date:"+pmfBoardDTO.getReg_date());
		System.out.println("hit:"+pmfBoardDTO.getHit());
		System.out.println("major:"+pmfBoardDTO.getMajor_key());
		System.out.println("sub:"+pmfBoardDTO.getSub_key());
		System.out.println("works:"+pmfBoardDTO.getWorks());
		System.out.println("project_name:"+pmfBoardDTO.getProject_name());
		System.out.println("start_date:"+pmfBoardDTO.getStart_date());
		System.out.println("end_date:"+pmfBoardDTO.getEnd_date());
		System.out.println("files:"+pmfBoardDTO.getFileDTO().getFilename());
		System.out.println("project_detail:"+pmfBoardDTO.getProject_detail());
		System.out.println("work_kind:"+pmfBoardDTO.getWork_kind());
		System.out.println("payment:"+pmfBoardDTO.getPmfPaymentDTO().getPay_kind());
		System.out.println("firm_info:"+pmfBoardDTO.getFirm_info());
		System.out.println("addr:"+pmfBoardDTO.getAddr());
		System.out.println("addr_detail:"+pmfBoardDTO.getAddr_detail());
		System.out.println("admin_id"+pmfBoardDTO.getAdmin_id());
		System.out.println("admin_email:"+pmfBoardDTO.getAdmin_email());
		System.out.println("admin_phone:"+pmfBoardDTO.getAdmin_phone());
		System.out.println("duration_kind:"+pmfBoardDTO.getDuration_kind());
		System.out.println("document:"+pmfBoardDTO.getPmfDocumentDTO().getContents());
	}
	
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
			this.selectOne(7);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
