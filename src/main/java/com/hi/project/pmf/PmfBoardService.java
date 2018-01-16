package com.hi.project.pmf;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.hi.file.FileDTO;
import com.hi.project.pmfFile.PmfFileDAO;
import com.hi.project.pmfFile.PmfFileDTO;
import com.hi.project.pmfReply.PmfReplyDAO;
import com.hi.project.util.ListData;
import com.hi.project.util.Pager;

@Service
public class PmfBoardService {

	@Inject
	private PmfBoardDAO boardDAO;
	@Inject
	private PmfReplyDAO pmfReplyDAO;
	@Inject
	private PmfFileDAO pmfFileDAO;
	
	//list
	public ModelAndView selectList(ListData listData) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<PmfBoardDTO> ar = boardDAO.selectList(listData.makeRow());
		//페이징 처리
		int totalCount = boardDAO.getTotalCount(listData.makeRow());
		Pager pager = listData.makePage(totalCount);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("community/listTable");
		
		return mv;
	}
	
	//view
	@Transactional
	public PmfBoardDTO selectOne(int num) throws Exception {
		PmfBoardDTO pmfBoardDTO = boardDAO.selectOne(num);
		boardDAO.hitUpdate(num);
		
		return pmfBoardDTO;
	}
	
	//write 1 - form
	public ModelAndView insert() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<String> major_key = boardDAO.major_key_list();
		List<String> sub_key = boardDAO.sub_key_list("IT/인터넷");
		
		mv.addObject("major_key", major_key);
		mv.addObject("sub_key", sub_key);
		mv.setViewName("community/pmf_write");
		
		return mv;
	}
	
	//write 2 - insert
	@Transactional
	public int insert(PmfBoardDTO pmfBoardDTO, String [] filename, String [] oriname, String [] size) throws Exception {
		int result = boardDAO.insert(pmfBoardDTO);
		
		//fileDTO 생성 및 저장
		PmfFileDTO fileDTO = new PmfFileDTO();
		for(int i=0; i<filename.length; i++){
			fileDTO.setNum(pmfBoardDTO.getNum());
			fileDTO.setFilename(filename[i]);
			fileDTO.setOriname(oriname[i]);
			fileDTO.setFilesize(size[i]);
			pmfFileDAO.insert(fileDTO);
		}
		
		return result;
	}
	
	//update 1 - form
	public ModelAndView update(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		PmfBoardDTO pmfBoardDTO = boardDAO.selectOne(num);
		List<String> major_key = boardDAO.major_key_list();
		List<String> sub_key = boardDAO.sub_key_list(pmfBoardDTO.getMajor_key());
		
		mv.addObject("major_key", major_key);
		mv.addObject("sub_key", sub_key);
		mv.addObject("view", pmfBoardDTO);
		
		return mv;
	}
	
	//update 2 - update
	@Transactional
	public int update(PmfBoardDTO pmfBoardDTO) throws Exception {
		System.out.println(pmfBoardDTO.getNum());
		int result = boardDAO.update(pmfBoardDTO);
		
		//파일 업로드
		
		
		return result;
	}
	
	//delete
	@Transactional
	public int delete(int num, HttpSession session) throws Exception {
		PmfBoardDTO pmfBoardDTO = boardDAO.selectOne(num);
		
		for(FileDTO fileDTO: pmfBoardDTO.getFileDTO()){
			String path = session.getServletContext().getRealPath("resources/pmf_file");
			String fileName = fileDTO.getFilename();
			File file = new File(path, fileName);
			if(file.exists()){
				file.delete();
			}
		}
		
		int result = boardDAO.delete(num);
		pmfFileDAO.deleteAll(num);
		pmfReplyDAO.delete(num);
		
		return result;
	}
	
	public List<String> major_key_list() throws Exception {
		return boardDAO.major_key_list();
	}

	public List<String> sub_key_list(String major_key) throws Exception {
		return boardDAO.sub_key_list(major_key);
	}
	
}
